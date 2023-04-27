package kr.co.lesson.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor


// 강습_예약 테이블   ROOM_BOOK Table
// 이 테이블의 Row가 고객이 예약(구매)한 단위. 따라서 날짜별로 총 예약 인원수가 정원(LESSON_MAX_NO)을 초과해서는 안 됨.


public class LessonBook {
	private int lessonBookNo;			// Primary key
	private String lessonBookDate;		// 예약날짜 YYYY-MM-DD
	private int lessonPeople;			// 예약한 인원 수. 따라서 결제가격은 인원 수에 비례해야 함
	private int memberNo;				// 예약한 고객의 MEMBER_NO
	private int lessonNo;					// 강습 상품(Lesson)의 고유 번호
	private int lessonBookPrice;			// lessonPeople * Lesson.getLessonPrice() 을 계산해서 넣어줌
}
