package kr.co.house.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor


// 숙박 테이블   HOUSE Table
// 이 테이블의 Row가 웹페이지에 표시되는 게시물 단위


public class House {
	private int houseNo;				// Primary key
	private String houseTitle;			// 상품 웹페이지에 노출될 제목
	private String houseCity;			// 광역시/도   부분만. 지역별 필터링에 쓸 것.
	private String houseAddress;		// 주소명 전체를 담음.    예) 부산광역시 해운대구 XX로 123-2
	private String houseDescription;	// 게시글에서 내용(content)이라고 인지하면 됨.
	private String housePhoto1;			// 첨부파일1 대표로 노출되는 사진
	private String housePhoto2;			// 첨부파일2
	private String housePhoto3;			// 첨부파일3
	private String housePhoto4;			// 첨부파일4
	private int houseStatus;		/*     상품 상태. 노출 여부를 결정함.
										   1 = 판매중. 전체공개
										   0 = 판매중지
										  -1 = 승인대기중. DB에는 insert됐지만, 고객들에게 노출되지는 않는 상품(게시물)
	  									  -2 = 승인 반려됨. DB에는 insert됐지만, 고객들에게 노출되지는 않는 상품(게시물)	*/

	private float houseScore;				// 별평점후기 Table (RIVEIW)이 변경될때마다, oracle에서 trigger가 작동해서 HOUSE 테이블의 HOUSE_SCORE를 갱신
	private String writer;				// 상품등록자의 MEMBER_ID (글쓴이)
	private String roomTitle;			// 숙박소이름      예) XX펜션, ABC하우스
	private int roomCapa;				// X인실. 객실 종류라고 인지하면 됨.

	private int housePrice;				// 1박당 가격, 할인/할증이 적용되지 않은 무보정 기본 가격
	private int houseBarbecue;			// 0:안쓰는 것, 1:쓰는것
	private int houseBarbecuePrice;		// 숙박별 바베큐가격
	private int houseParty;				// 0:안쓰는 것, 1:쓰는것
	private int housePartyPrice;		// 숙박별 파티가격
	private String houseLng;			// 숙박 경도
	private String houseLat;			// 숙박 위도
	private String rejectComment;		// houseStatus -1인 게시물을 관리자가 반려해서 -2로 상태를 바꿀 때, 사유를 입력하는 란
	
	private String bookStartDate;		// 예약시작일
	private String bookEndDate;			// 예약끝나는 날(퇴실-1)일
	private int roomNo;
	private String roomName;
	
	
	

	
	public String getHouseDescriptionBr() {
		return houseDescription.replaceAll("\r\n","<br>");
	}

}
