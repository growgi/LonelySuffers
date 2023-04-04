package kr.co.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.member.model.service.MemberService;
import kr.co.member.model.vo.Member;

@Controller
public class MemberController {
	@Autowired
	private MemberService service;

	public MemberController() {
		super();
		System.out.println("MemberController 생성 완료");
	}
	
	@RequestMapping(value = "/loginFrm.do")
	public String loginFrm() {
		return "member/login";
	}
	
	@RequestMapping(value = "/login.do")
	public String login(Member m,HttpSession session) {
		Member member = service.loginMember(m);
		if(member != null) {
			session.setAttribute("m", member);
			return "redirect:/";
		}else {
			return "/loginFrm.do";
		}
	}
	@RequestMapping(value = "/joinMemberFrm.do")
	public String joinMemberFrm() {
		return "member/joinMemberFrm";
	}
	
}
