package kr.co.house.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor


// 객실_목록 테이블 ROOM Table
// 이 테이블의 Row가 방 1개를 가리킴


public class Room {
	private int roomNo;					// Primary key
	private String roomTitle;			// 숙박소이름   예) XX펜션, ABC하우스
	private int roomCapa;				// X인실. 객실 종류라고 인지하면 됨.
	private String memberId;			// 객실을 등록한 판매자의 MEMBER_ID
	private String roomName;			// 숙박업소에서 방마다 지어준 개별이름.  예) 101호, 해돋이방, 특실1 
	private String roomDescription;		// 숙박업소에서 방에 대해 주석을 다는 곳. 일반고객들에게 노출시키지 않음(상품페이지에서 노출시킬 일 없음).
	private int roomEnable;				// 1 = 사용가능(판매중)      0 = 사용중지(현재는 고객받지 않음)
	private int houseNo;				// join용으로 만든 왜래키. where roomTitle & roomCapa 대신에 where houseNo로 가능

	private String roomNames[];			// 다중 등록을 위해 roomName들을 저장할 배열
}
