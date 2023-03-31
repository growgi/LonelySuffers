package ko.co.house.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor


// 숙박_옵션 테이블 ROOM_OPTION Table


public class RoomOption {
	private int optionNo;				// Primary key
	private int optionChoice;			// 선택지 종류             1=바베큐       2=파티       3=바베큐+파티
	private int optionPrice;			// 선택지의 가격
}
