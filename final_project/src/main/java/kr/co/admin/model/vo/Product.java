package kr.co.admin.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Product {
	private String productType;
	
	private int productNo;				// Primary key
	private String productTitle;			// 상품 웹페이지에 노출될 제목
	private String productCity;			// 광역시/도   부분만. 지역별 필터링에 쓸 것.
	private String productPic;		// 첨부사진. 본문 첨부가 아니라 첨부파일임.
	private int productStatus;			/* 상품 상태. 노출 여부를 결정함.
											1 = 판매중. 전체공개
											0 = 판매중지
										   -1 = 승인대기중. DB에는 insert됐지만, 고객들에게 노출되지는 않는 상품(게시물)
											   -2 = 승인 반려됨. DB에는 insert됐지만, 고객들에게 노출되지는 않는 상품(게시물)	*/
	private float productScore;			// 별평점후기 Table (RIVEIW)이 변경될때마다, oracle에서 trigger가 작동해서 LESSON 테이블의 LESSON_SCORE를 갱신
	private String productWriter;		// 상품등록자의 MEMBER_ID (글쓴이)
}
