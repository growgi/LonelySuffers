package kr.co.member.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Order {
	
	private int orderNo;
	private int memberNo;
	private int orderAllPrice;
	private int orderStatus;
	private String orderStatusString;
	private String orderDate;
	private int orderProduct;
	private String orderProductString;
	
	private String memberId;
	
	//OrderDetail
	private int orderDetailNo;
	private int houseNo;
	private int roomBookNo;
	private int lessonNo;
	private int lessonBookNo;
	private int productPrice;
	
	//Lesson
	private String lessonNameLevel;		// 강습 분반.       예) 초급자A  초급자B  중급자   숙력자
	private String lessonTitle;			// 상품 웹페이지에 노출될 제목
	private String lessonCity;			// 광역시/도   부분만. 지역별 필터링에 쓸 것.
	private String lessonTeacher;		// 강사이름. MEMBER_NAME을 가져오는게 아니라, 판매자가 임의로 적는 값		
	private String lessonStartTime;		// "HH:MM " 시작시간만, default(선택시간) 로우  하나 더
	private String lessonEndTime;		// "HH:MM " 종료시간만
	private String lessonInfoPic;		// 첨부사진. 본문 첨부가 아니라 첨부파일임.
	
	//House
	private String houseTitle;			// 상품 웹페이지에 노출될 제목
	private String houseCity;			// 광역시/도   부분만. 지역별 필터링에 쓸 것.
	private String houseWriter;				// 상품등록자의 MEMBER_ID (글쓴이)
	private String roomTitle;			// 숙박소이름      예) XX펜션, ABC하우스
	private int houseBarbecue;			//0:안쓰는 것, 1:쓰는것
	private int houseParty;				//0:안쓰는 것, 1:쓰는것
	private String housePhoto1;
	
	//room_book
	private String bookStartDate;		// 예약기간 첫날의 YYYY-MM-DD
	private String bookEndDate;			/* 예약기간 마지막날의 YYYY-MM-DD   그러나 퇴실 날짜에도 다른 고객이 오후부터 입실 가능해야 하므로, -1일 한 값을 저장함.*/
	private int roomBookPrice;
	
	//lesson_book
	private int lessonBookPrice; 
}
