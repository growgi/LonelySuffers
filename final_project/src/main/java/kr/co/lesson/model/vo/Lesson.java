package kr.co.lesson.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor


// 강습 테이블   LESSON Table
// 이 테이블의 Row가 웹페이지에 표시되는 게시물 단위


public class Lesson {
	private int lessonNo;				// Primary key
	
	private int lessonLevel;			// 1 = 초급 / 2 = 중급 / 3 = 상급

	private String lessonTitle;			// 상품 웹페이지에 노출될 제목
	private String lessonCity;			// 광역시/도   부분만. 지역별 필터링에 쓸 것.
	private int lessonPrice;			// 강습(상품) 가격
	private String lessonInfo;			// 게시글에서 내용(content)이라고 인지하면 됨.
	private String lessonInfoPic;		// 첨부사진. 본문 첨부가 아니라 첨부파일임.
	private String lessonTeacher;		// 강사이름. MEMBER_NAME을 가져오는게 아니라, 판매자가 임의로 적는 값
	private int lessonMaxNo;			// 수업 당 정원. 최대재고량으로 인지하면 됨.
	private String lessonStartTime;		// "HH:MM " 시작시간만, default(선택시간) 로우  하나 더
	private String lessonEndTime;		// "HH:MM " 종료시간만
	private int lessonStatus;			/* 상품 상태. 노출 여부를 결정함.
											1 = 판매중. 전체공개
											0 = 판매중지
										   -1 = 승인대기중. DB에는 insert됐지만, 고객들에게 노출되지는 않는 상품(게시물)
	  									   -2 = 승인 반려됨. DB에는 insert됐지만, 고객들에게 노출되지는 않는 상품(게시물)	*/
	private float lessonScore;			// 별평점후기 Table (RIVEIW)이 변경될때마다, oracle에서 trigger가 작동해서 LESSON 테이블의 LESSON_SCORE를 갱신
	private String writer;				// 상품등록자의 MEMBER_ID (글쓴이)
	private String rejectComment;		// houseStatus -1인 게시물을 관리자가 반려해서 -2로 상태를 바꿀 때, 사유를 입력하는 란

// 테이블에 Column으로 존재하지 않지만, 다중 insert를 하기 위해서 추가된 변수들
	private int lessonTimeLength;		// 종료시간을 얻어내기 위해 받은 강습 소요시간 단위(분)
	private String lessonStartTimes[];	// 다중 시간대를 한꺼번에 테이블에 여러개의 row로 입력하기 위한 배열
	private String lessonEndTimes[];
	
	//level값을 가져오는 것 level1=초급, level2=중급, level3=상급
	private int level1;
	private int level2;
	private int level3;

	public String getLessonInfoBr() {
		return lessonInfo.replaceAll("\r\n","<br>");
	}
	public String getLessonStartTime5() {
		return lessonStartTime.trim();
	}
	public String getLessonEndTime5() {
		return lessonEndTime.trim();
	}
}
