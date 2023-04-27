package kr.co.order.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.order.model.vo.Order;
import kr.co.order.model.service.OrderService;
import kr.co.order.model.vo.OrderDetail;

@Controller
public class OrderController {

	@Autowired
	private OrderService service;

//결제 완료 후 orderTbl에 insert
	@ResponseBody
	@RequestMapping(value="/oderTblInsert.do", produces = "application/text; charset=utf8")
	public String oderTblInsert(Order o) {
		int result = service.oderTblInsert(o);
		if(result>0) {
			String orderNo = Integer.toString(o.getOrderNo());
			return orderNo;
		}else {
			return "/kiosk.jsp";
		}
	}

//결제 완료 후 orderDetail에 insert
	@ResponseBody
	@RequestMapping(value="/orderDetailInsert.do", produces= "application/text; charset=utf8")
	public String orderDetailInsert(OrderDetail od) {
		int result = service.orderDetailInsert(od);
		if(result>0) {
			String orderDetailNo = Integer.toString(od.getOrderDetailNo());
			return orderDetailNo;
		}else {
			return "/kiosk.jsp";
		}
	}
	
}
