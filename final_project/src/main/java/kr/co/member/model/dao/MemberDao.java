package kr.co.member.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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



}
