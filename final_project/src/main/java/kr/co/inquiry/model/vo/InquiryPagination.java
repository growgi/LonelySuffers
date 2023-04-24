package kr.co.inquiry.model.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor

public class InquiryPagination {
	private int totalCount;					// 하나의 상품에 대한 전체 문의글 수
	private ArrayList<Inquiry> list;		// 문의글들
	private String pageNavi;				// class가 pagination인 ul태그 전체
	private int start;						// 문의글 목록 한 페이지만 조회할 때 시작할 번호
}
