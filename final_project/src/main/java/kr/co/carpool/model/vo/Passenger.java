package kr.co.carpool.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Passenger {
	private int matchNo;
	private int matchStatus; //0. 매칭완료 1.매칭중 2.매칭취소
	private int carpoolNo;
	private int passengerNo;
	private String passengerName;
	private int passengerGender;
	private String passengerPhone;
	private String passengerEmail;
	private String passengerMsg;
}
