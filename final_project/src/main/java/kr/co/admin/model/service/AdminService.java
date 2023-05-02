package kr.co.admin.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.StringTokenizer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.admin.model.dao.AdminDao;
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
import kr.co.admin.model.vo.Visitant;
import kr.co.carpool.model.vo.Carpool;
import kr.co.house.model.vo.House;
import kr.co.lesson.model.vo.Lesson;
import kr.co.member.model.vo.Member;
import kr.co.member.model.vo.Order;
import kr.co.review.model.vo.Review;

@Service("adminService")
public class AdminService {

	@Autowired
	AdminDao dao;
	
	public int setVisitTotalCount() {
		//System.out.println("adminservice : "+dao);
		return dao.setVisitTotalCount();
	}

	public int getVisitTodayCount() {
		
		return dao.getVisitTodayCount();
	}

	public int getVisitTotalCount() {
		
		return dao.getVisitTotalCount();
	}
	
	public ArrayList<Visitant> getVisitWeekCount() {
		
		return dao.getVisitWeekCount();
	}

	public MemberPageData selectAllMember(int reqPage) {
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
		
		ArrayList<Member> memberList = dao.selectAllMember(map); //회원목록 전체 조회
		
		/*<페이징 제작 시작>*/
		/*한페이지당 게시물 수 : 10
		총 게시물 수 : 222
		→ 총 23개 페이지 필요*/
		//전체 페이지 수를 계산하려면 -> 먼저 총 게시물 수 조회 필요
		int totalCount = dao.selectMemberCount();
		
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
			pageNavi += "<a class='page-item' href='/memberList.do?reqPage="+(pageNo-1)+"'>";
			pageNavi += "<span class='material-icons'>chevron_left</span>"; //구글 아이콘 ... <
			pageNavi += "</a></li>";
		}
		
		//페이지 숫자 ... < 1 2 3 4 5 >
		for(int i=0; i<pageNaviSize; i++) {
			if(pageNo == reqPage) {
				pageNavi += "<li>";
				//현재 페이지는 active-page 클래스 추가 ... 색 다르게 적용
				pageNavi += "<a class='page-item active-page' href='/memberList.do?reqPage="+(pageNo)+"'>";
				pageNavi += pageNo;
				pageNavi += "</a></li>";
			} else {
				pageNavi += "<li>";
				pageNavi += "<a class='page-item' href='/memberList.do?reqPage="+(pageNo)+"'>";
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
			pageNavi += "<a class='page-item' href='/memberList.do?reqPage="+(pageNo)+"'>";
			pageNavi += "<span class='material-icons'>chevron_right</span>"; //구글 아이콘 ... >
			pageNavi += "</a></li>";
		}
		
		pageNavi += "</ul>";
		
		MemberPageData mpd = new MemberPageData(memberList, pageNavi, start);
		
		return mpd;
	}
	
	public int selectMemberCount() {

		return dao.selectMemberCount();
	}

	public int updateMemberGrade(Member m) {
		
		return dao.updateMemberGrade(m);
	}

	public boolean checkedChangeGrade(String id, String grade) {
		//id, grade 구분자 "/" 분리
		StringTokenizer sT1 = new StringTokenizer(id,"/");
		StringTokenizer sT2 = new StringTokenizer(grade,"/");
		
		boolean result = true;
		
		while(sT1.hasMoreTokens()) {
			//토큰 남아있으면 true
			String memberId = sT1.nextToken();
			int memberGrade = Integer.parseInt(sT2.nextToken());
			
			Member m = new Member();
			m.setMemberId(memberId);
			m.setMemberGrade(memberGrade);
			
			int changeResult = dao.updateMemberGrade(m); //등급 변경
			
			if(changeResult == 0) {
				//실패한 경우
				result = false;
				break;
			}
		}
		
		return result;
	}

