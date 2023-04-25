package kr.co.house.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor


// 메인 메뉴 > 숙박 상품들 나열용.  HOUSE Table에서 조건에 따라 일정 수의 row만큼 조회하기 위한 VO


public class HouseListing {
	private String houseTitle;			// 상품 웹페이지에 노출될 제목
	private String[] htKeywords;		// houseTitle을 띄어쓰기 단위로 split
	private String houseCity;			// 광역시/도
	private float houseScore;			// 별평점
	private String roomTitle;			// 숙박소이름      예) XX펜션, ABC하우스
	private String[] rtKeywords;		// roomTitle을 띄어쓰기 단위로 split
	private int roomCapaMin;			// X인실
	private int roomCapaMax;			// X인실

	private int housePriceMin;			// 1박당 가격 최소 조건
	private int housePriceMax;			// 1박당 가격 최대 조건
	private int houseBarbecue;			// 0:바베큐 불가, 1:가능
	private int houseParty;				// 0:파티 불가, 1:가능
	
	private int sortingOrder;			// 1:높은가격순 / 2:낮은가격순 / 3:높은평점순

	private int pagingStart;			// 목록 한 페이지만 조회할 때 시작 번호
	private int pagingEnd;				// 목록 한 페이지만 조회할 때 끝 번호
}
