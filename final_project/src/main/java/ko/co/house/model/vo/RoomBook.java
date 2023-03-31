package ko.co.house.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class RoomBook {
	private int roomBookNo;
	private int roomNo;
	private int memberNo;
	private String bookStartDate;
	private String bookEndDate;
	private int houseNo;
	private int optionNo;
	private int roomBookPrice;
	
}
