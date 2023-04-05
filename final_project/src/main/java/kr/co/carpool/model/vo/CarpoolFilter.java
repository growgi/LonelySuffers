package kr.co.carpool.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CarpoolFilter {
	private String departureRegion;
	private String departureDistrict;
	private int departureTime; //오전 오후
	private String arrivalRegion;
	private String arrivalDistrict;
	private int minPrice;
	private int maxPrice;
	private int onewayRound;
	private int closure;
	
	public String getDepartureTimeRange() {
		if(departureTime==0) {
			return "오전";
		}else {
			return "오후"	;
		}
	}
	
}
