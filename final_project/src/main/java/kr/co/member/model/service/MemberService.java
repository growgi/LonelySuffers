package kr.co.member.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.admin.model.vo.HousePageData;
import kr.co.admin.model.vo.LessonPageData;
import kr.co.admin.model.vo.OrderPageData;
import kr.co.admin.model.vo.Product;
import kr.co.admin.model.vo.ProductPageData;
import kr.co.admin.model.vo.SearchWithId;
import kr.co.chat.model.dao.ChatDao;
import kr.co.house.model.vo.House;
import kr.co.lesson.model.vo.Lesson;
import kr.co.member.model.dao.MemberDao;
import kr.co.member.model.vo.Member;
import kr.co.member.model.vo.Order;
import kr.co.member.model.vo.WishList;

@Service
public class MemberService {
	@Autowired
	private MemberDao dao;
	@Autowired
	private ChatDao cDao;

	public MemberService() {
		super();
	}

	public Member loginMember(Member m) {
		System.out.println("service :"+m);
		return dao.loginMember(m);
		
	}
	@Transactional
	public int joinMember(Member m) {
		cDao.insertChatActive(m.getMemberId());
		return dao.joinMember(m);
	}

	public Member idChk(String memberId) {
		return dao.idChk(memberId);
	}

	public Member findMemberId(Member m) {
		return dao.findMemberId(m);
	}

	public Member beforePwMember(Member m) {
		return dao.beforePwMember(m);
	}
	
	@Transactional
	public int updatePwMember(Member m) {
		return dao.updatePwMember(m);
	}

	@Transactional
	public int sellerApplication(int memberNo) {
		return dao.sellerApplication(memberNo);
	}

	@Transactional
	public int cancelSeller(int memberNo) {
		return dao.cancelSeller(memberNo);
	}

	public Member selectSellerApplication(int memberNo) {
		return dao.selectSellerApplication(memberNo);
	}
	
	@Transactional
	public int deleteMember(int memberNo) {
		return dao.deleteMember(memberNo);
	}

// 회원 탈퇴시 나의 관심상품 목록 전부 삭제.  Wishlist 테이블에서 Row 여러 개 삭제
	@Transactional
	public int deleteMyWishLists(String memberId) {
		return dao.deleteMyWishLists(memberId);
	}

