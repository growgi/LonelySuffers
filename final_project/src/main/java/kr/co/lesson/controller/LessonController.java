package kr.co.lesson.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kr.co.lesson.model.service.LessonService;
import kr.co.lesson.model.vo.Lesson;
import kr.co.lesson.model.vo.LessonBook;
import kr.co.member.model.vo.Member;

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
	public String insertLesson(Lesson l, HttpSession session) {
		Member me = (Member)session.getAttribute("m");
		l.setWriter(me.getMemberId());
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
}
