package kr.co.admin.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.admin.model.vo.Search;
import kr.co.house.model.vo.House;
import kr.co.lesson.model.vo.Lesson;
import kr.co.member.model.vo.Member;
import kr.co.member.model.vo.Order;
import kr.co.member.model.vo.OrderDetail;
import kr.co.member.model.vo.WishList;

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

	public ArrayList<Member> selectSearchMember(String searchMemberId) {
		List searchMember = sqlSession.selectList("admin.selectSearchMember", searchMemberId);
		
		return (ArrayList<Member>)searchMember;
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

	public ArrayList<Lesson> selectSearchLesson(Search sp) {
		List lessonList = sqlSession.selectList("admin.selectSearchLesson", sp);
		
		return (ArrayList<Lesson>)lessonList;
	}

	public ArrayList<House> selectSearchHouse(Search sp) {
		List houseList = sqlSession.selectList("admin.selectSearchHouse", sp);
		
		return (ArrayList<House>)houseList;
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

	public int updateApproveLesson(int productNo) {
		int result = sqlSession.update("admin.updateApproveLesson", productNo);
		
		return result;
	}

	public int updateApproveHouse(int productNo) {
		int result = sqlSession.update("admin.updateApproveHouse", productNo);
		
		return result;
	}

	public int updateReturnLesson(int productNo) {
		int result = sqlSession.update("admin.updateReturnLesson", productNo);
		
		return result;
	}

	public int updateReturnHouse(int productNo) {
		int result = sqlSession.update("admin.updateReturnHouse", productNo);
		
		return result;
	}

	public ArrayList<Order> selectAllOrder() {
		List orderList = sqlSession.selectList("admin.selectAllOrder");
		
		return (ArrayList<Order>)orderList;
	}

	public int selectOrderCount() {
		int orderCount = sqlSession.selectOne("admin.selectOrderCount");
		
		return orderCount;
	}


	public int deleteOrder(int orderNo) {
		int result = sqlSession.delete("admin.deleteOrder", orderNo);
		
		return result;
	}
	
	public ArrayList<Order> selectOrderDetail(int orderNo) {
		List orderDetailList = sqlSession.selectList("admin.selectOrderDetail", orderNo);
		
		return (ArrayList<Order>)orderDetailList;
	}
	
	public int selectOrderDetailCount(int orderNo) {
		int orderDetailCount = sqlSession.selectOne("admin.selectOrderDetailCount", orderNo);
		
		return orderDetailCount;
	}
	


	public ArrayList<WishList> selectLessonWishList(String memberId) {
		List lessonWishList = sqlSession.selectList("admin.selectLessonWishList", memberId);
		
		return (ArrayList<WishList>)lessonWishList;
	}

	public ArrayList<WishList> selectHouseWishList(String memberId) {
		List houseWishList = sqlSession.selectList("admin.selectHouseWishList", memberId);
		
		return (ArrayList<WishList>)houseWishList;
	}

	public ArrayList<WishList> selectAllWishList(String memberId) {
		List allWishList = sqlSession.selectList("admin.selectAllWishList", memberId);
		
		return (ArrayList<WishList>)allWishList;
	}

	public Order selectOrderDetailInfo(int orderNo) {
		Order orderDetailInfo = sqlSession.selectOne("admin.selectOrderDetailInfo", orderNo);
		
		return orderDetailInfo;
	}

}
