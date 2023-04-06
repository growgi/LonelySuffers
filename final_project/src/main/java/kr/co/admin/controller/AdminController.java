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
	
	//1명 회원 등급 변경
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
	
	//체크박스 체크된 회원 등급 변경
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
	
	//검색
	@RequestMapping(value="/adminSearchMember.do")
	public String adminSearchMember(String searchMemberId, Model model) {
		Member searchMember = service.selectOneMember(searchMemberId);
		
		ArrayList<Member> memberList = new ArrayList<Member>();
		memberList.add(searchMember);
		
		if(searchMember != null) {			
			model.addAttribute("memberList",memberList);
			return "admin/memberList";
		} else {
			return "admin/sellerApplicationList";
		}
		
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
	
	//검색
	@RequestMapping(value="/searchSellerAppMember.do")
	public String searchSellerAppMember(String searchMemberId, Model model) {
		Member searchSellerAppMember = service.selectOneSellerApplication(searchMemberId);
		
		ArrayList<Member> sellerAppList = new ArrayList<Member>();
		sellerAppList.add(searchSellerAppMember);
		
		if(searchSellerAppMember != null) {			
			model.addAttribute("sellerAppList", sellerAppList);
			return "admin/sellerApplicationList";
		} else {
			return "admin/memberList";
		}
	}
	
	//체크박스 체크된 회원 등급을 '판매자'로 변경
	@Transactional
	@RequestMapping(value="/checkedChangeGradeSeller.do")
	public String checkedChangeGradeSeller(String id, String no) {
		boolean result = service.updateMemberGradeSeller(id, no);
		
		if(result) {
			return "redirect:/sellerApplicationList.do";
		} else {
			return "redirect:/memberList.do";
		}
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
