package kr.co.inquiry.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kr.co.house.model.service.HouseService;
import kr.co.house.model.vo.House;
import kr.co.inquiry.model.service.InquiryService;
import kr.co.inquiry.model.vo.Answer;
import kr.co.inquiry.model.vo.Inquiry;
import kr.co.inquiry.model.vo.InquiryListing;
import kr.co.inquiry.model.vo.InquiryPagination;
import kr.co.lesson.model.service.LessonService;
import kr.co.lesson.model.vo.Lesson;
import kr.co.member.model.vo.Member;

@Controller
public class InquiryController {

	@Autowired
	private InquiryService service;
	@Autowired
	private HouseService hService;
	@Autowired
	private LessonService lService;


// 하나의 상품에 대한 문의글들 조회. productCategory와 productNo를 조건으로 Row 여러개 조회 후 반환
	@ResponseBody
	@RequestMapping(value="/getInquiries.do", produces = "application/text; charset=utf8")
	public String selectInquiriesByProduct(int reqPage, int productCategory, int productNo, int range, HttpSession session) {
		InquiryListing condition = new InquiryListing();
		condition.setProductCategory(productCategory);
		condition.setProductNo(productNo);
		condition.setRange(range);
		if(range>0) {
			condition.setLoggedId("뷁뷁뷁뷁뷁");
			Member me = (Member)session.getAttribute("m");
			if(me != null) {
				condition.setLoggedId(me.getMemberId());
			}
		}
		InquiryPagination ip = service.selectInquiriesByProduct(condition, reqPage);
		return new Gson().toJson(ip);
	}



// 문의 내용 보기.    INQUIRY 테이블에서 Row 1개 조회 후 반환.  ANSWER 테이블을 Join해서 ANSWER 0개 이상 반환.
	@ResponseBody
	@RequestMapping(value="/inquiryView.do", produces = "application/text; charset=utf8")
	public String selectOneInquiry(int inquiryNo, int productCategory, int productNo, HttpSession session) {
		Inquiry i = service.selectOneInquiry(inquiryNo);
		ArrayList<Answer> ia = service.selectAllAnswerByInquiry(inquiryNo);
		i.setAnswerList(ia);
		if(i.getPrivately()>0) {
			Member me = (Member)session.getAttribute("m");
			
			if(me != null) {
				if(me.getMemberGrade()==1) { return new Gson().toJson(i); }
				
				else if(me.getMemberGrade()==2) {
					if(productCategory==1) {
						Lesson l = lService.selectOneLesson(productNo);
						if(!me.getMemberId().equals(l.getWriter())) {
							i.setInquiryNo(0);
							i.setInquiryContent("본인의 등록한 상품의 비밀문의글만 조회할 수 있습니다.");
						}
					}else if(productCategory==2) {
						House h = hService.selectOneHouse(productNo);
						if(!me.getMemberId().equals(h.getWriter())) {
							i.setInquiryNo(0);
							i.setInquiryContent("본인의 등록한 상품의 비밀문의글만 조회할 수 있습니다.");
						}
					}
				}
				
				else if(me.getMemberGrade()==3) {
					if(me.getMemberId().equals(i.getInquirer())) {
						return new Gson().toJson(i);
					}else {
						i.setInquiryNo(0);
						i.setInquiryContent("비밀글은 본인이 작성한 것만 조회할 수 있습니다.");
					}
				}
			}else {
				i.setInquiryNo(0);
				i.setInquiryContent("비밀글은 작성자 본인의 로그인이 필요합니다.");
			}
		}
		return new Gson().toJson(i);
	}



// 신규 문의 추가.  Inquiry 테이블에 Row 1개 추가
	@ResponseBody
	@RequestMapping(value="/insertInquiry.do", produces = "application/text; charset=utf8")
	public String insertInquiry(Inquiry i, HttpSession session) {
		Member me = (Member)session.getAttribute("m");
		if(me.getMemberGrade() != 3) {
			return "일반회원만이 문의글을 등록할 수 있습니다.";
		}else {
			i.setInquirer(me.getMemberId());
			int result = service.insertInquiry(i);
			if(result>0) {
				return "문의글을 등록했습니다.";
			}else {
				return "알 수 없는 이유로 문의글 등록에 실패했습니다.";
			}
		}
	}


// 문의 수정.  Inquiry 테이블에서 Row 1개 수정
	@ResponseBody
	@RequestMapping(value="/updateInquiry.do", produces = "application/text; charset=utf8")
	public String updateInquiry(Inquiry i, HttpSession session) {
		Member me = (Member)session.getAttribute("m");
		if(me.getMemberId().equals(i.getInquirer())) {
			i.setInquirer(me.getMemberId());
			int result = service.updateInquiry(i);
			if(result>0) {
				return "문의글을 수정했습니다.";
			}else {
				return "알 수 없는 이유로 문의글 수정에 실패했습니다.";
			}
		}else {
			return "본인이 작성한 것만 수정할 수 있습니다.";
		}
	}

}
