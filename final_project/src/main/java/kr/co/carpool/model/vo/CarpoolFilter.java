package kr.co.carpool.model.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CarpoolFilter {
	private String departureRegion;
	private int[] departureTime; //오전0 오후1
	private String arrivalRegion;
	private int minPrice;
	private int maxPrice;
	private int[] onewayRound; //편도 1 왕복 2
	private int[] closure; //마감 0 모집중 1
	private int start;
	private int end;
	
	
}
