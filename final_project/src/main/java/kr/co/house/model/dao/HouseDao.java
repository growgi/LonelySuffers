package kr.co.house.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class HouseDao {
	
	private SqlSessionTemplate sqlSession;
}