	public OrderPageData selectOrderList(int reqPage,int memberNo) {
		/*1. 한 페이지당 게시물 수 지정 -> 10개*/
		int numPerPage = 10;
		/*reqPage가 1페이지면 -> 최신글 1~10번
		reqPage가 2페이지면 -> 최신글 11~20번
		reqPage가 3페이지면 -> 최신글 21~30번
		*reqPage : 요청페이지
		ex) reqPage == 4 -> 31~40 
		... 규칙: 4*10 = 40
		*/
		int end = numPerPage * reqPage; //마지막 페이지
		int start = end - numPerPage + 1; //시작 페이지 ... 한 페이지당 시작하는 게시물번호
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("memberNo", memberNo);
		
		ArrayList<Order> orderList = dao.selectOrderList(map); 
		System.out.println("orderList : "+orderList);
		/*<페이징 제작 시작>*/
		/*한페이지당 게시물 수 : 10
		총 게시물 수 : 222
		→ 총 23개 페이지 필요*/
		//전체 페이지 수를 계산하려면 -> 먼저 총 게시물 수 조회 필요
		int totalCount = dao.selectOrderCount(memberNo);
		System.out.println("totalCount : "+totalCount);
		//전체 페이지 수 계산
		/*한페이지 당 게시물 수 : 10
		총 게시물 수 80 -> 8페이지 필요
		90 -> 9페이지 필요
		100 -> 10페이지 필요 ...*/
		int totalPage = 0;
		if(totalCount%numPerPage == 0) {
			totalPage = totalCount/numPerPage; //페이지 개수... 1페이지,2페이지...
		} else { //나머지 있는 경우 ... 1페이지 더 추가
			totalPage = totalCount/numPerPage + 1;
		}
		
		//페이지네비게이션 사이즈
		int pageNaviSize = 5;
		
		//페이지네비게이션 시작번호 = pageNo
		/*reqPage 1~5 : 1 2 3 4 5
		reqPage 6~10 : 6 7 8 9 10
		reqPage 11~15 : 11 12 13 14 15 ...*/
		//int pageNo = reqPage - 2;
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize + 1;
		//((reqPage-1)/5)*5 + 1
		/*reqPage 1~5 : 1부터 시작
		reqPage 6~10 : 6부터 시작
		reqPage 11~15 : 11부터 시작*/
		
		//페이지네비게이션 제작 시작
		String pageNavi = "<ul class='pagination circle-style'>";
		
		//이전버튼 
		if(pageNo != 1) {
			pageNavi += "<li>";
			pageNavi += "<a class='page-item' href='/myPage.do?reqPage="+(pageNo-1)+"&tabNo=1'>";
			pageNavi += "<span class='material-symbols-outlined arrowIos'>arrow_back_ios</span>"; //구글 아이콘 ... <
			pageNavi += "</a></li>";
		}
		
		//페이지 숫자 ... < 1 2 3 4 5 >
		for(int i=0; i<pageNaviSize; i++) {
			if(pageNo == reqPage) {
				pageNavi += "<li>";
				//현재 페이지는 active-page 클래스 추가 ... 색 다르게 적용
				pageNavi += "<a class='page-item active-page' href='/myPage.do?reqPage="+(pageNo)+"&tabNo=1'>";
				pageNavi += pageNo;
				pageNavi += "</a></li>";
			} else {
				pageNavi += "<li>";
				pageNavi += "<a class='page-item' href='/myPage.do?reqPage="+(pageNo)+"&tabNo=1'>";
				pageNavi += pageNo;
				pageNavi += "</a></li>";
			}
			pageNo++; //페이지번호+1 ... 다음페이지
			
			if(pageNo>totalPage) { //페이지번호가 전체페이지수보다 크면 for문 빠져나감
				break;
			}
		}
		
		//다음버튼
		if(pageNo <= totalPage) { //다음버튼이 만들어지는 조건
			pageNavi += "<li>";
			pageNavi += "<a class='page-item' href='/myPage.do?reqPage="+(pageNo)+"&tabNo=1'>";
			pageNavi += "<span class='material-symbols-outlined arrowIos'>arrow_forward_ios</span>"; //구글 아이콘 ... >
			pageNavi += "</a></li>";
		}
		
		pageNavi += "</ul>";
		
		OrderPageData opd = new OrderPageData(orderList, pageNavi, start);
		
		return opd;
	}




// 관심상품에 추가하기 전에, 이미 관심상품에 있거나 가득찼는지 확인하는 함수
	public String selectMyWishlist(WishList w) {
		int wishNo = 0;
		wishNo = dao.selectOneMyWishlist(w);
		if(wishNo != 0) {
			return "이미 회원님의 관심목록에 추가되어 있는 상품입니다.";
		}else {
			int howMany = 0;
			howMany = dao.selectCountMyWishlist(w.getMemberId());
		// 계정 당 최대 관심상품 개수
			if(howMany>=20) {
				return "회원님의 관심목록이 가득 차서 더 이상 목록에 추가할 수 없습니다.";
			}else {
				return "ok";
			}
		}
	}



// 나의 관심상품 등록.  Wishlist 테이블에 Row 1개 추가
	@Transactional
	public int insertMyWishlist(WishList w) {
		return dao.insertMyWishlist(w);
	}



// 상품페이지에서 관심상품 바로 삭제.  Wishlist 테이블에 Row 1개 삭제
	@Transactional
	public int delistWishList(WishList w) {
		return dao.delistWishList(w);
	}



// 나의 관심상품들을 조회하는 함수
	public ArrayList<WishList> selectAllWishList(String memberId) {
		return dao.selectAllWishList(memberId);
	}



// 나의 관심상품 삭제.  Wishlist 테이블에 Row 1개 삭제
	@Transactional
	public int deleteWishList(int wishNo) {
		return dao.deleteWishList(wishNo);
	}



	public Member selectOneMember(Member m) {
		return dao.selectOneMember(m);
	}
	
	@Transactional
	public int updateMember(Member m) {
		return dao.updateMember(m);
	}

