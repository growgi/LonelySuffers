package kr.co.order.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.order.model.vo.Order;
import kr.co.order.model.vo.OrderDetail;
import kr.co.order.model.dao.OrderDao;

@Service
public class OrderService {

	@Autowired
	private OrderDao dao;

	public int oderTblInsert(Order o) {
		return dao.oderTblInsert(o);
	}

	public int orderDetailInsert(OrderDetail od) {
		return dao.orderDetailInsert(od);
	}
	
}