	public boolean deleteMember(String id) {
		//id 구분자 "/" 분리
		StringTokenizer sT = new StringTokenizer(id,"/");
		
		boolean result = true;
		
		while(sT.hasMoreTokens()) {
			String memberId = sT.nextToken();
			
			int deleteResult = dao.deleteMember(memberId); //회원 탈퇴
			
			if(deleteResult == 0) {
				//실패
				result = false;
				break;
			}
		}

		return result;
	}

	public ArrayList<Member> selectSearchMember(String searchMemberId) {
		
		return dao.selectSearchMember(searchMemberId);
	}

	public MemberPageData selectAllSellerApplication(int reqPage) {
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
		
		ArrayList<Member> sellerAppList = dao.selectAllSellerApplication(map); //회원목록 전체 조회
		
		/*<페이징 제작 시작>*/
		/*한페이지당 게시물 수 : 10
		총 게시물 수 : 222
		→ 총 23개 페이지 필요*/
		//전체 페이지 수를 계산하려면 -> 먼저 총 게시물 수 조회 필요
		int totalCount = dao.selectSellerAppCount();
		
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
			pageNavi += "<a class='page-item' href='/sellerApplicationList.do?reqPage="+(pageNo-1)+"'>";
			pageNavi += "<span class='material-icons'>chevron_left</span>"; //구글 아이콘 ... <
			pageNavi += "</a></li>";
		}
		
		//페이지 숫자 ... < 1 2 3 4 5 >
		for(int i=0; i<pageNaviSize; i++) {
			if(pageNo == reqPage) {
				pageNavi += "<li>";
				//현재 페이지는 active-page 클래스 추가 ... 색 다르게 적용
				pageNavi += "<a class='page-item active-page' href='/sellerApplicationList.do?reqPage="+(pageNo)+"'>";
				pageNavi += pageNo;
				pageNavi += "</a></li>";
			} else {
				pageNavi += "<li>";
				pageNavi += "<a class='page-item' href='/sellerApplicationList.do?reqPage="+(pageNo)+"'>";
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
			pageNavi += "<a class='page-item' href='/sellerApplicationList.do?reqPage="+(pageNo)+"'>";
			pageNavi += "<span class='material-icons'>chevron_right</span>"; //구글 아이콘 ... >
			pageNavi += "</a></li>";
		}
		
		pageNavi += "</ul>";
		
		MemberPageData mpd = new MemberPageData(sellerAppList, pageNavi, start);
		
		return mpd;
	}

	public int selectSellerAppCount() {
		
		return dao.selectSellerAppCount();
	}

	public Member selectOneSellerApplication(String searchMemberId) {

		return dao.selectOneSellerApplication(searchMemberId);
	}

	public boolean updateMemberGradeSeller(String id, String no) {
		//id, no 구분자 "/" 분리
		StringTokenizer sT1 = new StringTokenizer(id,"/");
		StringTokenizer sT2 = new StringTokenizer(no,"/");
		
		boolean result = true;
		
		while(sT1.hasMoreTokens()||sT2.hasMoreTokens()) {
			String memberId = sT1.nextToken();
			int memberNo = Integer.parseInt(sT2.nextToken());
			
			int changeResult = dao.updateMemberGradeSeller(memberId); //등급 변경
			int deleteResult = dao.deleteSellerApplication(memberNo); //seller_application_tbl에서 삭제
			
			if(changeResult == 0 || deleteResult == 0) {
				//실패
				result = false;
				break;
			} 
		}

		return result;
	}

	public ArrayList<Lesson> selectSearchLesson(Search sp) {

		return dao.selectSearchLesson(sp);
	}
	

	public ArrayList<House> selectSearchHouse(Search sp) {
		
		return dao.selectSearchHouse(sp);
	}


	public LessonPageData selectAllLesson(int reqPage) {
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
		
		ArrayList<Lesson> lessonList = dao.selectAllLesson(map); //회원목록 전체 조회
		
		/*<페이징 제작 시작>*/
		/*한페이지당 게시물 수 : 10
		총 게시물 수 : 222
		→ 총 23개 페이지 필요*/
		//전체 페이지 수를 계산하려면 -> 먼저 총 게시물 수 조회 필요
		int totalCount = dao.selectLessonCount();
		
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
			pageNavi += "<a class='page-item' href='/productListLesson.do?reqPage="+(pageNo-1)+"'>";
			pageNavi += "<span class='material-icons'>chevron_left</span>"; //구글 아이콘 ... <
			pageNavi += "</a></li>";
		}
		
