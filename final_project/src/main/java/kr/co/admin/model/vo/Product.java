package kr.co.admin.model.vo;

public class Product {
	
	/**Lesson*/
	private int lessonNo;				// Primary key
	private String lessonTitle;			// 상품 웹페이지에 노출될 제목
	private String lessonCity;			// 광역시/도   부분만. 지역별 필터링에 쓸 것.
	private String lessonInfoPic;		// 첨부사진. 본문 첨부가 아니라 첨부파일임.
	private int lessonStatus;			/* 상품 상태. 노출 여부를 결정함.
											1 = 판매중. 전체공개
											0 = 판매중지
										   -1 = 승인대기중. DB에는 insert됐지만, 고객들에게 노출되지는 않는 상품(게시물)
											   -2 = 승인 반려됨. DB에는 insert됐지만, 고객들에게 노출되지는 않는 상품(게시물)	*/
	private int lessonScore;			// 별평점후기 Table (RIVEIW)이 변경될때마다, oracle에서 trigger가 작동해서 LESSON 테이블의 LESSON_SCORE를 갱신
	private String lessonWriter;		// 상품등록자의 MEMBER_ID (글쓴이)
	
	/**House*/
	private int houseNo;				// Primary key
	private String houseTitle;			// 상품 웹페이지에 노출될 제목
	private String houseCity;			// 광역시/도   부분만. 지역별 필터링에 쓸 것.
	private String housePhoto1;			// 첨부파일1 대표로 노출되는 사진
	private int houseStatus;			/*상품 상태. 노출 여부를 결정함.
										   1 = 판매중. 전체공개
										   0 = 판매중지
										  -1 = 승인대기중. DB에는 insert됐지만, 고객들에게 노출되지는 않는 상품(게시물)
										  -2 = 승인 반려됨. DB에는 insert됐지만, 고객들에게 노출되지는 않는 상품(게시물)	*/
	private int houseScore;				// 별평점후기 Table (RIVEIW)이 변경될때마다, oracle에서 trigger가 작동해서 HOUSE 테이블의 HOUSE_SCORE를 갱신
	private String houseWriter;			// 상품등록자의 MEMBER_ID (글쓴이)
	
}
