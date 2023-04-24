package kr.co.inquiry.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor


// 문의 테이블   INQUIRY Table에서 productCategory와 productNo를 조건으로 일정 수의 row만큼 조회하기 위한 VO


public class InquiryListing {
	private int productCategory;			// 대응할 상품 종류.    1 = 강습 상품    /  2 = 숙박 상품
	private int productNo;					// 대응할 상품의 번호(Primary key)

	private int pagingStart;				// 문의글 목록 한 페이지만 조회할 때 시작 번호
	private int pagingEnd;					// 문의글 목록 한 페이지만 조회할 때 끝 번호
	private int range;						// 조회 범위 조건. 0이면 전부 조회, 1이면 내가 작성한 것들만 조회
	private String loggedId;				// 현재 로그인한 계정의 ID
}
