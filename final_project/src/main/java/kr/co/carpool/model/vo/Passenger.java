package kr.co.carpool.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Passenger {
	private int matchNo;
	private int matchStatus; //0.매칭중 1.매칭거부됨 2.매칭수락됨
	private int carpoolNo;
	private int passengerNo;
	private String passengerId;//JOIN으로 얻는 MEMBER_ID
	private String passengerName; //JOIN으로 얻는 MEMBER_NAME
	private int passengerGender; //JOIN으로 얻는 MEMBER_GENDER 1:남자, 2:여자
	private String passengerPhone; //JOIN으로 얻는 MEMBER_PHONE
	private String passengerEmail; //JOIN으로 얻는 MEMBER_EMAIL
	private String passengerMsg; //가지고올때 matchStatus 무조건 hidden 으로 1 매칭중으로 가져오게 함.
	private String requestDate; //(TO_CHAR(SYSDATE,'YYYY-MM-DD/HH24:MI:SS'))
	
	public String getMatchResult() {
		if(matchStatus==0) {
			return "매칭중";
		}else if(matchStatus==1) {
			return "매칭취소";
		}else{
			return "매칭완료";
		}
	}
	public String getPassengerMaFe() {
		if(passengerGender==1) {
			return "남";
		}else {
			return "여";
		}
	}
}
