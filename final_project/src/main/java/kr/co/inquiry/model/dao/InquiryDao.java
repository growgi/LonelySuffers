package kr.co.inquiry.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.inquiry.model.vo.Answer;
import kr.co.inquiry.model.vo.Inquiry;
import kr.co.inquiry.model.vo.InquiryListing;

@Repository
public class InquiryDao {

	@Autowired
	private SqlSessionTemplate sqlSession;


// 하나의 상품에 대한 문의글들 조회. productCategory와 productNo를 조건으로 Row 여러개 조회 후 반환
	public ArrayList<Inquiry> selectInquiriesByProduct(InquiryListing condition) {
		List list = sqlSession.selectList("i.selectInquiriesByProduct", condition);
		return (ArrayList<Inquiry>)list;
	}



// 하나의 상품에 대한 문의글들의 개수
	public int totalNumberOfInquiriesByProduct(InquiryListing condition) {
		return sqlSession.selectOne("i.totalNumberOfInquiriesByProduct", condition);
	}



// 문의 내용 보기.  Inquiry 테이블에서 Row 1개 전체 조회 후 반환
	public Inquiry selectOneInquiry(int inquiryNo) {
		return sqlSession.selectOne("i.selectOneInquiry", inquiryNo);
	}



// 문의에 대한 모든 답변들 보기.   Answer 테이블에서 Row 0개 이상 조회 후 반환
	public ArrayList<Answer> selectAllAnswerByInquiry(int inquiryNo) {
		List list = sqlSession.selectList("i.selectAllAnswer", inquiryNo);
		return (ArrayList<Answer>)list;
	}
}
