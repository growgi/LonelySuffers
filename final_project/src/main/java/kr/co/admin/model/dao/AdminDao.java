package kr.co.admin.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.house.model.vo.House;
import kr.co.lesson.model.vo.Lesson;
import kr.co.member.model.vo.Member;

@Repository
public class AdminDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<Member> selectAllMember() {
		List memberList = sqlSession.selectList("admin.selectAllMember");
		
		return (ArrayList<Member>)memberList;
	}
	
	public int selectMemberCount() {
		int memberCount = sqlSession.selectOne("admin.selectMemberCount");
		
		return memberCount;
	}

	public int updateMemberGrade(Member m) {
		int result = sqlSession.update("admin.updateMemberGrade", m);
		
		return result;
	}

	public int deleteMember(String memberId) {
		int result = sqlSession.delete("admin.deleteMember", memberId);
		
		return result;
	}

	public Member selectOneMember(String searchMemberId) {
		Member searchMember = sqlSession.selectOne("admin.selectOneMember", searchMemberId);
		
		return searchMember;
	}

	public ArrayList<Member> selectAllSellerApplication() {
		List sellerAppList = sqlSession.selectList("admin.selectAllSellerApplication");
		
		return (ArrayList<Member>)sellerAppList;
	}

	public int selectSellerAppCount() {
		int sellerAppCount = sqlSession.selectOne("admin.selectSellerAppCount");
		
		return sellerAppCount;
	}
	
	public Member selectOneSellerApplication(String searchMemberId) {
		Member searchSellerAppMember = sqlSession.selectOne("admin.selectOneSellerApplication", searchMemberId);
		
		return searchSellerAppMember;
	}

	public int updateMemberGradeSeller(String memberId) {
		int result = sqlSession.update("admin.updateMemberGradeSeller", memberId);
		
		return result;
	}

	public int deleteSellerApplication(int memberNo) {
		int result = sqlSession.delete("admin.deleteSellerApplication", memberNo);
		
		return result;
	}

	public ArrayList<Lesson> selectAllLesson() {
		List lessonList = sqlSession.selectList("admin.selectAllLesson");
		
		return (ArrayList<Lesson>)lessonList;
	}

	public ArrayList<House> selectAllHouse() {
		List houseList = sqlSession.selectList("admin.selectAllHouse");
		
		return (ArrayList<House>)houseList;
	}

	public int selectLessonCount() {
		int lessonCount = sqlSession.selectOne("admin.selectLessonCount");
		
		return lessonCount;
	}

	public int selectHouseCount() {
		int houseCount = sqlSession.selectOne("admin.selectHouseCount");
		
		return houseCount;
	}

	public int updateLessonStatus(Lesson l) {
		int result = sqlSession.update("admin.updateLessonStatus", l);
		
		return result;
	}

	public int updateHouseStatus(House h) {
		int result = sqlSession.update("admin.updateHouseStatus", h);
		
		return result;
	}

	public ArrayList<Lesson> selectNewLesson() {
		List lessonList = sqlSession.selectList("admin.selectNewLesson");
		
		return (ArrayList<Lesson>)lessonList;
	}

	public ArrayList<House> selectNewHouse() {
		List houseList = sqlSession.selectList("admin.selectNewHouse");
		
		return (ArrayList<House>)houseList;
	}

	public int selectNewLessonCount() {
		int newLessonCount = sqlSession.selectOne("admin.selectNewLessonCount");
		
		return newLessonCount;
	}

	public int selectNewHouseCount() {
		int newHouseCount = sqlSession.selectOne("admin.selectNewHouseCount");

		return newHouseCount;
	}

	public int updateLessonStopSelling(int no) {
		int result = sqlSession.update("admin.updateLessonStopSelling", no);
		
		return result;
	}

	public int updateHouseStopSelling(int no) {
		int result = sqlSession.update("admin.updateHouseStopSelling", no);
		
		return result;
	}

	public ArrayList<Lesson> selectSearchLesson(String searchLesson) {
		List searchLessonList = sqlSession.selectList("admin.selectSearchLesson",searchLesson);
		
		return (ArrayList<Lesson>)searchLessonList;
	}


}
