package kr.co.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

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
		if(member != null && member.getMemberGrade() != 4) {
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
	
	@ResponseBody
	@RequestMapping(value = "/findMemberId.do")
	public String findMemberId(Member m) {
		Member member = service.findMemberId(m);
		if(member == null) {
			return "null";
		}else {
			return member.getMemberId();
		}
	}
	
	@RequestMapping(value = "/myPage.do")
	public String myPage(@SessionAttribute (required = false) Member m ,Model model) {
		Member result = service.selectSellerApplication(m.getMemberNo());
		System.out.println(result);
		if(result == null) {
			model.addAttribute("sellerApplication",0);
		}else {
			model.addAttribute("sellerApplication",result.getMemberNo());
		}
		return "member/myPage";
	}
	
	@ResponseBody
	@RequestMapping(value = "/beforePassWord.do")
	public String beforePassWord(Member m) {
		Member member = service.beforePwMember(m);
		if(member == null) {
			return "null";
		}else {
			return "ok";
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "/updatePassWord.do")
	public String updatePassWord(Member member,@SessionAttribute(required = false) Member m) {
		int result = service.updatePwMember(member);
		if(result != 0) {
			m.setMemberPw(member.getMemberPw());
			return "ok";
		}else {
			return "no";
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "/sellerApplication.do")
	public String sellerApplication(int memberNo) {
		int result = service.sellerApplication(memberNo); 
		if(result != 0 ) {
			return "true";
		}else {
			return "false";
		}
	}
	
	@RequestMapping(value = "/cancelSeller.do")
	public String cancelSeller(int memberNo,Model model) {
		int result = service.cancelSeller(memberNo);
		if(result == 0) {
			model.addAttribute("title","판매자 신청 취소 실패");
			model.addAttribute("msg","판매자 신청 취소에 실패했습니다.");
			model.addAttribute("icon","error");
			model.addAttribute("loc","/myPage.do");
			return "common/msg";
		}else {
			model.addAttribute("title","판매자 신청 취소 성공");
			model.addAttribute("msg","판매자 신청을 취소했습니다.");
			model.addAttribute("icon","success");
			model.addAttribute("loc","/myPage.do");
			return "common/msg";
		}
	}
}
