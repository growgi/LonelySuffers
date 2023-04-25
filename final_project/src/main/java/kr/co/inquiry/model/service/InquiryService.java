package kr.co.inquiry.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.inquiry.model.dao.InquiryDao;
import kr.co.inquiry.model.vo.Answer;
import kr.co.inquiry.model.vo.Inquiry;
import kr.co.inquiry.model.vo.InquiryListing;
import kr.co.inquiry.model.vo.InquiryPagination;

@Service
public class InquiryService {

	@Autowired
	private InquiryDao dao;



// replaceAt 함수 정의. ID의 4번째 글자부터 *로 대체시킴.
	public String replaceAt(String decrypted) {
		String encrypted = decrypted;
		for(int i=3; i<encrypted.length(); i++) {
			String head = encrypted.substring(0, i);
			String tail = encrypted.substring(i+1);
			encrypted = head + "*" + tail;
		}
	    return encrypted;
	}



// 하나의 상품에 대한 문의글들 조회. productCategory와 productNo를 조건으로 Row 여러개 조회 후 반환
	public InquiryPagination selectInquiriesByProduct(InquiryListing condition, int reqPage) {
		int numPerPage = 10;	// 문의글 한 페이지 당 문의글 10개씩 출력
		condition.setPagingEnd(numPerPage * reqPage);
		condition.setPagingStart(numPerPage * (reqPage-1) + 1);
		ArrayList<Inquiry> list = dao.selectInquiriesByProduct(condition);
		
		for(int i=0; i<list.size(); i++) {
			Inquiry getInq = list.get(i);
			getInq.setInquirer(replaceAt(list.get(i).getInquirer()));
			list.set(i, getInq);
		}
		
		int totalCount = dao.totalNumberOfInquiriesByProduct(condition);
		
	// pagination 출력 구문 시작
		int maxPage = 0;
		if(totalCount%numPerPage == 0) { maxPage = totalCount/numPerPage;
		} else { maxPage = totalCount/numPerPage + 1; }
		
		int pageNaviSize = 5;	// 페이지 이동 버튼 표시 수		
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize + 1;
		
		String pageNavi = "<ul class='pagination'>";
		if(pageNo != 1) {
			pageNavi += "<li>";
			pageNavi += "<a href='javascript:getInquiries("+(pageNo-1)+", "+condition.getRange()+")'>";
			pageNavi += "＜";
			pageNavi += "</a></li>";
		}
		
		for(int i=0; i<pageNaviSize; i++) {
			if(pageNo == reqPage) {
				pageNavi += "<li>";
				pageNavi += "<a class='active' href='javascript:getInquiries("+pageNo+", "+condition.getRange()+")'>";
				pageNavi += pageNo;
				pageNavi += "</a></li>";
			}else {
				pageNavi += "<li>";
				pageNavi += "<a href='javascript:getInquiries("+pageNo+", "+condition.getRange()+")'>";
				pageNavi += pageNo;
				pageNavi += "</a></li>";
			}
			pageNo++;
			if(pageNo > maxPage) {
				break;
			}
		}

		if(pageNo <= maxPage) {
			pageNavi += "<li>";
			pageNavi += "<a href='javascript:getInquiries("+pageNo+", "+condition.getRange()+")'>";
			pageNavi += "＞";
			pageNavi += "</a></li>";
		}
		
		pageNavi += "</ul>";
	// pagination 출력 구문 끝

		return new InquiryPagination(totalCount, list, pageNavi, condition.getPagingStart());
	}



// 문의 내용 보기.  Inquiry 테이블에서 Row 1개 전체 조회 후 반환
	public Inquiry selectOneInquiry(int inquiryNo) {
		return dao.selectOneInquiry(inquiryNo);
	}



// 문의에 대한 모든 답변들 보기.   Answer 테이블에서 Row 0개 이상 조회 후 반환
	public ArrayList<Answer> selectAllAnswerByInquiry(int inquiryNo) {
		return dao.selectAllAnswerByInquiry(inquiryNo);
	}



// answerWriter을 비교하기 위해  Answer 테이블에서 Row 1개 이상 조회 후 반환
	public Answer selectOneAnswer(int answerNo) {
		return dao.selectOneAnswer(answerNo);
	}



	@Transactional
// 신규 문의 추가.  Inquiry 테이블에 Row 1개 추가
	public int insertInquiry(Inquiry i) {
		return dao.insertInquiry(i);
	}



	@Transactional
// 문의 내용 수정.  Inquiry 테이블에서 Row 1개 수정
	public int updateInquiry(Inquiry i) {
		return dao.updateInquiry(i);
	}



	@Transactional
// 문의 삭제.  Inquiry 테이블에서 Row 1개 삭제
	public int deleteInquiry(int inquiryNo) {
		return dao.deleteInquiry(inquiryNo);
	}



	@Transactional
// 신규 답변 추가.  Answer 테이블에 Row 1개 추가
	public int insertAnswer(Answer ia) {
		return dao.insertAnswer(ia);
	}



	@Transactional
// 답변 내용 수정.  Answer 테이블에서 Row 1개 수정
	public int updateAnswer(Answer ia) {
		return dao.updateAnswer(ia);
	}



	@Transactional
// 답변 삭제.  Answer 테이블에서 Row 1개 삭제
	public int deleteAnswer(int answerNo) {
		return dao.deleteAnswer(answerNo);
	}
}
