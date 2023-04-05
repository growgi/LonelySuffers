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
	private String driverName;
	private int driverGender;
	private String driverPhone;
	private String driverEmail;
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
	private String regDate;
	private int closure; //마감0 모집중1
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
	
}

