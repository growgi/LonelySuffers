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
	private int capacity;
	private int onewayRound;
	private String departureRegion;
	private String departureDistrict;
	private String arrivalRegion;
	private String arrivalDistrict;
	private String departureDate;
	private int departureTime;
	private String returnDate;
	private String returnTime;
	private String driverMsg;
	private int carpoolPrice;
	private int surfboardRoom;
	private String regDate;
	private int closure;
}
