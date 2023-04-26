package kr.co.carpool.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
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

	public Carpool selectOneCarpool(int carpoolNo) {
		Carpool c = sqlSession.selectOne("carpool.selectOneCarpool", carpoolNo);
		return c;
	}

	public ArrayList<Carpool> filterCarpool(CarpoolFilter cf) {
		//System.out.println("controller에서 dao로 넘겨준 것"+cf);
		List list = sqlSession.selectList("carpoolFilter.filterCarpool", cf);
		//System.out.println("dao 실행한것"+list);
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

	public int totalCount(CarpoolFilter cf) {
		int result = sqlSession.selectOne("carpoolFilter.totalCount", cf);
		return result;
	}


	public ArrayList<Carpool> getMyLists(HashMap<String, Integer> param) {
		// TODO Auto-generated method stub
		List list = sqlSession.selectList("carpool.selectMyLists", param);
		System.out.println("dao");
		System.out.println(list);
		return (ArrayList<Carpool>)list;
	}

	public int updateDriverDecision(Passenger passenger) {
		int result = sqlSession.update("carpool.updateDriverDecision", passenger);
		return result;
	}

	public int updateDriverClosing(Carpool carpool) {
		int result = sqlSession.update("carpool.updateDriverClosing", carpool);
		return result;
	}

	public ArrayList<Carpool> selectMyRequests(int memberNo) {
		List list = sqlSession.selectList("carpool.selectMyRequests", memberNo);
		//System.out.println("selectMyRequest Dao의 memberNo: "+memberNo);
		return (ArrayList<Carpool>)list;
	}

	public ArrayList<Carpool> selectPassengerList(HashMap<String, Integer> param) {
		List list = sqlSession.selectList("carpool.selectMyRequests", param);
		return (ArrayList<Carpool>)list;
	}

	public int selectPassenger(CarpoolMatch match) {
		int result = sqlSession.selectOne("carpool.selectPassenger", match);
		return result;
	}

	public ArrayList<Passenger> selectPassengerOne(HashMap<String, Integer> param) {
		List list = sqlSession.selectList("carpool.selectPassengerOne",param);
		return (ArrayList<Passenger>)list;
	}

	public int updateClosure() {
		int result = sqlSession.update("carpool.updateClosure");
		return result;
	}


	
	

}
