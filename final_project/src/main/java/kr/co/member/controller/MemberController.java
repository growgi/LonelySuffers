package kr.co.member.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import kr.co.member.model.service.MemberService;
import kr.co.member.model.vo.Member;
import kr.co.member.model.vo.Order;

@Controller
public class MemberController {
	@Autowired
	private MemberService service;
	@Autowired
	private MailSender mailSender;

	public MemberController() {
		super();
	}
	
	@RequestMapping(value = "/loginFrm.do")
	public String loginFrm() {
		return "member/login";
	}
	
	@RequestMapping(value = "/login.do")
	public String loginMember(Member m,HttpSession session,Model model) {
		Member member = service.loginMember(m);
		System.out.println("member : "+member);
		if(member != null) {
			if(member.getMemberGrade() != 4) {
			session.setAttribute("m", member);
			return "redirect:/";
			}else{
				model.addAttribute("title","로그인 실패");
				model.addAttribute("msg","탈퇴한 계정입니다.새로운 계정을 가입해주세요");
				model.addAttribute("icon","error");
				model.addAttribute("loc","/joinMemberFrm.do");
				return "common/msg";
			}
		}else {
			model.addAttribute("title","로그인 실패");
			model.addAttribute("msg","아이디 비밀번호를 확인해 주세요");
			model.addAttribute("icon","error");
			model.addAttribute("loc","/loginFrm.do");
			return "common/msg";
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
	public String joinMember(Member m,Model model) {
		int result = service.joinMember(m);
		if(result == 0) {
			model.addAttribute("title","회원가입 실패");
			model.addAttribute("msg","회원가입에 실패했습니다. 관리자에게 문의하세요.");
			model.addAttribute("icon","error");
			model.addAttribute("loc","/joinMemberFrm.do");
			return "common/msg";
		}
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
		ArrayList<Order> list = service.selectOrderList(m.getMemberNo());
		System.out.println(list);
		if(result == null) {
			model.addAttribute("sellerApplication",0);
		}else {
			model.addAttribute("sellerApplication",result.getMemberNo());
		}
		if(!list.isEmpty()) {
		model.addAttribute("list",list);
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
	
	@RequestMapping(value = "/sellerApplication.do")
	public String sellerApplication(int memberNo,Model model) {
		int result = service.sellerApplication(memberNo); 
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
	
	@RequestMapping(value = "/dropMember.do")
	public String deleteMember(int memberNo,Model model,HttpSession session) {
		Member m = (Member)session.getAttribute("m");
		if(m.getMemberNo() == memberNo) {
			int result = service.deleteMember(memberNo);
			if(result != 0) {
				model.addAttribute("title","회원탈퇴");
				model.addAttribute("msg","회원 탈퇴에 성공했습니다.");
				model.addAttribute("icon","success");
				model.addAttribute("loc","/");
				session.invalidate();
				return "common/msg";
			}else {
				model.addAttribute("title","회원탈퇴");
				model.addAttribute("msg","회원 탈퇴에 실패했습니다. 관리자에게 문의하세요");
				model.addAttribute("icon","error");
				model.addAttribute("loc","/myPage.do");
				return "common/msg";
			}
		}else {
			model.addAttribute("title","회원탈퇴");
			model.addAttribute("msg","본인 아이디만 탈퇴 가능합니다");
			model.addAttribute("icon","error");
			model.addAttribute("loc","/");
			return "common/msg";
		}
	}


// 상품 등록 페이지 productInsert.jsp를 방문하는 함수.  판매자(grade 2)만 허용됨
	@RequestMapping(value = "/productInsert.do")
	public String productInsert(HttpSession session, Model model) {
		Member me = (Member)session.getAttribute("m");
		if(me.getMemberGrade()==2) {
			return "product/productInsert";
		}else {
			model.addAttribute("title","접근 제한됨");
			model.addAttribute("msg","판매자만 사용할 수 있는 기능입니다.");
			model.addAttribute("icon","error");
			model.addAttribute("loc","/myPage.do");
			return "common/msg";
		}
	}


}
