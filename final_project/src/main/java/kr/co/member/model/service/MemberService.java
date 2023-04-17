package kr.co.member.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.chat.model.dao.ChatDao;
import kr.co.member.model.dao.MemberDao;
import kr.co.member.model.vo.Member;
import kr.co.member.model.vo.Order;
import kr.co.member.model.vo.WishList;

@Service
public class MemberService {
	@Autowired
	private MemberDao dao;
	@Autowired
	private ChatDao cDao;

	public MemberService() {
		super();
	}

	public Member loginMember(Member m) {
		System.out.println("service :"+m);
		return dao.loginMember(m);
		
	}
	@Transactional
	public int joinMember(Member m) {
		cDao.insertChatActive(m.getMemberId());
		return dao.joinMember(m);
	}

	public Member idChk(String memberId) {
		return dao.idChk(memberId);
	}

	public Member findMemberId(Member m) {
		return dao.findMemberId(m);
	}

	public Member beforePwMember(Member m) {
		return dao.beforePwMember(m);
	}
	
	@Transactional
	public int updatePwMember(Member m) {
		return dao.updatePwMember(m);
	}

	@Transactional
	public int sellerApplication(int memberNo) {
		return dao.sellerApplication(memberNo);
	}

	@Transactional
	public int cancelSeller(int memberNo) {
		return dao.cancelSeller(memberNo);
	}

	public Member selectSellerApplication(int memberNo) {
		return dao.selectSellerApplication(memberNo);
	}
	
	@Transactional
	public int deleteMember(int memberNo) {
		return dao.deleteMember(memberNo);
	}

	public ArrayList<Order> selectOrderList(int memberNo) {
		return dao.selectOrderList(memberNo);
	}




// 관심상품에 추가하기 전에, 이미 관심상품에 있거나 가득찼는지 확인하는 함수
	public String selectMyWishlist(WishList w) {
		int wishNo = 0;
		wishNo = dao.selectOneMyWishlist(w);
		if(wishNo != 0) {
			return "이미 회원님의 관심목록에 추가되어 있는 상품입니다.";
		}else {
			int howMany = 0;
			howMany = dao.selectCountMyWishlist(w.getMemberId());
		// 계정 당 최대 관심상품 개수
			if(howMany>=20) {
				return "회원님의 관심목록이 가득 차서 더 이상 목록에 추가할 수 없습니다.";
			}else {
				return "ok";
			}
		}
	}



// 나의 관심상품 등록.  Wishlist 테이블에 Row 1개 추가
	@Transactional
	public int insertMyWishlist(WishList w) {
		return dao.insertMyWishlist(w);
	}

}
