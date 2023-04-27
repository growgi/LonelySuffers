package kr.co.order.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor

public class OrderDetail {

	private int orderDetailNo;
	private int orderNo;
	private int houseNo;
	private int roomBookNo;
	private int lessonNo;
	private int lessonBookNo;
}