	public ProductPageData selectProductList(int reqPage, String memberId) {
		int numPerPage = 10;
		/*reqPage가 1페이지면 -> 최신글 1~10번
		reqPage가 2페이지면 -> 최신글 11~20번
		reqPage가 3페이지면 -> 최신글 21~30번
		*reqPage : 요청페이지
		ex) reqPage == 4 -> 31~40 
		... 규칙: 4*10 = 40
		*/
		int end = numPerPage * reqPage; //마지막 페이지
		int start = end - numPerPage + 1; //시작 페이지 ... 한 페이지당 시작하는 게시물번호
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("memberId", memberId);
		
		ArrayList<Product> productList = dao.selectProductList(map); //회원목록 전체 조회
		
		/*<페이징 제작 시작>*/
		/*한페이지당 게시물 수 : 10
		총 게시물 수 : 222
		→ 총 23개 페이지 필요*/
		//전체 페이지 수를 계산하려면 -> 먼저 총 게시물 수 조회 필요
		int totalCount = dao.selectProductCount(memberId);
		
		//전체 페이지 수 계산
		/*한페이지 당 게시물 수 : 10
		총 게시물 수 80 -> 8페이지 필요
		90 -> 9페이지 필요
		100 -> 10페이지 필요 ...*/
		int totalPage = 0;
		if(totalCount%numPerPage == 0) {
			totalPage = totalCount/numPerPage; //페이지 개수... 1페이지,2페이지...
		} else { //나머지 있는 경우 ... 1페이지 더 추가
			totalPage = totalCount/numPerPage + 1;
		}
		
		//페이지네비게이션 사이즈
		int pageNaviSize = 5;
		
		//페이지네비게이션 시작번호 = pageNo
		/*reqPage 1~5 : 1 2 3 4 5
		reqPage 6~10 : 6 7 8 9 10
		reqPage 11~15 : 11 12 13 14 15 ...*/
		//int pageNo = reqPage - 2;
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize + 1;
		//((reqPage-1)/5)*5 + 1
		/*reqPage 1~5 : 1부터 시작
		reqPage 6~10 : 6부터 시작
		reqPage 11~15 : 11부터 시작*/
		
		//페이지네비게이션 제작 시작
		String pageNavi = "<ul class='pagination circle-style'>";
		
		//이전버튼 
		if(pageNo != 1) {
			pageNavi += "<li>";
			pageNavi += "<a class='page-item' href='/sellerProduct.do?reqPage="+(pageNo-1)+"'>";
			pageNavi += "<span class='material-icons'>chevron_left</span>"; //구글 아이콘 ... <
			pageNavi += "</a></li>";
		}
		
		//페이지 숫자 ... < 1 2 3 4 5 >
		for(int i=0; i<pageNaviSize; i++) {
			if(pageNo == reqPage) {
				pageNavi += "<li>";
				//현재 페이지는 active-page 클래스 추가 ... 색 다르게 적용
				pageNavi += "<a class='page-item active-page' href='/sellerProduct.do?reqPage="+(pageNo)+"'>";
				pageNavi += pageNo;
				pageNavi += "</a></li>";
			} else {
				pageNavi += "<li>";
				pageNavi += "<a class='page-item' href='/sellerProduct.do?reqPage="+(pageNo)+"'>";
				pageNavi += pageNo;
				pageNavi += "</a></li>";
			}
			pageNo++; //페이지번호+1 ... 다음페이지
			
			if(pageNo>totalPage) { //페이지번호가 전체페이지수보다 크면 for문 빠져나감
				break;
			}
		}
		
		//다음버튼
		if(pageNo <= totalPage) { //다음버튼이 만들어지는 조건
			pageNavi += "<li>";
			pageNavi += "<a class='page-item' href='/sellerProduct.do?reqPage="+(pageNo)+"'>";
			pageNavi += "<span class='material-icons'>chevron_right</span>"; //구글 아이콘 ... >
			pageNavi += "</a></li>";
		}
		
		pageNavi += "</ul>";
		
		ProductPageData ppd = new ProductPageData(productList, pageNavi, start, totalCount);
		
		return ppd;
	}

