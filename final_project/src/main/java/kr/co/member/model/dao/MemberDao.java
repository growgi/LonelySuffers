package kr.co.member.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.admin.model.vo.Product;
import kr.co.admin.model.vo.SearchWithId;
import kr.co.house.model.vo.House;
import kr.co.lesson.model.vo.Lesson;
import kr.co.member.model.vo.Member;
import kr.co.member.model.vo.Order;
import kr.co.member.model.vo.WishList;

@Repository
public class MemberDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public MemberDao() {
		super();
		System.out.println("MemberDao 생성 완료");
	}

	public Member loginMember(Member m) {
		System.out.println("dao : " + m);
		return sqlSession.selectOne("member.login", m);
	}

	public int joinMember(Member m) {
		return sqlSession.insert("member.joinMember", m);
	}

	public Member idChk(String memberId) {
		return sqlSession.selectOne("member.idChk", memberId);
	}

	public Member findMemberId(Member m) {
		return sqlSession.selectOne("member.findMemberId", m);
	}

	public Member beforePwMember(Member m) {
		return sqlSession.selectOne("member.beforePwMember", m);
	}

	public int updatePwMember(Member m) {
		return sqlSession.update("member.updatePwMember", m);
	}

	public int sellerApplication(int memberNo) {
		return sqlSession.insert("member.sellerApplication", memberNo);
	}

	public int cancelSeller(int memberNo) {
		return sqlSession.delete("member.cancelSeller", memberNo);
	}

	public Member selectSellerApplication(int memberNo) {
		return sqlSession.selectOne("member.selectSellerApplication", memberNo);
	}

	public int deleteMember(int memberNo) {
		return sqlSession.update("member.deleteMember", memberNo);
	}

// 회원 탈퇴시 나의 관심상품 목록 전부 삭제.  Wishlist 테이블에서 Row 여러 개 삭제
	public int deleteMyWishLists(String memberId) {
		return sqlSession.delete("member.deleteMyWishLists", memberId);
	}

	public ArrayList<Order> selectOrderList(HashMap<String, Object> map) {
		List list = sqlSession.selectList("member.selectOrderList", map);
		return (ArrayList<Order>)list;
	}
	
	public int selectOrderCount(int memberNo) {
		return sqlSession.selectOne("member.selectTotalCount",memberNo);
	}

	public Member selectOneMember(Member m) {
		return sqlSession.selectOne("member.selectOneMember",m);
	}








// 관심상품 관련 함수들 시작 ///////////////////////////////////////////////////////////////
// 나의 관심상품에 이미 존재하는지 확인하는 함수. 있으면 개수를 반환함
	public int selectOneMyWishlist(WishList w) {
		return sqlSession.selectOne("member.selectOneMyWishlist", w);
	}



// 나의 관심상품이 몇 개나 있는지 확인하는 함수
	public int selectCountMyWishlist(String memberId) {
		return sqlSession.selectOne("member.selectCountMyWishlist", memberId);
	}



// 나의 관심상품 등록.  Wishlist 테이블에 Row 1개 추가
	public int insertMyWishlist(WishList w) {
		return sqlSession.insert("member.insertMyWishlist", w);
	}



// 상품페이지에서 관심상품 바로 삭제.  Wishlist 테이블에 Row 1개 삭제
	public int delistWishList(WishList w) {
		return sqlSession.delete("member.delistWishList", w);
	}



// 나의 관심상품들을 조회하는 함수
	public ArrayList<WishList> selectAllWishList(String memberId) {
		List allWishList = sqlSession.selectList("member.selectAllWishList", memberId);
		
		return (ArrayList<WishList>)allWishList;
	}



// 나의 관심상품 삭제.  Wishlist 테이블에 Row 1개 삭제
	public int deleteWishList(int wishNo) {
		return sqlSession.delete("member.deleteWishList", wishNo);
	}
// 관심상품 관련 함수들 끝 ///////////////////////////////////////////////////////////////

	public int updateMember(Member m) {
		return sqlSession.update("member.updateMember",m);
	}

	public ArrayList<Product> selectProductList(HashMap<String, Object> map) {
		List list = sqlSession.selectList("member.selectProductList",map);
		return (ArrayList<Product>)list;
	}

	public int selectProductCount(String memberId) {
		return sqlSession.selectOne("member.selectProductCount",memberId);
	}



// 판매자별 모든 상품 목록 조회
	public ArrayList<Product> selectProductBySeller(HashMap<String, Object> map) {
		List productList = sqlSession.selectList("member.selectProductBySeller", map);
		return (ArrayList<Product>)productList;
	}

// 판매자별 모든 상품의 개수
	public int selectProductCountBySeller(String memberId) {
		return sqlSession.selectOne("member.selectProductCountBySeller", memberId);
	}

// 판매자별 강습 상품 목록 조회
	public ArrayList<Lesson> selectLessonBySeller(HashMap<String, Object> map) {
		List lessonList = sqlSession.selectList("member.selectLessonBySeller", map);
		return (ArrayList<Lesson>)lessonList;
	}

// 판매자별 강습 상품의 개수
	public int selectLessonCountBySeller(String memberId) {
		return sqlSession.selectOne("member.selectLessonCountBySeller", memberId);
	}

// 판매자별 숙박 상품 목록 조회
	public ArrayList<House> selectHouseBySeller(HashMap<String, Object> map) {
		List houseList = sqlSession.selectList("member.selectHouseBySeller", map);
		return (ArrayList<House>)houseList;
	}

// 판매자별 숙박 상품의 개수
	public int selectHouseCountBySeller(String memberId) {
		return sqlSession.selectOne("member.selectHouseCountBySeller", memberId);
	}



// 판매자별 상품 목록 검색 
	public ArrayList<Product> selectSearchProduct(SearchWithId sp) {
		List productList = sqlSession.selectList("member.selectSearchProduct", sp);
		return (ArrayList<Product>)productList;
	}



// 판매자별 강습 상품 목록 검색 
	public ArrayList<Lesson> selectSearchLesson(SearchWithId sp) {
		List lessonList = sqlSession.selectList("member.selectSearchLesson", sp);
		return (ArrayList<Lesson>)lessonList;
	}



// 판매자별 숙박 상품 목록 검색 
	public ArrayList<House> selectSearchHouse(SearchWithId sp) {
		List houseList = sqlSession.selectList("member.selectSearchHouse", sp);
		return (ArrayList<House>)houseList;
	}



// 판매자가 자신의 강습상품 1개의 판매상태 변경
	public int updateLessonStatus(HashMap<String, Object> map) {
		System.out.println("Dao에서 productNo: "+map.get("productNo"));
		return sqlSession.update("l.updateLessonStatus", map);
	}



// 판매자가 자신의 숙박상품 1개를 판매상태 변경
	public int updateHouseStatus(HashMap<String, Object> map) {
		System.out.println("Dao에서 HashMap에 넣은 후 productNo: "+map.get("productNo"));
		return sqlSession.update("h.updateHouseStatus", map);
	}
}
