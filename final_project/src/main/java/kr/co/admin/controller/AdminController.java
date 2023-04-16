package kr.co.admin.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.admin.model.service.AdminService;
import kr.co.admin.model.vo.Product;
import kr.co.admin.model.vo.Search;
import kr.co.chat.model.service.ChatService;
import kr.co.chat.model.vo.ChatActive;
import kr.co.house.model.vo.House;
import kr.co.lesson.model.vo.Lesson;
import kr.co.member.model.vo.Member;
import kr.co.member.model.vo.Order;
import kr.co.member.model.vo.WishList;

@Controller
public class AdminController {
	
	@Autowired
	AdminService service;
	
	@Autowired
	private ChatService cService;
	
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
	@RequestMapping(value="/newProductLesson.do")
	public String newProductLesson(Model model) {
		ArrayList<Lesson> lessonList = service.selectNewLesson(); //신규 강습 상품 목록
		int newLessonCount = service.selectNewLessonCount(); //신규 강습 상품 수
		
		model.addAttribute("lessonList", lessonList);
		model.addAttribute("newLessonCount", newLessonCount);
		
		return "admin/newProductLesson";
	}
	
	@RequestMapping(value="/newProductHouse.do")
	public String newProductHouse(Model model) {
		ArrayList<House> houseList = service.selectNewHouse(); //신규 숙박 상품 목록
		int newHouseCount = service.selectNewHouseCount(); //신규 숙박 상품 수
		
		model.addAttribute("houseList", houseList);
		model.addAttribute("newHouseCount", newHouseCount);
		
		return "admin/newProductHouse";
	}

	//승인
	@RequestMapping(value="/approveProduct.do")
	public String approveProduct(int productType, int productNo) {
		//상품 1개
		int result = service.updateApproveProduct(productType, productNo);
		
		if(result>0) {
			if(productType == 2) {
				return "redirect:/newProductHouse.do";
			} else {
				return "redirect:/newProductLesson.do";
			}
		} else {
			return "redirect:/productListLesson.do";
		}
	}
	
	@RequestMapping(value="/checkedApproveProduct.do")
	public String checkedApproveProduct(int productType, String no) {
		//체크된 상품
		boolean result = service.updateCheckedApproveProduct(productType, no);
		
		if(result) {
			if(productType == 2) {
				return "redirect:/newProductHouse.do";
			} else {
				return "redirect:/newProductLesson.do";
			}
		} else {
			return "redirect:/productListLesson.do";
		}
	}
	
	//반려
	@RequestMapping(value="/returnProduct.do")
	public String returnProduct(int productType, int productNo) {
		//상품 1개
		int result = service.updateReturnProduct(productType, productNo);
		
		if(result>0) {
			if(productType == 2) {
				return "redirect:/newProductHouse.do";
			} else {
				return "redirect:/newProductLesson.do";
			}
		} else {
			return "redirect:/productListLesson.do";
		}
	}
	
	@RequestMapping(value="/checkedReturnProduct.do")
	public String checkedReturnProduct(int productType, String no) {
		System.out.println("productType:"+productType);
		System.out.println("no:"+no);
		
		//체크된 상품
		boolean result = service.updateCheckedReturnProduct(productType, no);
		
		if(result) {
			if(productType == 2) {
				return "redirect:/newProductHouse.do";
			} else {
				return "redirect:/newProductLesson.do";
			}
		} else {
			return "redirect:/productListLesson.do";
		}
	}
	
	//검색
	@RequestMapping(value="/adminSearchLesson.do")
	public String adminSearchLesson(String jspPage, String lessonSearchType, String lessonSearchKeyword, Model model) {
		Search sp = new Search(lessonSearchType, lessonSearchKeyword);
		
		ArrayList<Lesson> lessonList = service.selectSearchLesson(sp);
		
		if(lessonList != null) { 
			model.addAttribute("lessonList", lessonList);
			
			if(jspPage.equals("nl")) {
				return "admin/newProductLesson";
			} else if(jspPage.equals("pl")) {
				return "admin/productListLesson";
			} else {
				return "redirect:/memberList.do"; 
			}
		} else { 
			return "redirect:/memberList.do"; 
		}
		
	}
	
	@RequestMapping(value="/adminSearchHouse.do")
	public String adminSearchHouse(String jspPage, String houseSearchType, String houseSearchKeyword, Model model) {
		Search sp = new Search(houseSearchType, houseSearchKeyword);
		
		ArrayList<House> houseList = service.selectSearchHouse(sp);
		
		if(houseList != null) {			
			model.addAttribute("houseList",houseList);
			
			if(jspPage.equals("nl")) {
				return "admin/newProductHouse";
			} else if(jspPage.equals("pl")) {
				return "admin/productListHouse";
			} else {
				return "redirect:/memberList.do"; 
			}
		} else {
			return "redirect:/memberList.do";
		}
		
	}
	
	@RequestMapping(value="/adminSearchProduct.do")
	public String adminSearchProduct(String jspPage, String productSearchType, String productSearchKeyword, Model model) {
		Search sp = new Search(productSearchType, productSearchKeyword);
		
		ArrayList<Product> productList = service.selectSearchProduct(sp);
		
		if(productList != null) {			
			model.addAttribute("productList",productList);
			
			if(jspPage.equals("nl")) {
				return "admin/newProductAll";
			} else if(jspPage.equals("pl")) {
				return "admin/productListAll";
			} else {
				return "redirect:/memberList.do"; 
			}
		} else {
			return "redirect:/memberList.do";
		}
		
	}
	
