package kr.co.member.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class WishList {
	private int wishNo;
	private String memberId;
	private int house_no;
	private int lesson_no;
	
	private int lessonNo;				// Primary key
	private int lessonLevel;			// 1 = 초급 / 2 = 중급 / 3 = 상급
	private String lessonTitle;			// 상품 웹페이지에 노출될 제목
	private String lessonCity;			// 광역시/도   부분만. 지역별 필터링에 쓸 것.
	private int lessonPrice;			// 강습(상품) 가격
	private String lessonInfoPic;		// 첨부사진. 본문 첨부가 아니라 첨부파일임.
	private String lessonTeacher;		// 강사이름. MEMBER_NAME을 가져오는게 아니라, 판매자가 임의로 적는 값		
	private int lessonMaxNo;			// 수업 당 정원. 최대재고량으로 인지하면 됨.
	private String lessonStartTime;		// "HH:MM " 시작시간만, default(선택시간) 로우  하나 더
	private String lessonEndTime;		// "HH:MM " 종료시간만
	private int lessonStatus;			/* 상품 상태. 노출 여부를 결정함.
											1 = 판매중. 전체공개
											0 = 판매중지
											-1 = 승인대기중. DB에는 insert됐지만, 고객들에게 노출되지는 않는 상품(게시물).	*/
	private int lessonScore;			// 별평점후기 Table (RIVEIW)이 변경될때마다, oracle에서 trigger가 작동해서 LESSON 테이블의 LESSON_SCORE를 갱신
	
	private int houseNo;				// Primary key
	private String houseTitle;			// 상품 웹페이지에 노출될 제목
	private String houseCity;			// 광역시/도   부분만. 지역별 필터링에 쓸 것.
	private String houseAddress;		// 주소명 전체를 담음.    예) 부산광역시 해운대구 XX로 123-2
	private String housePhoto1;			// 첨부파일1 대표로 노출되는 사진
	private int houseStatus;		/*     상품 상태. 노출 여부를 결정함.
										   1 = 판매중. 전체공개
										   0 = 판매중지
										  -1 = 승인대기중. DB에는 insert됐지만, 고객들에게 노출되지는 않는 상품(게시물).	*/

	private int houseScore;				// 별평점후기 Table (RIVEIW)이 변경될때마다, oracle에서 trigger가 작동해서 HOUSE 테이블의 HOUSE_SCORE를 갱신
	private String roomTitle;			// 숙박소이름      예) XX펜션, ABC하우스
	private int roomCapa;				// X인실. 객실 종류라고 인지하면 됨.

	private int housePrice;				//1박당 가격, 할인/ 할증이 적용되지 않은 무보정 기본 가격
	
}