		//페이지 숫자 ... < 1 2 3 4 5 >
		for(int i=0; i<pageNaviSize; i++) {
			if(pageNo == reqPage) {
				pageNavi += "<li>";
				//현재 페이지는 active-page 클래스 추가 ... 색 다르게 적용
				pageNavi += "<a class='page-item active-page' href='/productListLesson.do?reqPage="+(pageNo)+"'>";
				pageNavi += pageNo;
				pageNavi += "</a></li>";
			} else {
				pageNavi += "<li>";
				pageNavi += "<a class='page-item' href='/productListLesson.do?reqPage="+(pageNo)+"'>";
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
			pageNavi += "<a class='page-item' href='/productListLesson.do?reqPage="+(pageNo)+"'>";
			pageNavi += "<span class='material-icons'>chevron_right</span>"; //구글 아이콘 ... >
			pageNavi += "</a></li>";
		}
		
		pageNavi += "</ul>";
		
		LessonPageData lpd = new LessonPageData(lessonList, pageNavi, start, totalCount);
		
		return lpd;
	}

	public HousePageData selectAllHouse(int reqPage) {
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
		
		ArrayList<House> houseList = dao.selectAllHouse(map); //회원목록 전체 조회
		
		/*<페이징 제작 시작>*/
		/*한페이지당 게시물 수 : 10
		총 게시물 수 : 222
		→ 총 23개 페이지 필요*/
		//전체 페이지 수를 계산하려면 -> 먼저 총 게시물 수 조회 필요
		int totalCount = dao.selectHouseCount();
		
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
			pageNavi += "<a class='page-item' href='/productListHouse.do?reqPage="+(pageNo-1)+"'>";
			pageNavi += "<span class='material-icons'>chevron_left</span>"; //구글 아이콘 ... <
			pageNavi += "</a></li>";
		}
		
		//페이지 숫자 ... < 1 2 3 4 5 >
		for(int i=0; i<pageNaviSize; i++) {
			if(pageNo == reqPage) {
				pageNavi += "<li>";
				//현재 페이지는 active-page 클래스 추가 ... 색 다르게 적용
				pageNavi += "<a class='page-item active-page' href='/productListHouse.do?reqPage="+(pageNo)+"'>";
				pageNavi += pageNo;
				pageNavi += "</a></li>";
			} else {
				pageNavi += "<li>";
				pageNavi += "<a class='page-item' href='/productListHouse.do?reqPage="+(pageNo)+"'>";
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
			pageNavi += "<a class='page-item' href='/productListHouse.do?reqPage="+(pageNo)+"'>";
			pageNavi += "<span class='material-icons'>chevron_right</span>"; //구글 아이콘 ... >
			pageNavi += "</a></li>";
		}
		
		pageNavi += "</ul>";
		
		HousePageData hpd = new HousePageData(houseList, pageNavi, start, totalCount);
		
		return hpd;
	}

	public int selectLessonCount() {
		
		return dao.selectLessonCount();
	}

	public int selectHouseCount() {
		
		return dao.selectHouseCount();
	}
	
	public boolean updateProductStatus(String pType, String no, String status) {
		//no, status 구분자 "/" 분리
		StringTokenizer sT1 = new StringTokenizer(pType,"/");
		StringTokenizer sT2 = new StringTokenizer(no,"/");
		StringTokenizer sT3 = new StringTokenizer(status,"/");
		
		boolean result = true;
		
		while(sT1.hasMoreTokens()) {
			String productType = sT1.nextToken();
			int productNo = Integer.parseInt(sT2.nextToken());
			int productStatus = Integer.parseInt(sT3.nextToken());

			if(productType.equals("강습")) {
				Lesson l = new Lesson();
				l.setLessonNo(productNo);
				l.setLessonStatus(productStatus);
				
				int changeResult = dao.updateLessonStatus(l); //상품 상태 변경
				
				if(changeResult == 0) {
					//실패
					result = false;
					break;
				}
				
			} else {
				House h = new House();
				h.setHouseNo(productNo);
				h.setHouseStatus(productStatus);
				
				int changeResult = dao.updateHouseStatus(h); //상품 상태 변경
				
				if(changeResult == 0) {
					//실패
					result = false;
					break;
				}
			}
		}
		
		return result;
	}

