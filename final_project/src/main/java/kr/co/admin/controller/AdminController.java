package kr.co.admin.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.admin.model.service.AdminService;
import kr.co.admin.model.vo.AdminDashboard;
import kr.co.admin.model.vo.CarpoolPageData;
import kr.co.admin.model.vo.GenderRatio;
import kr.co.admin.model.vo.HousePageData;
import kr.co.admin.model.vo.LessonPageData;
import kr.co.admin.model.vo.MemberPageData;
import kr.co.admin.model.vo.OrderPageData;
import kr.co.admin.model.vo.Product;
import kr.co.admin.model.vo.ProductPageData;
import kr.co.admin.model.vo.RejectProduct;
import kr.co.admin.model.vo.SalesAmount;
import kr.co.admin.model.vo.Search;
import kr.co.admin.model.vo.SearchById;
import kr.co.carpool.model.vo.Carpool;
import kr.co.chat.model.service.ChatService;
import kr.co.chat.model.vo.ChatActive;
import kr.co.house.model.vo.House;
import kr.co.lesson.model.vo.Lesson;
import kr.co.member.model.vo.Member;
import kr.co.member.model.vo.Order;
import kr.co.review.model.vo.Review;

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
		ArrayList<Review> reviewList = service.selectTopReview();
		
		model.addAttribute("lessonList", lessonList);
		model.addAttribute("houseList", houseList);
		model.addAttribute("reviewList", reviewList);
		
		return "main";
	}
	
	@RequestMapping(value="/dashboard.do")
	public String dashboard(Model model, HttpSession session) {
		Member loginMember = (Member)session.getAttribute("m");
		if(loginMember.getMemberGrade() == 1) {
			/*1st*/
			int sellerAppCount = service.selectSellerAppCount(); //판매자 신청 회원 수
			int newProductCount = service.selectNewProductCount(); //신규 상품 수
			int newAdminChatCount = service.selectNewAdminChatCount(); //1:1문의 신규 건수
			
			int totalSalesAmount = service.selectTotalSalesAmount(); //총 판매금액
			int todaySalesAmount = service.selectTodaySalesAmount(); //오늘 판매금액
			
			/*2nd*/
			int memberCount = service.selectMemberCount(); //전체 사용자 수
			int lessonCount = service.selectLessonCount(); //강습 상품 수
			int houseCount = service.selectHouseCount(); //숙박 상품 수
			int carpoolRecruitingCount = service.selectCarpoolRecruitingCount(); //카풀 게시글 수(모집중)
			
			/*3th*/
			//ArrayList<Integer> visitantList = service.selectVisitant(); //방문자수 현황
			ArrayList<GenderRatio> genderRatio = service.selectGenderRatio(); //남녀 비율
			
			/*4th*/
			ArrayList<Product> newProductList = service.selectNewProduct(); //신규 추가 상품
			ArrayList<Member> newMemberList = service.selectNewMember(); //신규 회원
			
			/*5th*/
			ArrayList<Member> newCarpoolDriverList = service.selectNewCarpoolDriver(); //신규 카풀 운전자
			ArrayList<SalesAmount> lessonSalesAmountList = service.selectLessonSalesAmount(); //강습 판매금액 추이
			ArrayList<SalesAmount> houseSalesAmountList = service.selectHouseSalesAmount(); //숙박 판매금액 추이
			ArrayList<SalesAmount> allSalesAmountList = service.selectAllSalesAmount(); //숙박 판매금액 추이
			
			/*6th*/
			ArrayList<Member> adminList = service.selectAllAdmin(); //관리자 목록
			
			AdminDashboard dInfo = new AdminDashboard(sellerAppCount, newProductCount, newAdminChatCount, totalSalesAmount, todaySalesAmount, memberCount, lessonCount, houseCount, carpoolRecruitingCount, genderRatio, newProductList, newMemberList, newCarpoolDriverList, lessonSalesAmountList, houseSalesAmountList, allSalesAmountList, adminList);
			model.addAttribute("dInfo", dInfo);
			
			return "admin/adminDashboard";
			
		} else {
			model.addAttribute("title","접근 제한");
			model.addAttribute("msg","관리자로 로그인해주세요");
			model.addAttribute("icon","error");
			model.addAttribute("loc","/main.do");
			return "common/msg";
		}
	}
	
	/**회원목록*/
	@RequestMapping(value="/memberList.do")
	public String memberList(int reqPage, Model model, HttpSession session) {
		Member loginMember = (Member)session.getAttribute("m");
		if(loginMember.getMemberGrade() == 1) {
			MemberPageData mpd = service.selectAllMember(reqPage);
			int memberCount = service.selectMemberCount(); //전체 사용자 수
			
			model.addAttribute("memberList", mpd.getMemberList());
			model.addAttribute("pageNavi", mpd.getPageNavi());
			model.addAttribute("start", mpd.getStart());
			model.addAttribute("memberCount", memberCount);
			model.addAttribute("hiddenVal",0);
			
			return "admin/memberList";
		} else {
			model.addAttribute("title","접근 제한");
			model.addAttribute("msg","관리자로 로그인해주세요");
			model.addAttribute("icon","error");
			model.addAttribute("loc","/main.do");
			return "common/msg";
		}
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
			model.addAttribute("hiddenVal",1);
			return "admin/memberList";
		} else {
			return "admin/sellerApplicationList";
		}
		
	}
	
	/**2. 판매자 신청 회원 목록*/
	@RequestMapping(value="/sellerApplicationList.do")
	public String sellerApplicationList(int reqPage, Model model, HttpSession session) {
		Member loginMember = (Member)session.getAttribute("m");
		if(loginMember.getMemberGrade() == 1) {
			MemberPageData mpd = service.selectAllSellerApplication(reqPage);
			int sellerAppCount = service.selectSellerAppCount();
			
			model.addAttribute("sellerAppList", mpd.getMemberList());
			model.addAttribute("pageNavi", mpd.getPageNavi());
			model.addAttribute("start", mpd.getStart());
			model.addAttribute("sellerAppCount", sellerAppCount);
			model.addAttribute("hiddenVal",0);
			
			return "admin/sellerApplicationList";
		} else {
			model.addAttribute("title","접근 제한");
			model.addAttribute("msg","관리자로 로그인해주세요");
			model.addAttribute("icon","error");
			model.addAttribute("loc","/main.do");
			return "common/msg";
		}
	}
	
	//검색
	@RequestMapping(value="/searchSellerAppMember.do")
	public String searchSellerAppMember(String searchMemberId, Model model) {
		Member searchSellerAppMember = service.selectOneSellerApplication(searchMemberId);
		
		ArrayList<Member> sellerAppList = new ArrayList<Member>();
		sellerAppList.add(searchSellerAppMember);
		
		if(searchSellerAppMember != null) {			
			model.addAttribute("sellerAppList", sellerAppList);
			model.addAttribute("hiddenVal",1);
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
	public String newProductAll(int reqPage, Model model, HttpSession session) {
		Member loginMember = (Member)session.getAttribute("m");
		if(loginMember.getMemberGrade() == 1) {
			ProductPageData ppd = service.selectAllNewProduct(reqPage); //신규 전체 상품 목록
			int newProductCount = service.selectNewProductCount(); //신규 강습 상품 수
			
			model.addAttribute("productList", ppd.getProductList());
			model.addAttribute("pageNavi", ppd.getPageNavi());
			model.addAttribute("start", ppd.getStart());
			model.addAttribute("newProductCount", newProductCount);
			model.addAttribute("hiddenVal",0);
			
			return "admin/newProductAll";
		} else {
			model.addAttribute("title","접근 제한");
			model.addAttribute("msg","관리자로 로그인해주세요");
			model.addAttribute("icon","error");
			model.addAttribute("loc","/main.do");
			return "common/msg";
		}
	}
	
	@RequestMapping(value="/newProductLesson.do")
	public String newProductLesson(int reqPage, Model model, HttpSession session) {
		Member loginMember = (Member)session.getAttribute("m");
		if(loginMember.getMemberGrade() == 1) {
			LessonPageData lpd = service.selectNewLesson(reqPage); //신규 강습 상품 목록
			int newLessonCount = service.selectNewLessonCount(); //신규 강습 상품 수
			
			model.addAttribute("lessonList", lpd.getLessonList());
			model.addAttribute("pageNavi", lpd.getPageNavi());
			model.addAttribute("start", lpd.getStart());
			model.addAttribute("newLessonCount", newLessonCount);
			model.addAttribute("hiddenVal",0);
			
			return "admin/newProductLesson";
		} else {
			model.addAttribute("title","접근 제한");
			model.addAttribute("msg","관리자로 로그인해주세요");
			model.addAttribute("icon","error");
			model.addAttribute("loc","/main.do");
			return "common/msg";
		}
	}
	
	@RequestMapping(value="/newProductHouse.do")
	public String newProductHouse(int reqPage, Model model, HttpSession session) {
		Member loginMember = (Member)session.getAttribute("m");
		if(loginMember.getMemberGrade() == 1) {
			HousePageData hpd = service.selectNewHouse(reqPage); //신규 숙박 상품 목록
			int newHouseCount = service.selectNewHouseCount(); //신규 숙박 상품 수
			
			model.addAttribute("houseList", hpd.getHouseList());
			model.addAttribute("pageNavi", hpd.getPageNavi());
			model.addAttribute("start", hpd.getStart());
			model.addAttribute("newHouseCount", newHouseCount);
			model.addAttribute("hiddenVal",0);
			
			return "admin/newProductHouse";
		} else {
			model.addAttribute("title","접근 제한");
			model.addAttribute("msg","관리자로 로그인해주세요");
			model.addAttribute("icon","error");
			model.addAttribute("loc","/main.do");
			return "common/msg";
		}
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
	public String checkedApproveProduct(String pType, String no) {
		boolean result = false;
		result = service.updateCheckedApproveProduct(pType, no);
		
		if(result) {
			return "redirect:/newProductAll.do?reqPage=1";

		} else {
			return "redirect:/memberList.do?reqPage=1";
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
	
	/*	@RequestMapping(value="/checkedReturnProduct.do")
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
	}*/
	
	//검색
	@RequestMapping(value="/adminSearchLesson.do")
	public String adminSearchLesson(String jspPage, String lessonSearchType, String lessonSearchKeyword, Model model) {
		String[] keywords = lessonSearchKeyword.trim().replaceAll("(\\s)\\1+","$1").split(" ");		
		Search sp = new Search(lessonSearchType, keywords);
		
		ArrayList<Lesson> lessonList = service.selectSearchLesson(sp);
		
		if(lessonList != null) { 
			model.addAttribute("lessonList", lessonList);
			model.addAttribute("hiddenVal",1);
			
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
		String[] keywords = houseSearchKeyword.trim().replaceAll("(\\s)\\1+","$1").split(" ");		
		Search sp = new Search(houseSearchType, keywords);
		
		ArrayList<House> houseList = service.selectSearchHouse(sp);
		
		if(houseList != null) {			
			model.addAttribute("houseList",houseList);
			model.addAttribute("hiddenVal",1);
			
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
		String[] keywords = productSearchKeyword.trim().replaceAll("(\\s)\\1+","$1").split(" ");		
		Search sp = new Search(productSearchType, keywords);
		
		ArrayList<Product> productList = service.selectSearchProduct(sp);
		
		if(productList != null) {			
			model.addAttribute("productList",productList);
			model.addAttribute("hiddenVal",1);
			
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
	public String productListAll(int reqPage, Model model, HttpSession session) {
		Member loginMember = (Member)session.getAttribute("m");
		if(loginMember.getMemberGrade() == 1) {
			ProductPageData ppd = service.selectAllProduct(reqPage); //모든 상품 목록
			
			if(ppd != null) {	
				model.addAttribute("productList", ppd.getProductList());
				model.addAttribute("pageNavi", ppd.getPageNavi());
				model.addAttribute("start", ppd.getStart());
				model.addAttribute("productCount", ppd.getTotalCount());
				model.addAttribute("hiddenVal",0);
				
				return "admin/productListAll";
			} else {
				return "redirect:/newProductLesson.do?reqPage=1";
			}
		} else {
			model.addAttribute("title","접근 제한");
			model.addAttribute("msg","관리자로 로그인해주세요");
			model.addAttribute("icon","error");
			model.addAttribute("loc","/main.do");
			return "common/msg";
		}
		
	}
	@RequestMapping(value="/productListLesson.do")
	public String productListLesson(int reqPage, Model model, HttpSession session) {
		Member loginMember = (Member)session.getAttribute("m");
		if(loginMember.getMemberGrade() == 1) {
			LessonPageData lpd = service.selectAllLesson(reqPage); //강습 상품 목록
			
			if(lpd != null) {	
				model.addAttribute("lessonList", lpd.getLessonList());
				model.addAttribute("pageNavi", lpd.getPageNavi());
				model.addAttribute("start", lpd.getStart());
				model.addAttribute("lessonCount", lpd.getTotalCount());
				model.addAttribute("hiddenVal",0);
				
				return "admin/productListLesson";
			} else {
				return "redirect:/newProductLesson.do?reqPage=1";
			}
		} else {
			model.addAttribute("title","접근 제한");
			model.addAttribute("msg","관리자로 로그인해주세요");
			model.addAttribute("icon","error");
			model.addAttribute("loc","/main.do");
			return "common/msg";
		}
		
	}
	
	@RequestMapping(value="/productListHouse.do")
	public String productListHouse(int reqPage, Model model, HttpSession session) {
		Member loginMember = (Member)session.getAttribute("m");
		if(loginMember.getMemberGrade() == 1) {
			HousePageData hpd = service.selectAllHouse(reqPage); //숙박 상품 목록
			
			if(hpd != null) {	
				model.addAttribute("houseList", hpd.getHouseList());
				model.addAttribute("pageNavi", hpd.getPageNavi());
				model.addAttribute("start", hpd.getStart());
				model.addAttribute("houseCount", hpd.getTotalCount());
				model.addAttribute("hiddenVal",0);
				
				return "admin/productListHouse";
			} else {
				return "redirect:/newProductLesson.do?reqPage=1";
			}
		} else {
			model.addAttribute("title","접근 제한");
			model.addAttribute("msg","관리자로 로그인해주세요");
			model.addAttribute("icon","error");
			model.addAttribute("loc","/main.do");
			return "common/msg";
		}

	}
	
	//선택 상품 상태 변경
	@Transactional
	@RequestMapping(value="/checkedUpdateProductStatus.do")
	public String checkedUpdatepProductStatus(String pType, String no, String status) {
		boolean result = service.updateProductStatus(pType, no, status);
		
		if(result) {
			return "redirect:/productListAll.do?reqPage=1";
		} else {
			return "redirect:/memberList.do?reqPage=1";
		}
	}
	
	/*선택 상품 - 강습 상태 변경
	@Transactional
	@RequestMapping(value="/checkedUpdateLessonStatus.do")
	public String checkedUpdateLessonStatus(String no, String status) {
		boolean result = service.updateLessonStatus(no, status);
		
		if(result) {
			return "redirect:/productListLesson.do?reqPage=1";
		} else {
			return "redirect:/memberList.do?reqPage=1";
		}
	}*/
	
	/*선택 상품 - 숙박 상태 변경
	@Transactional
	@RequestMapping(value="/checkedUpdateHouseStatus.do")
	public String checkedUpdateHouseStatus(String no, String status) {
		boolean result = service.updateHouseStatus(no, status);
		
		if(result) {
			return "redirect:/productListLesson.do?reqPage=1";
		} else {
			return "redirect:/memberList.do?reqPage=1";
		}
	}*/
	
	//상품 판매 중지 (1개)
	@RequestMapping(value="/productStopSelling.do")
	public String productStopSelling(int no, String productType) {
		int result = service.updateProductStopSelling(no, productType);
		
		if(result>0) {
			return "redirect:/productListAll.do?reqPage=1";
		} else {
			return "redirect:/memberList.do?reqPage=1";
		}
	}
	
	/**5. 판매내역*/
	@RequestMapping(value="/salesDetails.do")
	public String salesDetails(int reqPage, Model model, HttpSession session) {
		Member loginMember = (Member)session.getAttribute("m");
		if(loginMember.getMemberGrade() == 1) {
			OrderPageData opd = service.selectAllOrder(reqPage);
			int orderCount = service.selectOrderCount();
			
			model.addAttribute("orderList", opd.getOrderList());
			model.addAttribute("pageNavi", opd.getPageNavi());
			model.addAttribute("start", opd.getStart());
			model.addAttribute("orderCount", orderCount);
			model.addAttribute("hiddenVal",0);
			
			return "admin/salesDetails";
		} else {
			model.addAttribute("title","접근 제한");
			model.addAttribute("msg","관리자로 로그인해주세요");
			model.addAttribute("icon","error");
			model.addAttribute("loc","/main.do");
			return "common/msg";
		}
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
		SearchById sp = new SearchById(searchType, searchKeyword);
		
		ArrayList<Order> orderList = service.selectSearchSalesDetails(sp);
		if(orderList != null) {			
			model.addAttribute("orderList", orderList);
			model.addAttribute("hiddenVal",1);
			return "admin/salesDetails";
		} else {
			return "redirect:/productList.do?reqPage=1";
		}
	}

	
	/**6. 주문 상세*/
	@RequestMapping(value="/orderDetail.do")
	public String orderDetail(int orderNo, Model model, HttpSession session) {
		Member loginMember = (Member)session.getAttribute("m");
		if(loginMember.getMemberGrade() == 1) {
			Order orderDetailInfo = service.selectOrderDetailInfo(orderNo);
			ArrayList<Order> orderDetailList = service.selectOrderDetail(orderNo);
			int orderDetailCount = service.selectOrderDetailCount(orderNo);
			
			model.addAttribute("orderDetailInfo", orderDetailInfo);
			model.addAttribute("orderDetailList", orderDetailList);
			model.addAttribute("orderDetailCount", orderDetailCount);
			
			return "admin/orderDetail";
		} else {
			model.addAttribute("title","접근 제한");
			model.addAttribute("msg","관리자로 로그인해주세요");
			model.addAttribute("icon","error");
			model.addAttribute("loc","/main.do");
			return "common/msg";
		}
		
	}

	/**카풀 관리*/
	@RequestMapping(value="/carpoolList.do")
	public String carpoolList(int reqPage, Model model, HttpSession session) {
		Member loginMember = (Member)session.getAttribute("m");
		if(loginMember.getMemberGrade() == 1) {
			CarpoolPageData cpd = service.selectAllCarpool(reqPage);
			int carpoolCount = service.selectCarpoolCount();
			
			model.addAttribute("carpoolList", cpd.getCarpoolList());
			model.addAttribute("pageNavi", cpd.getPageNavi());
			model.addAttribute("start", cpd.getStart());
			model.addAttribute("carpoolCount", carpoolCount);
			model.addAttribute("hiddenVal",0);
			
			return "admin/carpoolList";
		} else {
			model.addAttribute("title","접근 제한");
			model.addAttribute("msg","관리자로 로그인해주세요");
			model.addAttribute("icon","error");
			model.addAttribute("loc","/main.do");
			return "common/msg";
		}
	}
	
	//게시글 삭제
	@RequestMapping(value="/deleteCheckedCarpool.do")
	public String deleteCheckedCarpool(String no) {
		boolean result = service.deleteCheckedCarpool(no);
		
		if(result) {
			return "redirect:/carpoolList.do?reqPage=1";
		} else {
			return "redirect:/productList.do?reqPage=1";
		}
	}
	
	//검색
	@RequestMapping(value="/adminSearchCarpool.do")
	public String adminSearchCarpool(String searchKeyword, Model model) {
		ArrayList<Carpool> carpoolList = service.selectSearchCarpool(searchKeyword);
		if(carpoolList != null) {			
			model.addAttribute("carpoolList", carpoolList);
			model.addAttribute("hiddenVal",1);
			return "admin/carpoolList";
		} else {
			return "redirect:/productList.do?reqPage=1";
		}
	}
	
	/**1:1 문의*/
	@RequestMapping(value="/adminChat.do")
	public String adminChat(Model model, HttpSession session) {
		Member loginMember = (Member)session.getAttribute("m");
		if(loginMember.getMemberGrade() == 1) {
			ArrayList<ChatActive> list = cService.selectAllChatActive();
			int adminChatCount = service.selectNewAdminChatCount();
			
			model.addAttribute("list",list);
			model.addAttribute("adminChatCount",adminChatCount);
			return "admin/adminChat";
		} else {
			model.addAttribute("title","접근 제한");
			model.addAttribute("msg","관리자로 로그인해주세요");
			model.addAttribute("icon","error");
			model.addAttribute("loc","/main.do");
			return "common/msg";
		}
	}

}
