package kr.co.order.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.order.model.vo.Order;
import kr.co.order.model.vo.OrderDetail;

@Repository
public class OrderDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public int oderTblInsert(Order o) {
		return sqlSession.insert("o.insertOrderTbl",o );
	}

	public int orderDetailInsert(OrderDetail od) {
		System.out.println("orderDetail od 체크"+od);
		return sqlSession.insert("od.insertOrderDetail",od);
	}
}
