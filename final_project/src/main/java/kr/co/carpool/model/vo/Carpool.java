package kr.co.carpool.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Carpool {
	private int carpoolNo;
	private int driverNo;
	private String driverName; //JOIN으로 얻는 MEMBER_NAME
	private int driverGender;  //JOIN으로 얻는 MEMBER_GENDER
	private String driverPhone; //JOIN으로 얻는 MEMBER_PHONE
	private String driverEmail; //JOIN으로 얻는 MEMBER_EMAIL
	private int capacity; //6명까지
	private int onewayRound; //편도1 왕복2
	private String departureRegion;
	private String departureDistrict;
	private String arrivalRegion;
	private String arrivalDistrict;
	private String departureDate;
	private int departureTime; //오전0 오후1
	private String returnDate;
	private int returnTime; //오전0 오후1
	private String driverMsg;
	private int carpoolPrice;
	private int surfboardRoom; //수납불가0 수납가능1
	private String regDate; //(TO_CHAR(SYSDATE,'YYYY-MM-DD/HH24:MI:SS'))
	private int closure; //마감0 모집중1 : 운전자가 강제 마감했는지 안했는지에 따른 변수 , 기한만료와 정원 찬것과는 상관없는 변수임.
	private int reserved;
	
	
	public String getTripType() {
		if(onewayRound == 1) {
			return "편도";
		}else {
			return "왕복";
		}
	}
	
	public String getDepartureTimeRange() {
		if(departureTime==0) {
			return "오전";
		}else {
			return "오후";
		}
	}
	
	public String getReturnTimeRange() {
		if(returnTime == 0) {
			return "오전";
		}else {
			return "오후";
		}
	}
	
	public String getBoardRoomCapacity() {
		if(surfboardRoom == 0) {
			return "수납불가";
		}else {
			return "수납가능";
		}
	}
	
	public String getRecruiting() {
		if(closure==0) {
			return "마감";
		}else {
			return "모집중";
		}
	}

	//1: 남자 2:여자
	public String getMaleFemale() {
		if(driverGender ==1) {
			return "남";
		}else {
			return "여";
		}
		
		//carpoolRequest.jsp 작업중
		//질문 : carpool에서 1,2 같은 숫자를 바꿔주는건 ok. 그런데 이제 member라는 조인된 테이블에서도 1,2를 가져와야하는데 오류가 뜸
	}
	
}

