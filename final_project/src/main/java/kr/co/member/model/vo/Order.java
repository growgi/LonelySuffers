package kr.co.member.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Order {
	
	private int orderNo;
	private int memberNo;
	private int orderAllPrice;
	private int orderStatus;
	private String orderDate;
	private int orderProduct;
}
