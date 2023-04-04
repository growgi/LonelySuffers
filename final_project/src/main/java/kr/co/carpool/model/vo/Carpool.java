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
	private String returnTime; //오전0 오후1
	private String driverMsg;
	private int carpoolPrice;
	private int surfboardRoom; //수납불가0 수납가능1
	private String regDate;
	private int closure; //마감0 모집중1
}
