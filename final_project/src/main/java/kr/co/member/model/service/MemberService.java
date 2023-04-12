package kr.co.member.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.chat.model.dao.ChatDao;
import kr.co.member.model.dao.MemberDao;
import kr.co.member.model.vo.Member;
import kr.co.member.model.vo.Order;

@Service
public class MemberService {
	@Autowired
	private MemberDao dao;
	@Autowired
	private ChatDao cDao;

	public MemberService() {
		super();
		System.out.println("MemberService 생성 완료");
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

	
}
