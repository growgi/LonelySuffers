package kr.co.admin.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.admin.model.vo.GenderRatio;
import kr.co.admin.model.vo.Product;
import kr.co.admin.model.vo.RejectProduct;
import kr.co.admin.model.vo.SalesAmount;
import kr.co.admin.model.vo.Search;
import kr.co.admin.model.vo.SearchById;
import kr.co.admin.model.vo.Visitant;
import kr.co.carpool.model.vo.Carpool;
import kr.co.house.model.vo.House;
import kr.co.lesson.model.vo.Lesson;
import kr.co.member.model.vo.Member;
import kr.co.member.model.vo.Order;
import kr.co.review.model.vo.Review;

@Repository
public class AdminDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public AdminDao() {
		super();
		//System.out.println("1aaaaa1111111111111a");
	}

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
		List weekCountList = sqlSession.selectList("admin.selectVisitWeekCount");
		
		return (ArrayList<Visitant>)weekCountList;
	}

	public ArrayList<Member> selectAllMember(HashMap<String, Object> map) {
		List memberList = sqlSession.selectList("admin.selectAllMember",map);
		
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

	public ArrayList<Member> selectAllSellerApplication(HashMap<String, Object> map) {
		List sellerAppList = sqlSession.selectList("admin.selectAllSellerApplication", map);
		
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

	public ArrayList<Lesson> selectAllLesson(HashMap<String, Object> map) {
		List lessonList = sqlSession.selectList("admin.selectAllLesson", map);
		
		return (ArrayList<Lesson>)lessonList;
	}

	public ArrayList<House> selectAllHouse(HashMap<String, Object> map) {
		List houseList = sqlSession.selectList("admin.selectAllHouse", map);
		
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

	public ArrayList<Lesson> selectNewLesson(HashMap<String, Object> map) {
		List lessonList = sqlSession.selectList("admin.selectNewLesson", map);
		
		return (ArrayList<Lesson>)lessonList;
	}

	public ArrayList<House> selectNewHouse(HashMap<String, Object> map) {
		List houseList = sqlSession.selectList("admin.selectNewHouse", map);
		
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

	public int updateReturnLesson(RejectProduct rp) {
		int result = sqlSession.update("admin.updateReturnLesson", rp);
		
		return result;
	}

	public int updateReturnHouse(RejectProduct rp) {
		int result = sqlSession.update("admin.updateReturnHouse", rp);
		
		return result;
	}

	public ArrayList<Order> selectAllOrder(HashMap<String, Object> map) {
		List orderList = sqlSession.selectList("admin.selectAllOrder", map);
		
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
	
	public Order selectOrderDetailInfo(int orderNo) {
		Order orderDetailInfo = sqlSession.selectOne("admin.selectOrderDetailInfo", orderNo);

		return orderDetailInfo;
	}

	public ArrayList<Order> selectSearchSalesDetails(SearchById sp) {
		List searchSalesDetails = sqlSession.selectList("admin.selectSearchSalesDetails", sp);
		/*
		 * System.out.println(sp.getSearchType());
		 * System.out.println(sp.getSearchKeyword());
		 */
		return (ArrayList<Order>)searchSalesDetails;
	}

	public ArrayList<Product> selectAllProduct(HashMap<String, Object> map) {
		List productList = sqlSession.selectList("admin.selectAllProduct", map);
		return (ArrayList<Product>)productList;
	}

	public ArrayList<Product> selectSearchProduct(Search sp) {
		List productList = sqlSession.selectList("admin.selectSearchProduct", sp);
		return (ArrayList<Product>)productList;
	}

	public ArrayList<Product> selectAllNewProduct(HashMap<String, Object> map) {
		List newProductList = sqlSession.selectList("admin.selectAllNewProduct",map);
		return (ArrayList<Product>)newProductList;
	}

	public int selectNewProductCount() {
		int newProductCount = sqlSession.selectOne("admin.selectNewProductCount");
		
		return newProductCount;
	}

	public int selectAllProductCount() {
		int productCount = sqlSession.selectOne("admin.selectAllProductCount");
		
		return productCount;
	}

	public int updateRejectComment(String returnReason) {
		int result = sqlSession.update("admin.updateRejectComment", returnReason);
		
		return result;
	}

	public ArrayList<Lesson> selectTopLesson() {
		List lessonList = sqlSession.selectList("admin.selectTopLesson");
		
		return (ArrayList<Lesson>)lessonList;
	}

	public ArrayList<House> selectTopHouse() {
		List houseList = sqlSession.selectList("admin.selectTopHouse");
		
		return (ArrayList<House>)houseList;
	}

	public ArrayList<Carpool> selectAllCarpool(HashMap<String, Object> map) {
		List carpoolList = sqlSession.selectList("admin.selectAllCarpool", map);
		
		return (ArrayList<Carpool>)carpoolList;
	}

	public int selectCarpoolCount() {
		int carpoolCount = sqlSession.selectOne("admin.selectCarpoolCount");
		
		return carpoolCount;
	}

	public int deleteCarpool(int carpoolNo) {
		int result = sqlSession.update("admin.deleteCarpool", carpoolNo);
		
		return result;
	}

	public ArrayList<Carpool> selectSearchCarpool(String searchKeyword) {
		List carpoolList = sqlSession.selectList("admin.selectSearchCarpool", searchKeyword);
		
		return (ArrayList<Carpool>)carpoolList;
	}

	public int selectTotalSalesAmount() {
		int totalSalesAmount = sqlSession.selectOne("admin.selectTotalSalesAmount");
		
		return totalSalesAmount;
	}

	public int selectTodaySalesAmount() {
		int todaySalesAmount = sqlSession.selectOne("admin.selectTodaySalesAmount");
		
		return todaySalesAmount;
	}

	public int selectCarpoolRecruitingCount() {
		int carpoolRecruitingCount = sqlSession.selectOne("admin.selectCarpoolRecruitingCount");
		
		return carpoolRecruitingCount;
	}

	public ArrayList<Product> selectNewProduct() {
		List newProductList = sqlSession.selectList("admin.selectNewProduct");
		
		return (ArrayList<Product>)newProductList;
	}

	public ArrayList<Member> selectNewMember() {
		List newMemberList = sqlSession.selectList("admin.selectNewMember");
		
		return (ArrayList<Member>)newMemberList;
	}

	public ArrayList<Member> selectNewCarpoolDriver() {
		List newCarpoolDriverList = sqlSession.selectList("admin.selectNewCarpoolDriver");
		
		return (ArrayList<Member>)newCarpoolDriverList;
	}

	public ArrayList<Member> selectAllAdmin() {
		List adminList = sqlSession.selectList("admin.selectAllAdmin");
		
		return (ArrayList<Member>)adminList;
	}

	public ArrayList<GenderRatio> selectGenderRatio() {
		List genderRatio = sqlSession.selectList("admin.selectGenderRatio");
		
		return (ArrayList<GenderRatio>)genderRatio;
	}

	public ArrayList<SalesAmount> selectLessonSalesAmount() {
		List lessonSalesAmountList = sqlSession.selectList("admin.selectLessonSalesAmount");
		
		return (ArrayList<SalesAmount>)lessonSalesAmountList;
	}
	
	public ArrayList<SalesAmount> selectHouseSalesAmount() {
		List houseSalesAmountList = sqlSession.selectList("admin.selectLessonSalesAmount");
		
		return (ArrayList<SalesAmount>)houseSalesAmountList;
	}
	
	public ArrayList<SalesAmount> selectAllSalesAmount() {
		List allSalesAmountList = sqlSession.selectList("admin.selectAllSalesAmount");
		
		return (ArrayList<SalesAmount>)allSalesAmountList;
	}

	public ArrayList<Review> selectTopReview() {
		List reviewList = sqlSession.selectList("admin.selectTopReview");
		
		return (ArrayList<Review>)reviewList;
	}

	public int selectNewAdminChatCount() {
		int newAdminChatCount = sqlSession.selectOne("admin.selectNewAdminChatCount");
		
		return newAdminChatCount;
	}

	/*
	 * public int selectNewAdminChatCount() { int newAdminChatCount =
	 * sqlSession.selectOne("admin.selectNewAdminChatCount");
	 * 
	 * return newAdminChatCount; }
	 */

}
