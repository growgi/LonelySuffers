package kr.co.carpool.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CarpoolDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

}
