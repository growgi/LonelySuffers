package kr.co.admin.model.vo;

import java.util.ArrayList;

import kr.co.carpool.model.vo.Carpool;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CarpoolPageData {
	
	private ArrayList<Carpool> carpoolList;
	private String pageNavi;
	private int start;

}
