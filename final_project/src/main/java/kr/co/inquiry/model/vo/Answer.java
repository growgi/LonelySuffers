package kr.co.inquiry.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor


// 문의에 대한 답변(댓글) 테이블   ANSWER Table
// inquiryNo를 조건으로 조회해서 ajax로 불러올 row


public class Answer {
	private int answerNo;					// Primary key
	private int inquiryNo;					// join용으로 만든 왜래키. 댓글이 달릴 문의 게시물의 번호
	private String answerContent;			// 문의에 대한 답변 내용
	private String answerWriter;			// 답변 등록자의 MEMBER_ID (댓글쓴이)
}