	/*public boolean updateLessonStatus(String no, String status) {
		//no, status 구분자 "/" 분리
		StringTokenizer sT1 = new StringTokenizer(no,"/");
		StringTokenizer sT2 = new StringTokenizer(status,"/");
		
		boolean result = true;
		Lesson l = new Lesson();
		
		while(sT1.hasMoreTokens()) {
			int lessonNo = Integer.parseInt(sT1.nextToken());
			int lessonStatus = Integer.parseInt(sT2.nextToken());
			
			l.setLessonNo(lessonNo);
			l.setLessonStatus(lessonStatus);
			
			int changeResult = dao.updateLessonStatus(l); //상품 상태 변경
			
			if(changeResult == 0) {
				//실패
				result = false;
				break;
			}
		}

		return result;
	}

	public boolean updateHouseStatus(String no, String status) {
		//no, status 구분자 "/" 분리
		StringTokenizer sT1 = new StringTokenizer(no,"/");
		StringTokenizer sT2 = new StringTokenizer(status,"/");
		
		boolean result = true;
		House h = new House();
		
		while(sT1.hasMoreTokens()) {
			int houseNo = Integer.parseInt(sT1.nextToken());
			int houseStatus = Integer.parseInt(sT2.nextToken());
			
			h.setHouseNo(houseNo);
			h.setHouseStatus(houseStatus);
			
			int changeResult = dao.updateHouseStatus(h); //상품 상태 변경
			
			if(changeResult == 0) {
				//실패
				result = false;
				break;
			}
		}

		return result;
	}*/

	public LessonPageData selectNewLesson(int reqPage) {
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
		
		ArrayList<Lesson> lessonList = dao.selectNewLesson(map); //회원목록 전체 조회
		
		/*<페이징 제작 시작>*/
		/*한페이지당 게시물 수 : 10
		총 게시물 수 : 222
		→ 총 23개 페이지 필요*/
		//전체 페이지 수를 계산하려면 -> 먼저 총 게시물 수 조회 필요
		int totalCount = dao.selectNewLessonCount();
		
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
			pageNavi += "<a class='page-item' href='/newProductLesson.do?reqPage="+(pageNo-1)+"'>";
			pageNavi += "<span class='material-icons'>chevron_left</span>"; //구글 아이콘 ... <
			pageNavi += "</a></li>";
		}
		
		//페이지 숫자 ... < 1 2 3 4 5 >
		for(int i=0; i<pageNaviSize; i++) {
			if(pageNo == reqPage) {
				pageNavi += "<li>";
				//현재 페이지는 active-page 클래스 추가 ... 색 다르게 적용
				pageNavi += "<a class='page-item active-page' href='/newProductLesson.do?reqPage="+(pageNo)+"'>";
				pageNavi += pageNo;
				pageNavi += "</a></li>";
			} else {
				pageNavi += "<li>";
				pageNavi += "<a class='page-item' href='/newProductLesson.do?reqPage="+(pageNo)+"'>";
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
			pageNavi += "<a class='page-item' href='/newProductLesson.do?reqPage="+(pageNo)+"'>";
			pageNavi += "<span class='material-icons'>chevron_right</span>"; //구글 아이콘 ... >
			pageNavi += "</a></li>";
		}
		
		pageNavi += "</ul>";
		
		LessonPageData lpd = new LessonPageData(lessonList, pageNavi, start, totalCount);
		
		return lpd;
	}

