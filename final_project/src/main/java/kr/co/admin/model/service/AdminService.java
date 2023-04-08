package kr.co.admin.model.service;

import java.util.ArrayList;
import java.util.StringTokenizer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.admin.model.dao.AdminDao;
import kr.co.house.model.vo.House;
import kr.co.lesson.model.vo.Lesson;
import kr.co.member.model.vo.Member;

@Service
public class AdminService {

	@Autowired
	AdminDao dao;

	public ArrayList<Member> selectAllMember() {
		
		return dao.selectAllMember();
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

	public ArrayList<Member> selectAllSellerApplication() {
		
		return dao.selectAllSellerApplication();
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

	public ArrayList<Lesson> selectAllLesson() {
		
		return dao.selectAllLesson();
	}

	public ArrayList<House> selectAllHouse() {

		return dao.selectAllHouse();
	}

	public int selectLessonCount() {
		
		return dao.selectLessonCount();
	}

	public int selectHouseCount() {
		
		return dao.selectHouseCount();
	}

	public boolean updateLessonStatus(String no, String status) {
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
	}

	public ArrayList<Lesson> selectNewLesson() {
		
		return dao.selectNewLesson();
	}

	public ArrayList<House> selectNewHouse() {
		
		return dao.selectNewHouse();
	}

	public int selectNewLessonCount() {
		
		return dao.selectNewLessonCount();
	}

	public int selectNewHouseCount() {

		return dao.selectNewHouseCount();
	}

	public int updateProductStopSelling(int no, int productType) {
		int result = 0;
		
		if(productType == 1) {
			result = dao.updateLessonStopSelling(no);
			
		} else if(productType == 2) {
			result = dao.updateHouseStopSelling(no);
		}
		
		return result;
	}

	public ArrayList<Lesson> selectSearchLesson(String searchLesson) {
		
		return dao.selectSearchLesson(searchLesson);
	}

	public int updateApproveProduct(int productType, int productNo) {
		int result = 0;
		
		if(productType == 1) {
			//강습
			result = dao.updateApproveLesson(productNo); //해당 상품 상태 1로 변경
			
		} else if(productType == 2) {
			//숙박
			result = dao.updateApproveHouse(productNo);
		}
		
		return result;
	}

	public boolean updateCheckedApproveProduct(int productType, String no) {
		//no 구분자 "/" 분리
		StringTokenizer sT1 = new StringTokenizer(no,"/");
		
		boolean result = true;
		
		if(productType == 1) {
			while(sT1.hasMoreTokens()) {
				int lessonNo = Integer.parseInt(sT1.nextToken());
				
				int changeResult = dao.updateApproveLesson(lessonNo); //상품 상태 변경
				
				if(changeResult == 0) {
					//실패
					result = false;
					break;
				}
			}
			
		} else if(productType == 2) {
			while(sT1.hasMoreTokens()) {
				int houseNo = Integer.parseInt(sT1.nextToken());
				
				int changeResult = dao.updateApproveHouse(houseNo); //상품 상태 변경
				
				if(changeResult == 0) {
					//실패
					result = false;
					break;
				}
			}
		}

		return result;
	}

	public int updateReturnProduct(int productType, int productNo) {
		int result = 0;
		
		if(productType == 1) {
			//강습
			result = dao.updateReturnLesson(productNo); //해당 상품 상태 1로 변경
			
		} else if(productType == 2) {
			//숙박
			result = dao.updateReturnHouse(productNo);
		}
		
		return result;
	}

	public boolean updateCheckedReturnProduct(int productType, String no) {
		//no 구분자 "/" 분리
		StringTokenizer sT1 = new StringTokenizer(no,"/");
		
		boolean result = true;
		
		if(productType == 1) {
			while(sT1.hasMoreTokens()) {
				int lessonNo = Integer.parseInt(sT1.nextToken());
				
				int changeResult = dao.updateReturnLesson(lessonNo); //상품 상태 변경
				
				if(changeResult == 0) {
					//실패
					result = false;
					break;
				}
			}
			
		} else if(productType == 2) {
			while(sT1.hasMoreTokens()) {
				int houseNo = Integer.parseInt(sT1.nextToken());
				
				int changeResult = dao.updateReturnHouse(houseNo); //상품 상태 변경
				
				if(changeResult == 0) {
					//실패
					result = false;
					break;
				}
			}
		}

		return result;
	}

/*
	public ArrayList<Order> selectAllOrder() {
		
		return dao.selectAllOrder();
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

	public ArrayList<OrderDetail> selectOrderDetail(int orderNo) {

		return dao.selectOrderDetail(orderNo);
	}
	
	public int selectOrderDetailCount(int orderNo) {
	
		return dao.selectOrderDetailCount(orderNo);
	}
*/


}
