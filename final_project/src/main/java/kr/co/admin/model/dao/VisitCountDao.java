package kr.co.admin.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.admin.model.vo.Visitant;

@Repository
public class VisitCountDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int setVisitTotalCount() {
		int result = sqlSession.insert("admin.insertVisitTotalCount");
		
		return result;
	}

	public int getVisitTodayCount() {
		int todayCount = sqlSession.selectOne("admin.selectVisitTodayCount");
		
		return todayCount;
	}

	public int getVisitTotalCount() {
		int totalCount = sqlSession.selectOne("admin.selectVisitTotalCount");
		
		return totalCount;
	}
	
	public ArrayList<Visitant> getVisitWeekCount() {
		ArrayList<Visitant> weekCountList = sqlSession.selectOne("admin.selectVisitWeekCount");
		
		return weekCountList;
	}

}
