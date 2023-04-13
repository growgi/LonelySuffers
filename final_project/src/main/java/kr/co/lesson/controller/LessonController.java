package kr.co.lesson.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kr.co.house.model.vo.House;
import kr.co.lesson.model.service.LessonService;
import kr.co.lesson.model.vo.Lesson;
import kr.co.lesson.model.vo.LessonBook;

@Controller
public class LessonController {

	@Autowired
	private LessonService service;



// 강습 상품 상세페이지 보기.  Lesson 테이블에서 Row 1개 전체 조회 후 반환
	@RequestMapping(value="/lessonView.do")
	public String lessonView(int lessonNo, Model model) {
		Lesson l = service.selectOneLesson(lessonNo);
		model.addAttribute("lesson", l);
		return "product/lessonDetail";
	}



// 강습 상품 등록.  Lesson 테이블에 Row 1개 추가
	@RequestMapping(value="/insertLesson.do")
	public String insertLesson(Lesson l) {
		int result = service.insertLesson(l);
		if(result > 0) {
	// 승인대기중으로 등록 성공 시 처리내용 작성 필요
			return "member/myPage";
		}else {
	// 실패 시 처리내용 작성 필요
			return "member/myPage";
		}
	}



// 하나의 강습에 대한 예약 내역(결제 완료 상태) 조회.    LESSON_BOOK 테이블에서 Row 여러개 조회 후 반환
	@ResponseBody
	@RequestMapping(value="/bookOneLesson.do")
	public String bookedDates(int lessonNo) {
		ArrayList<LessonBook> list = service.selectAllbookedDates(lessonNo);
		return new Gson().toJson(list);
	}
	
// 조건에 맞는 숙소 리스트를 조회하는 것
	@ResponseBody
	@RequestMapping(value="/lessonList.do", produces = "application/json;charset=utf-8")
	public String selectRoomList(Lesson lesson) {
		System.out.println("lessondata"+lesson);
		ArrayList<Lesson> list = service.selectSelectList(lesson);
		Gson gson = new Gson();
		String result = gson.toJson(list);
		System.out.println("lesson result 결과"+result.length());
		return result;
			
		}
}
