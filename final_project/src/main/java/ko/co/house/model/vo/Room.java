package ko.co.house.model.vo;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Room {
	private int roomNo;
	private String roomTitle;
	private int roomCapa;
	private String roomName;
	private String roomDescription;
	private int roomPrice;
	private int roomEnable;
}