	public HousePageData selectNewHouse(int reqPage) {
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
		
		ArrayList<House> houseList = dao.selectNewHouse(map); //회원목록 전체 조회
		
		/*<페이징 제작 시작>*/
		/*한페이지당 게시물 수 : 10
		총 게시물 수 : 222
		→ 총 23개 페이지 필요*/
		//전체 페이지 수를 계산하려면 -> 먼저 총 게시물 수 조회 필요
		int totalCount = dao.selectNewHouseCount();
		
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
			pageNavi += "<a class='page-item' href='/newProductHouse.do?reqPage="+(pageNo-1)+"'>";
			pageNavi += "<span class='material-icons'>chevron_left</span>"; //구글 아이콘 ... <
			pageNavi += "</a></li>";
		}
		
		//페이지 숫자 ... < 1 2 3 4 5 >
		for(int i=0; i<pageNaviSize; i++) {
			if(pageNo == reqPage) {
				pageNavi += "<li>";
				//현재 페이지는 active-page 클래스 추가 ... 색 다르게 적용
				pageNavi += "<a class='page-item active-page' href='/newProductHouse.do?reqPage="+(pageNo)+"'>";
				pageNavi += pageNo;
				pageNavi += "</a></li>";
			} else {
				pageNavi += "<li>";
				pageNavi += "<a class='page-item' href='/newProductHouse.do?reqPage="+(pageNo)+"'>";
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
			pageNavi += "<a class='page-item' href='/newProductHouse.do?reqPage="+(pageNo)+"'>";
			pageNavi += "<span class='material-icons'>chevron_right</span>"; //구글 아이콘 ... >
			pageNavi += "</a></li>";
		}
		
		pageNavi += "</ul>";
		
		HousePageData hpd = new HousePageData(houseList, pageNavi, start, totalCount);
		
		return hpd;
	}

	public int selectNewLessonCount() {
		
		return dao.selectNewLessonCount();
	}

	public int selectNewHouseCount() {

		return dao.selectNewHouseCount();
	}

	public int updateProductStopSelling(int no, String productType) {
		int result = 0;
		
		if(productType.equals("강습")) {
			result = dao.updateLessonStopSelling(no);
			
		} else if(productType.equals("숙박")) {
			result = dao.updateHouseStopSelling(no);
		}
		
		return result;
	}

	public int updateApproveProduct(String productType, int productNo) {
		int result = 0;
		
		if(productType.equals("강습")) {
			//강습
			result = dao.updateApproveLesson(productNo); //해당 상품 상태 1로 변경
			
		} else if(productType.equals("숙박")) {
			//숙박
			result = dao.updateApproveHouse(productNo);
		}
		
		return result;
	}

	public boolean updateCheckedApproveProduct(String pType, String no) {
		//no 구분자 "/" 분리
		StringTokenizer sT1 = new StringTokenizer(pType,"/");
		StringTokenizer sT2 = new StringTokenizer(no,"/");
		
		boolean result = true;
		while(sT1.hasMoreTokens()) {
			String productType = sT1.nextToken();
			int productNo = Integer.parseInt(sT2.nextToken());
			
			if(productType.equals("강습")) {
				int changeResult = dao.updateApproveLesson(productNo); //상품 상태 변경
				if(changeResult == 0) {
					result = false;
					break;
				}
				
			} else {
				int changeResult = dao.updateApproveHouse(productNo); //상품 상태 변경
				if(changeResult == 0) {
					result = false;
					break;
				}
			}
		}
		
		return result;
	}

	public int updateReturnProduct(String productType, RejectProduct rp) {
		int result = 0;
		
		if(productType.equals("강습")) {
			//강습
			result = dao.updateReturnLesson(rp); //해당 상품 상태 1로 변경
			
		} else if(productType.equals("숙박")) {
			//숙박
			result = dao.updateReturnHouse(rp);
		}
		
		return result;
	}

