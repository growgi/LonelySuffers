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



// 문의 내용 수정.  Inquiry 테이블에서 Row 1개 수정
	@ResponseBody
	@RequestMapping(value="/updateInquiry.do", produces = "application/text; charset=utf8")
	public String updateInquiry(Inquiry i, HttpSession session) {
		Member me = (Member)session.getAttribute("m");
		Inquiry compare = service.selectOneInquiry(i.getInquiryNo());
		if(me.getMemberId().equals(compare.getInquirer())) {
			ArrayList<Answer> ia = service.selectAllAnswerByInquiry(i.getInquiryNo());
			if(ia.size()>0) {
				return "이미 답변이 등록되어 있습니다. 새로운 문의를 등록해주십시오.";
			}else {
				int result = service.updateInquiry(i);
				if(result>0) {
					return "문의글을 수정했습니다.";
				}else {
					return "알 수 없는 이유로 문의글 수정에 실패했습니다.";
				}
			}
		}else {
			return "본인이 작성한 것만 수정할 수 있습니다.";
		}
	}



// 문의 삭제.  Inquiry 테이블에서 Row 1개 삭제
	@ResponseBody
	@RequestMapping(value="/deleteInquiry.do", produces = "application/text; charset=utf8")
	public String deleteInquiry(int inquiryNo, HttpSession session) {
		Member me = (Member)session.getAttribute("m");
		if(me.getMemberGrade()==1) {
			int result = service.deleteInquiry(inquiryNo);
			if(result>0) {
				return "문의글을 삭제했습니다.";
			}else {
				return "알 수 없는 이유로 문의글 삭제에 실패했습니다.";
			}
		}else {
			Inquiry compare = service.selectOneInquiry(inquiryNo);
			if(me.getMemberId().equals(compare.getInquirer())) {
				int result = service.deleteInquiry(inquiryNo);
				if(result>0) {
					return "문의글을 삭제했습니다.";
				}else {
					return "알 수 없는 이유로 문의글 삭제에 실패했습니다.";
				}
			}else {
				return "본인이 작성한 것만 삭제할 수 있습니다.";
			}
		}
	}



// 신규 답변 추가.  Answer 테이블에 Row 1개 추가
	@ResponseBody
	@RequestMapping(value="/insertAnswer.do", produces = "application/text; charset=utf8")
	public String insertAnswer(Answer ia, int productCategory, int productNo, HttpSession session) {
		Member me = (Member)session.getAttribute("m");
		if(me.getMemberGrade() != 2) {
			return "판매자 회원만이 답변을 등록할 수 있습니다.";
		}else {
			if(productCategory==1) {
				Lesson l = lService.selectOneLesson(productNo);
				if(!me.getMemberId().equals(l.getWriter())) {
					return "본인의 판매 상품에만 답변을 등록할 수 있습니다.";
				}else {
					ia.setAnswerWriter(me.getMemberId());
					int result = service.insertAnswer(ia);
					if(result>0) {
						return "답변을 등록했습니다.";
					}else {
						return "알 수 없는 이유로 답변 등록에 실패했습니다.";
					}
				}
			}else if(productCategory==2) {
				House h = hService.selectOneHouse(productNo);
				if(!me.getMemberId().equals(h.getWriter())) {
					return "본인의 판매 상품에만 답변을 등록할 수 있습니다.";
				}else {
					ia.setAnswerWriter(me.getMemberId());
					int result = service.insertAnswer(ia);
					if(result>0) {
						return "답변을 등록했습니다.";
					}else {
						return "알 수 없는 이유로 답변 등록에 실패했습니다.";
					}
				}
			}else {
				return "알 수 없는 이유로 답변 등록에 실패했습니다.";
			}
		}
	}


// 답변 내용 수정.  Answer 테이블에서 Row 1개 수정
	@ResponseBody
	@RequestMapping(value="/updateAnswer.do", produces = "application/text; charset=utf8")
	public String updateAnswer(Answer ia, HttpSession session) {
		Member me = (Member)session.getAttribute("m");
		Answer compare = service.selectOneAnswer(ia.getAnswerNo());
		if(me.getMemberId().equals(compare.getAnswerWriter())) {
			int result = service.updateAnswer(ia);
			if(result>0) {
				return "답변을 수정했습니다.";
			}else {
				return "알 수 없는 이유로 답변 수정에 실패했습니다.";
			}
		}else {
			return "본인이 작성한 것만 수정할 수 있습니다.";
		}
	}



// 문의 삭제.  Inquiry 테이블에서 Row 1개 삭제
	@ResponseBody
	@RequestMapping(value="/deleteAnswer.do", produces = "application/text; charset=utf8")
	public String deleteAnswer(int answerNo, HttpSession session) {
		Member me = (Member)session.getAttribute("m");
		if(me.getMemberGrade()==1) {
			int result = service.deleteAnswer(answerNo);
			if(result>0) {
				return "답변을 삭제했습니다.";
			}else {
				return "알 수 없는 이유로 답변 삭제에 실패했습니다.";
			}
		}else {
			Answer compare = service.selectOneAnswer(answerNo);
			if(me.getMemberId().equals(compare.getAnswerWriter())) {
				int result = service.deleteAnswer(answerNo);
				if(result>0) {
					return "답변을 삭제했습니다.";
				}else {
					return "알 수 없는 이유로 답변 삭제에 실패했습니다.";
				}
			}else {
				return "본인이 작성한 것만 삭제할 수 있습니다.";
			}
		}
	}

}
