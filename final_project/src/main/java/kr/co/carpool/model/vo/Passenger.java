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
	private String passengerName; //JOIN으로 얻는 MEMBER_NAME
	private int passengerGender; //JOIN으로 얻는 MEMBER_GENDER
	private String passengerPhone; //JOIN으로 얻는 MEMBER_PHONE
	private String passengerEmail; //JOIN으로 얻는 MEMBER_EMAIL
	private String passengerMsg;
	
	public String getMatchResult() {
		if(matchStatus==0) {
			return "매칭완료";
		}else if(matchStatus==1) {
			return "매칭중";
		}else{
			return "매칭취소";
		}
	}
}
