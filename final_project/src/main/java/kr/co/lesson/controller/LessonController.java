package kr.co.lesson.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;

import common.ProductFileNumbering;
import kr.co.lesson.model.service.LessonService;
import kr.co.lesson.model.vo.Lesson;
import kr.co.lesson.model.vo.LessonBook;
import kr.co.member.model.vo.Member;

@Controller
public class LessonController {

	@Autowired
	private LessonService service;
	@Autowired
	private ProductFileNumbering fileManager;



// 강습 상품 상세페이지 보기.  Lesson 테이블에서 Row 1개 전체 조회 후 반환
	@RequestMapping(value="/lessonView.do")
	public String lessonView(int lessonNo, Model model) {
		Lesson l = service.selectOneLesson(lessonNo);
		model.addAttribute("lesson", l);
		return "product/lessonDetail";
	}



// 키오스크에서 강습 상품 상세페이지 modal에 반환해줄 함수.  Lesson 테이블에서 Row 1개 전체 조회 후 반환
	@ResponseBody
	@RequestMapping(value="/lessonModalView.do", produces = "application/text; charset=utf8")
	public String lessonModalView(int lessonNo, Model model) {
		Lesson l = service.selectOneLesson(lessonNo);
		model.addAttribute("lesson", l);
		Gson gson = new Gson();
		String result = gson.toJson(l);
		return result;
	}



// 강습 상품 등록.  Lesson 테이블에 Row 여러개 추가
	@RequestMapping(value="/insertLesson.do")
	public String insertLesson(Lesson l, MultipartFile lessonPhoto, HttpServletRequest request, HttpSession session) {
		Member me = (Member)session.getAttribute("m");
		l.setWriter(me.getMemberId());

		int result = 0;
		String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/lesson/");
		for(int i=0; i<l.getLessonStartTimes().length; i++) {
			result = 0;
			l.setLessonStartTime(l.getLessonStartTimes()[i]);
			l.setLessonEndTime(l.getLessonEndTimes()[i]);
			result += service.insertLesson(l);
			if(result > 0) {
				if(!lessonPhoto.isEmpty()) {
					l.setLessonInfoPic(fileManager.uploadLessonPhoto(savePath, lessonPhoto, l.getLessonNo()));
					service.uploadLessonPhoto(l);
				}
			}else {
				break;
			}
		}
		if(result > 0) {
	// 실패가 전혀 없을 때 반환되는 내용
			return "member/myPage";
		}else {
	// 중간에 하나라도 실패 시 반환되는 내용
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
