package kr.co.lesson.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor


//메인 메뉴 > 강습 상품들 나열용.  LESSON Table에서 조건에 따라 일정 수의 row만큼 조회하기 위한 VO


public class LessonListing {
	private int lessonLevel;			// 1 = 초급 / 2 = 중급 / 3 = 상급
	private String lessonTitle;			// 상품 웹페이지에 노출될 제목
	private String[] ltKeywords;		// lessonTitle을 띄어쓰기 단위로 split
	
	private String lessonCity;			// 광역시/도   부분만. 지역별 필터링에 쓸 것.
	private int lessonPriceMin;			// 강습 가격 최소 조건
	private int lessonPriceMax;			// 강습 가격 최대 조건
	private float lessonScore;			// 별평점
	
	private int sortingOrder;			// 1:높은가격순 / 2:낮은가격순 / 3:높은평점순

	private int pagingStart;			// 목록 한 페이지만 조회할 때 시작 번호
	private int pagingEnd;				// 목록 한 페이지만 조회할 때 끝 번호
}
