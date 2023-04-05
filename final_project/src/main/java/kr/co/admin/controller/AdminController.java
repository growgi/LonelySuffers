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
	
	/**회원목록*/
	@RequestMapping(value="/memberList.do")
	public String memberList(Model model) {
		ArrayList<Member> memberList = service.selectAllMember();
		model.addAttribute("memberList",memberList);
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
			return "redirect:/sellerEnrollList.do";
		}
	}
	
	@Transactional
	@RequestMapping(value="/checkedChangeGrade.do")
	public String checkedChangeGrade(String id, String grade) {
		boolean result = service.checkedChangeGrade(id, grade);
		
		if(result) {
			return "redirect:/memberList.do";
		} else {
			return "redirect:/sellerEnrollList.do";
		}
	}
	
	@RequestMapping(value="/deleteMember.do")
	public String deleteMember(String id) {
		boolean result = service.deleteMember(id);
		
		if(result) {
			return "redirect:/memberList.do";
		} else {
			return "redirect:/sellerEnrollList.do";
		}
	}
	
	@RequestMapping(value="/sellerEnrollList.do")
	public String sellerEnrollList() {
		
		return "admin/sellerEnrollList";
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
