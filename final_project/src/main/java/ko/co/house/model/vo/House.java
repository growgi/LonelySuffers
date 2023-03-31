package ko.co.house.model.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class House {
	private int houseNo;
	private String houseTitle;
	private String houseAddress;
	private String houseDescription;
	private String housePhoto1;
	private String housePhoto2;
	private String housePhoto3;
	private String housePhoto4;
	private int hosueStatus;
	private int houseScore;
	private String writer;
	private String roomTitle;
	private String roomCapa;
	private ArrayList<FileVO> fileList;
}
