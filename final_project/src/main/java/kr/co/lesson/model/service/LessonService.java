package kr.co.lesson.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.lesson.model.dao.LessonDao;
import kr.co.lesson.model.vo.Lesson;
import kr.co.lesson.model.vo.LessonBook;

@Service
public class LessonService {

	@Autowired
	private LessonDao dao;


// 강습 상품 상세페이지 보기.  Lesson 테이블에서 Row 1개 전체 조회 후 반환
	public Lesson selectOneLesson(int lessonNo) {
		return dao.selectOneLesson(lessonNo);
	}



// 하나의 강습에 대한 예약 내역(결제 완료 상태) 조회.    LESSON_BOOK 테이블에서 Row 여러개 조회 후 반환
	public ArrayList<LessonBook> selectAllbookedDates(int lessonNo) {
		return dao.selectAllbookedDates(lessonNo);
	}
}
