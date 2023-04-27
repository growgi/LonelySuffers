package kr.co.house.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor


// 객실_예약 테이블   ROOM_BOOK Table
// 이 테이블의 Row가 고객이 예약(구매)한 단위. 따라서 동일한 객실에 같은 날짜의 예약(결제완료) 내역이 존재할 수 없음.


public class RoomBook {
	private int roomBookNo;				// Primary key
	private int roomNo;					// 예약한 객실(Room)의 고유 번호
	private int memberNo;				// 예약한 고객의 MEMBER_NO
	private String bookStartDate;		// 예약기간 첫날의 YYYY-MM-DD
	private String bookEndDate;			/* 예약기간 마지막날의 YYYY-MM-DD   그러나 퇴실 날짜에도 다른 고객이 오후부터 입실 가능해야 하므로, -1일 한 값을 저장함.
											예를 들어 4월 30일 오전 11시 퇴실이면, bookEndDate에는 2023-04-29를 저장하고, 사용자들한테는 +1해서 4월 30일 퇴실로 보여줌 */
	private int houseNo;				// 숙박 상품(House)의 고유 번호
	private int roomBookPrice;		/*	     모든 비용을 계산한 후 넣어줄 변수.
										     일 별로 가격을 계산해야함. 예를 들어,
										   5월 1일 (수) 평일 비수기  |  5월 2일 (목) 평일 성수기  |  5월 3일 (금) 주말  |  5월 4일 (토) 주말  |  5월 5일 (일) 평일 성수기
										     로 객실을 예약하고, 20000원짜리 옵션을 선택했다면,
										   [10000 + (10000×할증1) + (10000×할증2) + (10000×할증2) + (10000×할증1)]    + 20000
										     을 일별로 계산해서 대입시켜 줌. */
	private String optionDetail;		// 선택된 옵션 상품들의 내역을 String으로 저장함. 예시) houseBarbecue + " " + houseBarbecuePrice + "원 " houseParty + " " housePartyPrice + "원"

}
