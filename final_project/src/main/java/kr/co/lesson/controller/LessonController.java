package kr.co.lesson.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

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



// 하나의 강습에 대한 예약 내역(결제 완료 상태) 조회.    LESSON_BOOK 테이블에서 Row 여러개 조회 후 반환
	@ResponseBody
	@RequestMapping(value="/bookOneLesson.do")
	public String bookedDates(int lessonNo) {
		ArrayList<LessonBook> list = service.selectAllbookedDates(lessonNo);
		return new Gson().toJson(list);
	}
}
