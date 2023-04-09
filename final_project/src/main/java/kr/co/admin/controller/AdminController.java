package kr.co.admin.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.admin.model.service.AdminService;
import kr.co.admin.model.vo.Search;
import kr.co.house.model.vo.House;
import kr.co.lesson.model.vo.Lesson;
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
		ArrayList<Member> memberList = service.selectSearchMember(searchMemberId);
		
		if(memberList != null) {			
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
	
	
	/**3. 신규 상품 승인*/
	@RequestMapping(value="/newProduct.do")
	public String newProduct(Model model) {
		ArrayList<Lesson> lessonList = service.selectNewLesson(); //신규 강습 상품 목록
		ArrayList<House> houseList = service.selectNewHouse(); //신규 숙박 상품 목록
		int newLessonCount = service.selectNewLessonCount(); //신규 강습 상품 수
		int newHouseCount = service.selectNewHouseCount(); //신규 숙박 상품 수
		
		model.addAttribute("lessonList", lessonList);
		model.addAttribute("houseList", houseList);
		model.addAttribute("newLessonCount", newLessonCount);
		model.addAttribute("newHouseCount", newHouseCount);
		
		return "admin/newProduct";
	}

	//승인
	@RequestMapping(value="/approveProduct.do")
	public String approveProduct(int productType, int productNo) {
		//상품 1개
		int result = service.updateApproveProduct(productType, productNo);
		
		if(result>0) {
			return "redirect:/newProduct.do";
		} else {
			return "redirect:/productList.do";
		}
	}
	
	@RequestMapping(value="/checkedApproveProduct.do")
	public String checkedApproveProduct(int productType, String no) {
		//체크된 상품
		boolean result = service.updateCheckedApproveProduct(productType, no);
		
		if(result) {
			return "redirect:/newProduct.do";
		} else {
			return "redirect:/productList.do";
		}
	}
	
	//반려
	@RequestMapping(value="/returnProduct.do")
	public String returnProduct(int productType, int productNo) {
		//상품 1개
		int result = service.updateReturnProduct(productType, productNo);
		
		if(result>0) {
			return "redirect:/newProduct.do";
		} else {
			return "redirect:/productList.do";
		}
	}
	
	@RequestMapping(value="/checkedReturnProduct.do")
	public String checkedReturnProduct(int productType, String no) {
		//체크된 상품
		boolean result = service.updateCheckedReturnProduct(productType, no);
		
		if(result) {
			return "redirect:/newProduct.do";
		} else {
			return "redirect:/productList.do";
		}
	}
	
	//검색
	@RequestMapping(value="/adminSearchLesson.do")
	public String adminSearchLesson(String searchType, String searchKeyword, Model model) {
		Search sp = new Search(searchType, searchKeyword);
		ArrayList<Lesson> lessonList = service.selectSearchLesson(sp);
		
		if(!lessonList.isEmpty()) {			
			model.addAttribute("lessonList",lessonList);
			return "redirect:/newProduct.do";
		} else {
			return "redirect:/productList.do";
		}
		
	}
	
	/**4. 등록된 상품 관리*/
	@RequestMapping(value="/productList.do")
	public String productList(Model model) {
		ArrayList<Lesson> lessonList = service.selectAllLesson(); //강습 상품 목록
		ArrayList<House> houseList = service.selectAllHouse(); //숙박 상품 목록
		int lessonCount = service.selectLessonCount(); //강습 상품 수
		int houseCount = service.selectHouseCount(); //숙박 상품 수
		
		model.addAttribute("lessonList", lessonList);
		model.addAttribute("houseList", houseList);
		model.addAttribute("lessonCount", lessonCount);
		model.addAttribute("houseCount", houseCount);
		
		return "admin/productList";
	}
	
	//선택 상품 - 강습 상태 변경
	@Transactional
	@RequestMapping(value="/checkedUpdateLessonStatus.do")
	public String checkedUpdateLessonStatus(String no, String status) {
		boolean result = service.updateLessonStatus(no, status);
		
		if(result) {
			return "redirect:/productList.do";
		} else {
			return "redirect:/memberList.do";
		}
	}
	
	//선택 상품 - 숙박 상태 변경
	@Transactional
	@RequestMapping(value="/checkedUpdateHouseStatus.do")
	public String checkedUpdateHouseStatus(String no, String status) {
		boolean result = service.updateHouseStatus(no, status);
		
		if(result) {
			return "redirect:/productList.do";
		} else {
			return "redirect:/memberList.do";
		}
	}
	
	//상품 판매 중지 (1개)
	@RequestMapping(value="/productStopSelling.do")
	public String productStopSelling(int no, int productType) {
		int result = service.updateProductStopSelling(no, productType);
		
		if(result>0) {
			return "redirect:/newProduct.do";
		} else {
			return "redirect:/productList.do";
		}
	}
	
	/*5. 판매내역*/
	@RequestMapping(value="/salesDetails.do")
	public String salesDetails(Model model) {
		//ArrayList<Order> orderList = service.selectAllOrder();
		//int orderCount = service.selectOrderCount();
		
		//model.addAttribute("orderList", orderList);
		//model.addAttribute("orderCount", orderCount);
		
		return "admin/salesDetails";
	}
	
	//내역 삭제
	/*@RequestMapping(value="/deleteOrder.do")
	public String deleteOrder(int orderNo) {
		//내역 1개
		int result = service.deleteOrder(orderNo);
		
		if(result>0) {
			return "redirect:/salesDetails.do";
		} else {
			return "redirect:/productList.do";
		}
	}
	
	@RequestMapping(value="/deleteCheckedOrder.do")
	public String deleteCheckedOrder(String no) {
		boolean result = service.deleteCheckedOrder(no);
		
		if(result) {
			return "redirect:/salesDetails.do";
		} else {
			return "redirect:/productList.do";
		}
	}*/
	
	/*6. 주문 상세*/
	@RequestMapping(value="/orderDetail.do")
	//public String orderDetail(int orderNo, Model model) {
	public String orderDetail(Model model) {
		/*ArrayList<OrderDetail> orderDetailList = service.selectOrderDetail(orderNo);
		int orderDetailCount = service.selectOrderDetailCount(orderNo);
		model.addAttribute("orderDetailList", orderDetailList);
		model.addAttribute("orderDetailCount", orderDetailCount);*/
		
		return "admin/orderDetail";
	}

	
	@RequestMapping(value="/wishList.do")
	public String wishList() {
		
		return "member/wishList";
	}

}
