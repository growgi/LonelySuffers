package kr.co.carpool.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.carpool.model.vo.Carpool;

@Repository
public class CarpoolDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<Carpool> selectAllCarpool() {
		List list = sqlSession.selectList("carpool.selectAllCarpool");
		return (ArrayList<Carpool>)list;
	}

	public Carpool selectOneCarpool(Carpool carpool) {
		Carpool c = sqlSession.selectOne("carpool.selectOneCarpool", carpool);
		return c;
	}

}
