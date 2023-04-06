package kr.co.admin.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.admin.model.service.AdminService;
import kr.co.member.model.vo.Member;

@Controller
public class AdminController {
	
	@Autowired
	AdminService service;
	
	/**1. 회원목록*/
	@RequestMapping(value="/memberList.do")
	public String memberList(Model model) {
		ArrayList<Member> memberList = service.selectAllMember();
		int memberCount = service.selectMemberCount(); //전체 사용자 수
		
		model.addAttribute("memberList", memberList);
		model.addAttribute("memberCount", memberCount);
		return "admin/memberList";
	}
	
	@Transactional
	@RequestMapping(value="/changeGrade.do")
	public String changeGrade(String memberId, int memberGrade) {
		Member m = new Member();
		m.setMemberId(memberId);
		m.setMemberGrade(memberGrade);
		
		int result = service.updateMemberGrade(m);
		
		if(result>0) {
			return "redirect:/memberList.do";
		} else {
			return "redirect:/sellerApplicationList.do";
		}
	}
	
	@Transactional
	@RequestMapping(value="/checkedChangeGrade.do")
	public String checkedChangeGrade(String id, String grade) {
		boolean result = service.checkedChangeGrade(id, grade);
		
		if(result) {
			return "redirect:/memberList.do";
		} else {
			return "redirect:/sellerApplicationList.do";
		}
	}
	
	@Transactional
	@RequestMapping(value="/deleteMember.do")
	public String deleteMember(String id) {
		boolean result = service.deleteMember(id);
		
		if(result) {
			return "redirect:/memberList.do";
		} else {
			return "redirect:/sellerApplicationList.do";
		}
	}
	
	@RequestMapping(value="/adminSearchMember.do")
	public String adminSearchMember(String searchMemberId, Model model) {
		Member searchMember = service.selectOneMember(searchMemberId);
		
		ArrayList<Member> memberList = new ArrayList<Member>();
		memberList.add(searchMember);
		
		
		model.addAttribute("memberList",memberList);
		return "admin/memberList";
		
	}
	
	/**2. 판매자 신청 회원 목록*/
	@RequestMapping(value="/sellerApplicationList.do")
	public String sellerApplicationList(Model model) {
		ArrayList<Member> sellerAppList = service.selectAllSellerApplication();
		int sellerAppCount = service.selectSellerAppCount();
		
		model.addAttribute("sellerAppList", sellerAppList);
		model.addAttribute("sellerAppCount", sellerAppCount);
		
		return "admin/sellerApplicationList";
	}
	
	@RequestMapping(value="/newProduct.do")
	public String newProduct() {
		
		return "admin/newProduct";
	}
	
	@RequestMapping(value="/productList.do")
	public String productList() {
		
		return "admin/productList";
	}
	
	@RequestMapping(value="/salesDetails.do")
	public String salesDetails() {
		
		return "admin/salesDetails";
	}
	
	@RequestMapping(value="/wishList.do")
	public String wishList() {
		
		return "member/wishList";
	}
	
	@RequestMapping(value="/orderDetail.do")
	public String orderDetail() {
		
		return "admin/orderDetail";
	}

}
