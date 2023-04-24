package kr.co.inquiry.model.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor


// 문의 테이블   INQUIRY Table
// 각 상품에 맞게 productCategory와 productNo를 조건으로 조회해서 ajax로 불러올 row


public class Inquiry {
	private int inquiryNo;					// Primary key
	private String inquirer;				// 문의글 등록자의 MEMBER_ID (글쓴이)
	private String inquiryTitle;			// 문의글 제목
	private String inquiryContent;			// 문의글 내용
	private String regDate;					// 등록일  SYSDATE,'YYYY-MM-DD HH24:mi:SS'
	private int privately;					// 0 = 모두 공개    /  1 = 비공개. 작성자와 상품판매자와 관리자만 읽을 수 있음
	private int productCategory;			// 대응할 상품 종류.    1 = 강습 상품    /  2 = 숙박 상품
	private int productNo;					// 대응할 상품의 번호(Primary key)

	private int answered;					// 0 = 달린 댓글 없음. 미답변 상태    /   1+ = 달린 댓글 있음. 답변된 상태
	private ArrayList<Answer> answerList;	// 문의에 대한 답변들 전체를 답는 ArrayList
}