	/**4. 등록된 상품 관리*/
	@RequestMapping(value="/productListAll.do")
	public String productListAll(Model model) {
		ArrayList<Product> productList = service.selectAllProduct(); //모든 상품 목록
		int productCount = service.selectLessonCount() + service.selectHouseCount(); //모든 상품 수
		
		if(productList != null) {	
			model.addAttribute("productList", productList);
			model.addAttribute("productCount", productCount);
			
			return "admin/productListAll";
		} else {
			return "redirect:/newProductLesson.do";
		}
		
	}
	@RequestMapping(value="/productListLesson.do")
	public String productListLesson(Model model) {
		ArrayList<Lesson> lessonList = service.selectAllLesson(); //강습 상품 목록
		int lessonCount = service.selectLessonCount(); //강습 상품 수
		
		if(lessonList != null) {	
			model.addAttribute("lessonList", lessonList);
			model.addAttribute("lessonCount", lessonCount);
			
			return "admin/productListLesson";
		} else {
			return "redirect:/newProductLesson.do";
		}
		
	}
	
	@RequestMapping(value="/productListHouse.do")
	public String productListHouse(Model model) {
		ArrayList<House> houseList = service.selectAllHouse(); //숙박 상품 목록
		int houseCount = service.selectHouseCount(); //숙박 상품 수
		
		if(houseList != null) {	
			model.addAttribute("houseList", houseList);
			model.addAttribute("houseCount", houseCount);
			
			return "admin/productListHouse";
		} else {
			return "redirect:/newProductLesson.do";
		}

	}
	
	//선택 상품 - 강습 상태 변경
	@Transactional
	@RequestMapping(value="/checkedUpdateLessonStatus.do")
	public String checkedUpdateLessonStatus(String no, String status) {
		boolean result = service.updateLessonStatus(no, status);
		
		if(result) {
			return "redirect:/productListLesson.do";
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
			return "redirect:/productListLesson.do";
		} else {
			return "redirect:/memberList.do";
		}
	}
	
	//상품 판매 중지 (1개)
	@RequestMapping(value="/productStopSelling.do")
	public String productStopSelling(int no, int productType) {
		int result = service.updateProductStopSelling(no, productType);
		
		if(result>0) {
			return "redirect:/newProductLesson.do";
		} else {
			return "redirect:/productListLesson.do";
		}
	}
	
	/**5. 판매내역*/
	@RequestMapping(value="/salesDetails.do")
	public String salesDetails(Model model) {
		ArrayList<Order> orderList = service.selectAllOrder();
		int orderCount = service.selectOrderCount();
		
		model.addAttribute("orderList", orderList);
		model.addAttribute("orderCount", orderCount);
		
		return "admin/salesDetails";
	}
	
	//내역 삭제
	@RequestMapping(value="/deleteOrder.do")
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
	}
	//검색
	@RequestMapping(value="/adminSearchMemberSalesDetails.do")
	public String adminSearchMemberSalesDetails(String searchType,String searchKeyword, Model model) {
		Search sp = new Search(searchType, searchKeyword);
		
		ArrayList<Order> orderList = service.selectSearchSalesDetails(sp);
		if(orderList != null) {			
			model.addAttribute("orderList", orderList);
			return "admin/salesDetails";
		} else {
			return "redirect:/productList.do";
		}
	}
	
	/**6. 주문 상세*/
	@RequestMapping(value="/orderDetail.do")
	public String orderDetail(int orderNo, Model model) {
		Order orderDetailInfo = service.selectOrderDetailInfo(orderNo);
		ArrayList<Order> orderDetailList = service.selectOrderDetail(orderNo);
		int orderDetailCount = service.selectOrderDetailCount(orderNo);
		
		model.addAttribute("orderDetailInfo", orderDetailInfo);
		model.addAttribute("orderDetailList", orderDetailList);
		model.addAttribute("orderDetailCount", orderDetailCount);
		
		return "admin/orderDetail";
	}

	/**7. 관심상품*/
	@RequestMapping(value="/wishList.do")
	public String wishList(String memberId, Model model) {
		ArrayList<WishList> allWishList = service.selectAllWishList(memberId);
		int allWishListCount = service.selectAllWishListCount(memberId);
		ArrayList<WishList> lessonWishList = service.selectLessonWishList(memberId);
		int lessonWishListCount = service.selectLessonWishListCount(memberId);
		ArrayList<WishList> houseWishList = service.selectHouseWishList(memberId);
		int houseWishListCount = service.selectHouseWishListCount(memberId);
		
		model.addAttribute("allWishList", allWishList);
		model.addAttribute("allWishListCount", allWishListCount);
		model.addAttribute("lessonWishList", lessonWishList);
		model.addAttribute("lessonWishListCount", lessonWishListCount);
		model.addAttribute("houseWishList", houseWishList);
		model.addAttribute("houseWishListCount", houseWishListCount);
		
		return "member/wishList";
	}
	
	@RequestMapping(value="/deleteWishList.do")
	public String deleteWishList(int wishNo, String memberId) {
		int result = service.deleteWishList(wishNo);
		
		if(result>0) {
			return "redirect:/wishList.do?memberId="+memberId;
		} else {
			return "redirect:/";
		}
		
		
	}
	
	/**1:1 문의*/
	@RequestMapping(value="/adminChat.do")
	public String adminChat(Model model) {
		ArrayList<ChatActive> list = cService.selectAllChatActive();
		model.addAttribute("list",list);
		return "admin/adminChat";
	}

}
