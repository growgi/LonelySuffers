package kr.co.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.member.model.dao.MemberDao;
import kr.co.member.model.vo.Member;

@Service
public class MemberService {
	@Autowired
	private MemberDao dao;

	public MemberService() {
		super();
		System.out.println("MemberService 생성 완료");
	}

	public Member loginMember(Member m) {
		return dao.login(m);
	}

	/*
	 * public int joinMember(Member m) { return dao.joinMember(m); }
	 */
	
	
}
