package kr.co.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.member.model.service.MemberService;
import kr.co.member.model.vo.Member;

@Controller
public class MemberController {
	@Autowired
	private MemberService service;
	@Autowired
	private MailSender mailSender;

	public MemberController() {
		super();
		System.out.println("MemberController 생성 완료");
	}
	
	@RequestMapping(value = "/loginFrm.do")
	public String loginFrm() {
		return "member/login";
	}
	
	@RequestMapping(value = "/login.do")
	public String loginMember(Member m,HttpSession session) {
		Member member = service.loginMember(m);
		System.out.println("member : "+member);
		if(member != null) {
			session.setAttribute("m", member);
			return "redirect:/";
		}else {
			return "redirect:/loginFrm.do";
		}
	}
		
	@RequestMapping(value = "/joinMemberFrm.do")
	public String joinMemberFrm() {
		return "member/joinMemberFrm";
	}
	
	@ResponseBody	
	@RequestMapping(value = "/joinSendMail.do")
	public String joinSendMail(String email) {
		return mailSender.sendMail(email);
	}
	
	@RequestMapping(value= "/joinMember.do")
	public String joinMember(Member m) {
		int result = service.joinMember(m);
		System.out.println(result);
		return "redirect:/";
	}
	
	@RequestMapping(value = "/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	@ResponseBody
	@RequestMapping(value = "/idChk.do")
	public String idChk(String memberId) {
		Member m = service.idChk(memberId);
		if(m != null) {
			return m.getMemberId();
		}else {
		return "null";
		}
	}
}
