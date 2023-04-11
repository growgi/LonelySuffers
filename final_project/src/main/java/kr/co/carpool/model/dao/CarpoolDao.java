package kr.co.carpool.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.carpool.model.vo.Carpool;
import kr.co.carpool.model.vo.CarpoolFilter;
import kr.co.carpool.model.vo.CarpoolMatch;
import kr.co.carpool.model.vo.Passenger;

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

	public ArrayList<Carpool> filterCarpool(CarpoolFilter cf) {
		System.out.println("controller에서 dao로 넘겨준 것"+cf);
		List list = sqlSession.selectList("carpoolFilter.filterCarpool", cf);
		System.out.println("dao 실행한것"+list);
		return (ArrayList<Carpool>)list;
	}

	//동행자가 카풀 상세페이지에서 카풀 신청하면 카풀 매칭 
	public int insertPassenger(CarpoolMatch match) {
		int result= sqlSession.insert("passenger.insertPassenger", match);
		return result;
	}
	
	//운전자가 카풀 등록
	public int insertCarpool(Carpool carpool) {
		int result = sqlSession.insert("carpool.insertCarpool", carpool);
		return result;
	}

}
