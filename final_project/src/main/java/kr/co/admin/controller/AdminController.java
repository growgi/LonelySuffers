package kr.co.admin.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.admin.model.service.AdminService;
import kr.co.admin.model.vo.HousePageData;
import kr.co.admin.model.vo.LessonPageData;
import kr.co.admin.model.vo.MemberPageData;
import kr.co.admin.model.vo.OrderPageData;
import kr.co.admin.model.vo.Product;
import kr.co.admin.model.vo.ProductPageData;
import kr.co.admin.model.vo.RejectProduct;
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
	
	@RequestMapping(value="/main.do")
	public String main(Model model) {
		ArrayList<Lesson> lessonList = service.selectTopLesson();
		ArrayList<House> houseList = service.selectTopHouse();
		
		model.addAttribute("lessonList", lessonList);
		model.addAttribute("houseList", houseList);
		
		return "main";
	}
	
	/**1. 회원목록*/
	@RequestMapping(value="/memberList.do")
	public String memberList(int reqPage, Model model) {
		MemberPageData mpd = service.selectAllMember(reqPage);
		int memberCount = service.selectMemberCount(); //전체 사용자 수
		
		model.addAttribute("memberList", mpd.getMemberList());
		model.addAttribute("pageNavi", mpd.getPageNavi());
		model.addAttribute("start", mpd.getStart());
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
			return "redirect:/memberList.do?reqPage=1";
		} else {
			return "redirect:/sellerApplicationList.do?reqPage=1";
		}
	}
	
	//체크박스 체크된 회원 등급 변경
	@Transactional
	@RequestMapping(value="/checkedChangeGrade.do")
	public String checkedChangeGrade(String id, String grade) {
		boolean result = service.checkedChangeGrade(id, grade);
		
		if(result) {
			return "redirect:/memberList.do?reqPage=1";
		} else {
			return "redirect:/sellerApplicationList.do?reqPage=1";
		}
	}
	
	@Transactional
	@RequestMapping(value="/deleteMember.do")
	public String deleteMember(String id) {
		boolean result = service.deleteMember(id);
		
		if(result) {
			return "redirect:/memberList.do?reqPage=1";
		} else {
			return "redirect:/sellerApplicationList.do?reqPage=1";
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
	public String sellerApplicationList(int reqPage, Model model) {
		MemberPageData mpd = service.selectAllSellerApplication(reqPage);
		int sellerAppCount = service.selectSellerAppCount();
		
		model.addAttribute("sellerAppList", mpd.getMemberList());
		model.addAttribute("pageNavi", mpd.getPageNavi());
		model.addAttribute("start", mpd.getStart());
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
			return "redirect:/sellerApplicationList.do?reqPage=1";
		} else {
			return "redirect:/memberList.do?reqPage=1";
		}
	}
	
	
	/**3. 신규 상품 승인*/
	@RequestMapping(value="/newProductAll.do")
	public String newProductAll(int reqPage, Model model) {
		ProductPageData ppd = service.selectAllNewProduct(reqPage); //신규 전체 상품 목록
		int newProductCount = service.selectNewProductCount(); //신규 강습 상품 수
		
		model.addAttribute("productList", ppd.getProductList());
		model.addAttribute("pageNavi", ppd.getPageNavi());
		model.addAttribute("start", ppd.getStart());
		model.addAttribute("newProductCount", newProductCount);
		
		return "admin/newProductAll";
	}
	
	@RequestMapping(value="/newProductLesson.do")
	public String newProductLesson(int reqPage, Model model) {
		LessonPageData lpd = service.selectNewLesson(reqPage); //신규 강습 상품 목록
		int newLessonCount = service.selectNewLessonCount(); //신규 강습 상품 수
		
		model.addAttribute("lessonList", lpd.getLessonList());
		model.addAttribute("pageNavi", lpd.getPageNavi());
		model.addAttribute("start", lpd.getStart());
		model.addAttribute("newLessonCount", newLessonCount);
		
		return "admin/newProductLesson";
	}
	
	@RequestMapping(value="/newProductHouse.do")
	public String newProductHouse(int reqPage, Model model) {
		HousePageData hpd = service.selectNewHouse(reqPage); //신규 숙박 상품 목록
		int newHouseCount = service.selectNewHouseCount(); //신규 숙박 상품 수
		
		model.addAttribute("houseList", hpd.getHouseList());
		model.addAttribute("pageNavi", hpd.getPageNavi());
		model.addAttribute("start", hpd.getStart());
		model.addAttribute("newHouseCount", newHouseCount);
		
		return "admin/newProductHouse";
	}

	//승인
	@RequestMapping(value="/approveProduct.do")
	public String approveProduct(String productType, int productNo) {
		//상품 1개
		int result = service.updateApproveProduct(productType, productNo);
		
		if(result>0) {
			if(productType.equals("숙박")) {
				return "redirect:/newProductHouse.do?reqPage=1";
			} else {
				return "redirect:/newProductLesson.do?reqPage=1";
			}
		} else {
			return "redirect:/productListLesson.do?reqPage=1";
		}
	}
	
	@RequestMapping(value="/checkedApproveProduct.do")
	public String checkedApproveProduct(String productType, String no) {
		//체크된 상품
		boolean result = service.updateCheckedApproveProduct(productType, no);
		
		if(result) {
			if(productType.equals("숙박")) {
				return "redirect:/newProductHouse.do?reqPage=1";
			} else {
				return "redirect:/newProductLesson.do?reqPage=1";
			}
		} else {
			return "redirect:/productListLesson.do?reqPage=1";
		}
	}
	
	//반려
	@RequestMapping(value="/returnProduct.do")
	public String returnProduct(String productType, int productNo, String returnReason) {
//		System.out.println(productType);
//		System.out.println(productNo);
//		System.out.println(returnReason);
		RejectProduct rp = new RejectProduct(productNo, returnReason);
		
		//상품 1개
		int result = service.updateReturnProduct(productType, rp);
		
		if(result>0) {
			if(productType.equals("숙박")) {
				return "redirect:/newProductHouse.do?reqPage=1";
			} else {
				return "redirect:/newProductLesson.do?reqPage=1";
			}
		} else {
			return "redirect:/productListLesson.do?reqPage=1";
		}
	}
	
	@RequestMapping(value="/checkedReturnProduct.do")
	public String checkedReturnProduct(String productType, String no) {
//		System.out.println("productType:"+productType);
//		System.out.println("no:"+no);
		
		//체크된 상품
		boolean result = service.updateCheckedReturnProduct(productType, no);
		
		if(result) {
			if(productType.equals("숙박")) {
				return "redirect:/newProductHouse.do?reqPage=1";
			} else {
				return "redirect:/newProductLesson.do?reqPage=1";
			}
		} else {
			return "redirect:/productListLesson.do?reqPage=1";
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
				return "redirect:/memberList.do?reqPage=1"; 
			}
		} else { 
			return "redirect:/memberList.do?reqPage=1"; 
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
				return "redirect:/memberList.do?reqPage=1"; 
			}
		} else {
			return "redirect:/memberList.do?reqPage=1";
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
				return "redirect:/memberList.do?reqPage=1"; 
			}
		} else {
			return "redirect:/memberList.do";
		}
		
	}

	/**4. 등록된 상품 관리*/
	@RequestMapping(value="/productListAll.do")
	public String productListAll(int reqPage, Model model) {
		ProductPageData ppd = service.selectAllProduct(reqPage); //모든 상품 목록
		int productCount = service.selectAllProductCount(); //모든 상품 수
		
		if(ppd != null) {	
			model.addAttribute("productList", ppd.getProductList());
			model.addAttribute("pageNavi", ppd.getPageNavi());
			model.addAttribute("start", ppd.getStart());
			model.addAttribute("productCount", productCount);
			
			return "admin/productListAll";
		} else {
			return "redirect:/newProductLesson.do?reqPage=1";
		}
		
	}
	@RequestMapping(value="/productListLesson.do")
	public String productListLesson(int reqPage, Model model) {
		LessonPageData lpd = service.selectAllLesson(reqPage); //강습 상품 목록
		int lessonCount = service.selectLessonCount(); //강습 상품 수
		
		if(lpd != null) {	
			model.addAttribute("lessonList", lpd.getLessonList());
			model.addAttribute("pageNavi", lpd.getPageNavi());
			model.addAttribute("start", lpd.getStart());
			model.addAttribute("lessonCount", lessonCount);
			
			return "admin/productListLesson";
		} else {
			return "redirect:/newProductLesson.do?reqPage=1";
		}
		
	}
	
	@RequestMapping(value="/productListHouse.do")
	public String productListHouse(int reqPage, Model model) {
		HousePageData hpd = service.selectAllHouse(reqPage); //숙박 상품 목록
		int houseCount = service.selectHouseCount(); //숙박 상품 수
		
		if(hpd != null) {	
			model.addAttribute("houseList", hpd.getHouseList());
			model.addAttribute("pageNavi", hpd.getPageNavi());
			model.addAttribute("start", hpd.getStart());
			model.addAttribute("houseCount", houseCount);
			
			return "admin/productListHouse";
		} else {
			return "redirect:/newProductLesson.do?reqPage=1";
		}

	}
	
	//선택 상품 - 강습 상태 변경
	@Transactional
	@RequestMapping(value="/checkedUpdateLessonStatus.do")
	public String checkedUpdateLessonStatus(String no, String status) {
		boolean result = service.updateLessonStatus(no, status);
		
		if(result) {
			return "redirect:/productListLesson.do?reqPage=1";
		} else {
			return "redirect:/memberList.do?reqPage=1";
		}
	}
	
	//선택 상품 - 숙박 상태 변경
	@Transactional
	@RequestMapping(value="/checkedUpdateHouseStatus.do")
	public String checkedUpdateHouseStatus(String no, String status) {
		boolean result = service.updateHouseStatus(no, status);
		
		if(result) {
			return "redirect:/productListLesson.do?reqPage=1";
		} else {
			return "redirect:/memberList.do?reqPage=1";
		}
	}
	
	//상품 판매 중지 (1개)
	@RequestMapping(value="/productStopSelling.do")
	public String productStopSelling(int no, int productType) {
		int result = service.updateProductStopSelling(no, productType);
		
		if(result>0) {
			return "redirect:/newProductLesson.do?reqPage=1";
		} else {
			return "redirect:/productListLesson.do?reqPage=1";
		}
	}
	
	/**5. 판매내역*/
	@RequestMapping(value="/salesDetails.do")
	public String salesDetails(int reqPage, Model model) {
		OrderPageData opd = service.selectAllOrder(reqPage);
		int orderCount = service.selectOrderCount();
		
		model.addAttribute("orderList", opd.getOrderList());
		model.addAttribute("pageNavi", opd.getPageNavi());
		model.addAttribute("start", opd.getStart());
		model.addAttribute("orderCount", orderCount);
		
		return "admin/salesDetails";
	}
	
	//내역 삭제
	@RequestMapping(value="/deleteOrder.do")
	public String deleteOrder(int orderNo) {
		//내역 1개
		int result = service.deleteOrder(orderNo);
		
		if(result>0) {
			return "redirect:/salesDetails.do?reqPage=1";
		} else {
			return "redirect:/productList.do?reqPage=1";
		}
	}
	
	@RequestMapping(value="/deleteCheckedOrder.do")
	public String deleteCheckedOrder(String no) {
		boolean result = service.deleteCheckedOrder(no);
		
		if(result) {
			return "redirect:/salesDetails.do?reqPage=1";
		} else {
			return "redirect:/productList.do?reqPage=1";
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
			return "redirect:/productList.do?reqPage=1";
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
