package kr.co.admin.model.vo;

import java.util.ArrayList;

import kr.co.member.model.vo.Order;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class OrderPageData {
	
	private ArrayList<Order> orderList;
	private String pageNavi;
	private int start;

}
