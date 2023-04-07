package kr.co.carpool.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
//insert용 input 매개변수.
public class CarpoolMatch {
	private int carpoolNo;
	private int passengerNo;
	private String passengerMsg;
}
