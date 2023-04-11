package kr.co.member.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class OrderDetail {

	private int orderDetailNo;
	private int orderNo;
	private int houseNo;
	private int roomBookNo;
	private int lessonNo;
	private int lessonBookNo;
	private int productPrice;
	
}
