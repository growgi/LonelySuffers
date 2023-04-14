package kr.co.house.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor

public class FindRoomByCondition {
	private String roomTitle;			// 숙박소이름      예) XX펜션, ABC하우스
	private int roomCapa;				// X인실. 객실 종류라고 인지하면 됨.
	private String roomNames[];			// 숙박소이름      예) XX펜션, ABC하우스
}