	public int selectProductCount(String memberId) {
		
		return dao.selectProductCount(memberId);
	}



// 판매자별 모든 상품 목록 조회
	public ProductPageData selectProductBySeller(int reqPage, String memberId) {
		int numPerPage = 10;
		int end = numPerPage * reqPage;
		int start = end - numPerPage + 1;
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("memberId", memberId);
		
		ArrayList<Product> productList = dao.selectProductBySeller(map);
		
		int totalCount = dao.selectProductCountBySeller(memberId);
		
		int totalPage = 0;
		if(totalCount%numPerPage == 0) {
			totalPage = totalCount/numPerPage;
		} else {
			totalPage = totalCount/numPerPage + 1;
		}
		
		int pageNaviSize = 5;
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize + 1;
		String pageNavi = "<ul class='pagination circle-style'>";
		
		//이전버튼 
		if(pageNo != 1) {
			pageNavi += "<li>";
			pageNavi += "<a class='page-item' href='/productListBySeller.do?reqPage="+(pageNo-1)+"'>";
			pageNavi += "<span class='material-icons'>chevron_left</span>"; //구글 아이콘 ... <
			pageNavi += "</a></li>";
		}
		
		//페이지 숫자 ... < 1 2 3 4 5 >
		for(int i=0; i<pageNaviSize; i++) {
			if(pageNo == reqPage) {
				pageNavi += "<li>";
				//현재 페이지는 active-page 클래스 추가 ... 색 다르게 적용
				pageNavi += "<a class='page-item active-page' href='/productListBySeller.do?reqPage="+(pageNo)+"'>";
				pageNavi += pageNo;
				pageNavi += "</a></li>";
			} else {
				pageNavi += "<li>";
				pageNavi += "<a class='page-item' href='/productListBySeller.do?reqPage="+(pageNo)+"'>";
				pageNavi += pageNo;
				pageNavi += "</a></li>";
			}
			pageNo++; //페이지번호+1 ... 다음페이지
			
			if(pageNo>totalPage) { //페이지번호가 전체페이지수보다 크면 for문 빠져나감
				break;
			}
		}
		
		//다음버튼
		if(pageNo <= totalPage) { //다음버튼이 만들어지는 조건
			pageNavi += "<li>";
			pageNavi += "<a class='page-item' href='/productListBySeller.do?reqPage="+(pageNo)+"'>";
			pageNavi += "<span class='material-icons'>chevron_right</span>"; //구글 아이콘 ... >
			pageNavi += "</a></li>";
		}
		
		pageNavi += "</ul>";
		
		ProductPageData ppd = new ProductPageData(productList, pageNavi, start, totalCount);
		
		return ppd;
	}



// 판매자별 강습 상품 목록 조회
	public LessonPageData selectLessonBySeller(int reqPage, String memberId) {
		int numPerPage = 10;
		int end = numPerPage * reqPage;
		int start = end - numPerPage + 1;
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("memberId", memberId);
		
		ArrayList<Lesson> lessonList = dao.selectLessonBySeller(map);
		
		int totalCount = dao.selectLessonCountBySeller(memberId);
		
		int totalPage = 0;
		if(totalCount%numPerPage == 0) {
			totalPage = totalCount/numPerPage;
		} else {
			totalPage = totalCount/numPerPage + 1;
		}
		
		int pageNaviSize = 5;
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize + 1;
		String pageNavi = "<ul class='pagination circle-style'>";
		
		//이전버튼 
		if(pageNo != 1) {
			pageNavi += "<li>";
			pageNavi += "<a class='page-item' href='/lessonListBySeller.do?reqPage="+(pageNo-1)+"'>";
			pageNavi += "<span class='material-icons'>chevron_left</span>"; //구글 아이콘 ... <
			pageNavi += "</a></li>";
		}
		
		//페이지 숫자 ... < 1 2 3 4 5 >
		for(int i=0; i<pageNaviSize; i++) {
			if(pageNo == reqPage) {
				pageNavi += "<li>";
				//현재 페이지는 active-page 클래스 추가 ... 색 다르게 적용
				pageNavi += "<a class='page-item active-page' href='/lessonListBySeller.do?reqPage="+(pageNo)+"'>";
				pageNavi += pageNo;
				pageNavi += "</a></li>";
			} else {
				pageNavi += "<li>";
				pageNavi += "<a class='page-item' href='/lessonListBySeller.do?reqPage="+(pageNo)+"'>";
				pageNavi += pageNo;
				pageNavi += "</a></li>";
			}
			pageNo++; //페이지번호+1 ... 다음페이지
			
			if(pageNo>totalPage) { //페이지번호가 전체페이지수보다 크면 for문 빠져나감
				break;
			}
		}
		
		//다음버튼
		if(pageNo <= totalPage) { //다음버튼이 만들어지는 조건
			pageNavi += "<li>";
			pageNavi += "<a class='page-item' href='/lessonListBySeller.do?reqPage="+(pageNo)+"'>";
			pageNavi += "<span class='material-icons'>chevron_right</span>"; //구글 아이콘 ... >
			pageNavi += "</a></li>";
		}
		
		pageNavi += "</ul>";
		
		LessonPageData lpd = new LessonPageData(lessonList, pageNavi, start, totalCount);
		
		return lpd;
	}



// 판매자별 숙박 상품 목록 조회
	public HousePageData selectHouseBySeller(int reqPage, String memberId) {
		int numPerPage = 10;
		int end = numPerPage * reqPage;
		int start = end - numPerPage + 1;
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("memberId", memberId);
		
		ArrayList<House> houseList = dao.selectHouseBySeller(map);
		
		int totalCount = dao.selectHouseCountBySeller(memberId);
		
		int totalPage = 0;
		if(totalCount%numPerPage == 0) {
			totalPage = totalCount/numPerPage;
		} else {
			totalPage = totalCount/numPerPage + 1;
		}
		
		int pageNaviSize = 5;
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize + 1;
		String pageNavi = "<ul class='pagination circle-style'>";
		
		//이전버튼 
		if(pageNo != 1) {
			pageNavi += "<li>";
			pageNavi += "<a class='page-item' href='/houseListBySeller.do?reqPage="+(pageNo-1)+"'>";
			pageNavi += "<span class='material-icons'>chevron_left</span>"; //구글 아이콘 ... <
			pageNavi += "</a></li>";
		}
		
		//페이지 숫자 ... < 1 2 3 4 5 >
		for(int i=0; i<pageNaviSize; i++) {
			if(pageNo == reqPage) {
				pageNavi += "<li>";
				//현재 페이지는 active-page 클래스 추가 ... 색 다르게 적용
				pageNavi += "<a class='page-item active-page' href='/houseListBySeller.do?reqPage="+(pageNo)+"'>";
				pageNavi += pageNo;
				pageNavi += "</a></li>";
			} else {
				pageNavi += "<li>";
				pageNavi += "<a class='page-item' href='/houseListBySeller.do?reqPage="+(pageNo)+"'>";
				pageNavi += pageNo;
				pageNavi += "</a></li>";
			}
			pageNo++; //페이지번호+1 ... 다음페이지
			
			if(pageNo>totalPage) { //페이지번호가 전체페이지수보다 크면 for문 빠져나감
				break;
			}
		}
		
		//다음버튼
		if(pageNo <= totalPage) { //다음버튼이 만들어지는 조건
			pageNavi += "<li>";
			pageNavi += "<a class='page-item' href='/houseListBySeller.do?reqPage="+(pageNo)+"'>";
			pageNavi += "<span class='material-icons'>chevron_right</span>"; //구글 아이콘 ... >
			pageNavi += "</a></li>";
		}
		
		pageNavi += "</ul>";
		
		HousePageData hpd = new HousePageData(houseList, pageNavi, start, totalCount);
		
		return hpd;
	}



// 판매자별 상품 목록 검색
	public ArrayList<Product> selectSearchProduct(SearchWithId sp) {
		return dao.selectSearchProduct(sp);
	}



// 판매자별 강습 상품 목록 검색
	public ArrayList<Lesson> selectSearchLesson(SearchWithId sp) {
		return dao.selectSearchLesson(sp);
	}



// 판매자별 숙박 상품 목록 검색
	public ArrayList<House> selectSearchHouse(SearchWithId sp) {
		return dao.selectSearchHouse(sp);
	}



// 판매자가 자신의 상품 1개를 판매중지 처리
	public int toSoldOut(int productNo, String productType) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("productNo", productNo);
		map.put("productStatus", 0);	//판매중지
		if(productType.equals("강습")) {
			return dao.updateLessonStatus(map);
		}else if(productType.equals("숙박")) {
			return dao.updateHouseStatus(map);
		}else {
			return 0;
		}
	}



// 판매자가 자신의 상품 1개를 판매재개
	public int toResale(int productNo, String productType) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("productNo", productNo);
		map.put("productStatus", 1);	//판매중
		if(productType.equals("강습")) {
			return dao.updateLessonStatus(map);
		}else if(productType.equals("숙박")) {
			return dao.updateHouseStatus(map);
		}else {
			return 0;
		}
	}
}