	public boolean updateCheckedReturnProduct(String productType, String no) {
		//no 구분자 "/" 분리
		StringTokenizer sT1 = new StringTokenizer(no,"/");
		
		boolean result = true;
		
		if(productType.equals("강습")) {
			while(sT1.hasMoreTokens()) {
				int lessonNo = Integer.parseInt(sT1.nextToken());
				
				/*int changeResult = dao.updateReturnLesson(lessonNo); //상품 상태 변경
				
				if(changeResult == 0) {
					//실패
					result = false;
					break;
				}*/
			}
			
		} else if(productType.equals("숙박")) {
			while(sT1.hasMoreTokens()) {
				int houseNo = Integer.parseInt(sT1.nextToken());
				
				/*int changeResult = dao.updateReturnHouse(houseNo); //상품 상태 변경
				
				if(changeResult == 0) {
					//실패
					result = false;
					break;
				}*/
			}
		}

		return result;
	}

	public OrderPageData selectAllOrder(int reqPage) {
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
		
		ArrayList<Order> orderList = dao.selectAllOrder(map); //회원목록 전체 조회
		
		/*<페이징 제작 시작>*/
		/*한페이지당 게시물 수 : 10
		총 게시물 수 : 222
		→ 총 23개 페이지 필요*/
		//전체 페이지 수를 계산하려면 -> 먼저 총 게시물 수 조회 필요
		int totalCount = dao.selectOrderCount();
		
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
			pageNavi += "<a class='page-item' href='/salesDetails.do?reqPage="+(pageNo-1)+"'>";
			pageNavi += "<span class='material-icons'>chevron_left</span>"; //구글 아이콘 ... <
			pageNavi += "</a></li>";
		}
		
		//페이지 숫자 ... < 1 2 3 4 5 >
		for(int i=0; i<pageNaviSize; i++) {
			if(pageNo == reqPage) {
				pageNavi += "<li>";
				//현재 페이지는 active-page 클래스 추가 ... 색 다르게 적용
				pageNavi += "<a class='page-item active-page' href='/salesDetails.do?reqPage="+(pageNo)+"'>";
				pageNavi += pageNo;
				pageNavi += "</a></li>";
			} else {
				pageNavi += "<li>";
				pageNavi += "<a class='page-item' href='/salesDetails.do?reqPage="+(pageNo)+"'>";
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
			pageNavi += "<a class='page-item' href='/salesDetails.do?reqPage="+(pageNo)+"'>";
			pageNavi += "<span class='material-icons'>chevron_right</span>"; //구글 아이콘 ... >
			pageNavi += "</a></li>";
		}
		
		pageNavi += "</ul>";
		
		OrderPageData opd = new OrderPageData(orderList, pageNavi, start);
		
		return opd;
	}

	public int selectOrderCount() {
		
		return dao.selectOrderCount();
	}


	public int deleteOrder(int orderNo) {
		
		return dao.deleteOrder(orderNo);
	}

	public boolean deleteCheckedOrder(String no) {
		//no 구분자 "/" 분리
		StringTokenizer sT1 = new StringTokenizer(no,"/");
		
		boolean result = true;
		
		while(sT1.hasMoreTokens()) {
			int orderNo = Integer.parseInt(sT1.nextToken());
			
			int deleteResult = dao.deleteOrder(orderNo); //상품 상태 변경
			
			if(deleteResult == 0) {
				//실패
				result = false;
				break;
			}
		}

		return result;
	}

	public ArrayList<Order> selectOrderDetail(int orderNo) {

		return dao.selectOrderDetail(orderNo);
	}
	
	public int selectOrderDetailCount(int orderNo) {
	
		return dao.selectOrderDetailCount(orderNo);
	}

	public Order selectOrderDetailInfo(int orderNo) {

		return dao.selectOrderDetailInfo(orderNo);
	}

	public ArrayList<Order> selectSearchSalesDetails(SearchById sp) {
		
		return dao.selectSearchSalesDetails(sp);
	}

	public ProductPageData selectAllProduct(int reqPage) {
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
		
		ArrayList<Product> productList = dao.selectAllProduct(map); //회원목록 전체 조회
		
		/*<페이징 제작 시작>*/
		/*한페이지당 게시물 수 : 10
		총 게시물 수 : 222
		→ 총 23개 페이지 필요*/
		//전체 페이지 수를 계산하려면 -> 먼저 총 게시물 수 조회 필요
		int totalCount = dao.selectAllProductCount();
		
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
			pageNavi += "<a class='page-item' href='/productListAll.do?reqPage="+(pageNo-1)+"'>";
			pageNavi += "<span class='material-icons'>chevron_left</span>"; //구글 아이콘 ... <
			pageNavi += "</a></li>";
		}
		
		//페이지 숫자 ... < 1 2 3 4 5 >
		for(int i=0; i<pageNaviSize; i++) {
			if(pageNo == reqPage) {
				pageNavi += "<li>";
				//현재 페이지는 active-page 클래스 추가 ... 색 다르게 적용
				pageNavi += "<a class='page-item active-page' href='/productListAll.do?reqPage="+(pageNo)+"'>";
				pageNavi += pageNo;
				pageNavi += "</a></li>";
			} else {
				pageNavi += "<li>";
				pageNavi += "<a class='page-item' href='/productListAll.do?reqPage="+(pageNo)+"'>";
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
			pageNavi += "<a class='page-item' href='/productListAll.do?reqPage="+(pageNo)+"'>";
			pageNavi += "<span class='material-icons'>chevron_right</span>"; //구글 아이콘 ... >
			pageNavi += "</a></li>";
		}
		
		pageNavi += "</ul>";
		
		ProductPageData ppd = new ProductPageData(productList, pageNavi, start, totalCount);
		
		return ppd;
	}
	
	public int selectAllProductCount() {
		
		return dao.selectAllProductCount();
	}
	
	public ArrayList<Product> selectSearchProduct(Search sp) {
		
		return dao.selectSearchProduct(sp);
	}

	public ProductPageData selectAllNewProduct(int reqPage) {
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
		
		ArrayList<Product> productList = dao.selectAllNewProduct(map); //회원목록 전체 조회
		
		/*<페이징 제작 시작>*/
		/*한페이지당 게시물 수 : 10
		총 게시물 수 : 222
		→ 총 23개 페이지 필요*/
		//전체 페이지 수를 계산하려면 -> 먼저 총 게시물 수 조회 필요
		int totalCount = dao.selectNewProductCount();
		
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
			pageNavi += "<a class='page-item' href='/newProductAll.do?reqPage="+(pageNo-1)+"'>";
			pageNavi += "<span class='material-icons'>chevron_left</span>"; //구글 아이콘 ... <
			pageNavi += "</a></li>";
		}
		
		//페이지 숫자 ... < 1 2 3 4 5 >
		for(int i=0; i<pageNaviSize; i++) {
			if(pageNo == reqPage) {
				pageNavi += "<li>";
				//현재 페이지는 active-page 클래스 추가 ... 색 다르게 적용
				pageNavi += "<a class='page-item active-page' href='/newProductAll.do?reqPage="+(pageNo)+"'>";
				pageNavi += pageNo;
				pageNavi += "</a></li>";
			} else {
				pageNavi += "<li>";
				pageNavi += "<a class='page-item' href='/newProductAll.do?reqPage="+(pageNo)+"'>";
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
			pageNavi += "<a class='page-item' href='/newProductAll.do?reqPage="+(pageNo)+"'>";
			pageNavi += "<span class='material-icons'>chevron_right</span>"; //구글 아이콘 ... >
			pageNavi += "</a></li>";
		}
		
		pageNavi += "</ul>";
		
		ProductPageData ppd = new ProductPageData(productList, pageNavi, start, totalCount);
		
		return ppd;
	}

	public int selectNewProductCount() {
		
		return dao.selectNewProductCount();
	}

	public ArrayList<Lesson> selectTopLesson() {

		return dao.selectTopLesson();
	}

	public ArrayList<House> selectTopHouse() {

		return dao.selectTopHouse();
	}

	public CarpoolPageData selectAllCarpool(int reqPage) {
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
		
		ArrayList<Carpool> carpoolList = dao.selectAllCarpool(map); //회원목록 전체 조회
		
		/*<페이징 제작 시작>*/
		/*한페이지당 게시물 수 : 10
		총 게시물 수 : 222
		→ 총 23개 페이지 필요*/
		//전체 페이지 수를 계산하려면 -> 먼저 총 게시물 수 조회 필요
		int totalCount = dao.selectCarpoolCount();
		
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
			pageNavi += "<a class='page-item' href='/carpoolList.do?reqPage="+(pageNo-1)+"'>";
			pageNavi += "<span class='material-icons'>chevron_left</span>"; //구글 아이콘 ... <
			pageNavi += "</a></li>";
		}
		
		//페이지 숫자 ... < 1 2 3 4 5 >
		for(int i=0; i<pageNaviSize; i++) {
			if(pageNo == reqPage) {
				pageNavi += "<li>";
				//현재 페이지는 active-page 클래스 추가 ... 색 다르게 적용
				pageNavi += "<a class='page-item active-page' href='/carpoolList.do?reqPage="+(pageNo)+"'>";
				pageNavi += pageNo;
				pageNavi += "</a></li>";
			} else {
				pageNavi += "<li>";
				pageNavi += "<a class='page-item' href='/carpoolList.do?reqPage="+(pageNo)+"'>";
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
			pageNavi += "<a class='page-item' href='/carpoolList.do?reqPage="+(pageNo)+"'>";
			pageNavi += "<span class='material-icons'>chevron_right</span>"; //구글 아이콘 ... >
			pageNavi += "</a></li>";
		}
		
		pageNavi += "</ul>";
		
		CarpoolPageData cpd = new CarpoolPageData(carpoolList, pageNavi, start);
		
		return cpd;
	}

	public int selectCarpoolCount() {

		return dao.selectCarpoolCount();
	}

	public boolean deleteCheckedCarpool(String no) {
		//no 구분자 "/" 분리
		StringTokenizer sT1 = new StringTokenizer(no,"/");
		
		boolean result = true;
		
		while(sT1.hasMoreTokens()) {
			int carpoolNo = Integer.parseInt(sT1.nextToken());
			
			int deleteResult = dao.deleteCarpool(carpoolNo); //카풀 게시글 삭제(update)
			
			if(deleteResult == 0) {
				//실패
				result = false;
				break;
			}
		}

		return result;
	}

	public ArrayList<Carpool> selectSearchCarpool(String searchKeyword) {
		return dao.selectSearchCarpool(searchKeyword);
	}

	public int selectNewAdminChatCount() {
		
		return dao.selectNewAdminChatCount();
	}

	public int selectTotalSalesAmount() {

		return dao.selectTotalSalesAmount();
	}

	public int selectTodaySalesAmount() {
		
		return dao.selectTodaySalesAmount();
	}

	public int selectCarpoolRecruitingCount() {
		
		return dao.selectCarpoolRecruitingCount();
	}

	public ArrayList<Product> selectNewProduct() {
		
		return dao.selectNewProduct();
	}

	public ArrayList<Member> selectNewMember() {
		
		return dao.selectNewMember();
	}

	public ArrayList<Member> selectNewCarpoolDriver() {

		return dao.selectNewCarpoolDriver();
	}

	public ArrayList<Member> selectAllAdmin() {
		
		return dao.selectAllAdmin();
	}
	
	public ArrayList<GenderRatio> selectGenderRatio() {
		
		return dao.selectGenderRatio();
	}

	public ArrayList<SalesAmount> selectLessonSalesAmount() {
		
		return dao.selectLessonSalesAmount();
	}

	public ArrayList<SalesAmount> selectHouseSalesAmount() {
		
		return dao.selectHouseSalesAmount();
	}
	
	public ArrayList<SalesAmount> selectAllSalesAmount() {
		
		return dao.selectAllSalesAmount();
	}

	public ArrayList<Review> selectTopReview() {

		return dao.selectTopReview();
	}

}
