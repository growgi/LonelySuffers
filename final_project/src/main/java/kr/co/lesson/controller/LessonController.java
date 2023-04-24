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
		for(int i=0; i<l.getLessonStartTimes().length; i++) {
			result = 0;
			l.setLessonStartTime(l.getLessonStartTimes()[i]);
			l.setLessonEndTime(l.getLessonEndTimes()[i]);
			result += service.insertLesson(l);
			if(result > 0) {
				if(!lessonPhoto.isEmpty()) {
					String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/lesson/");
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



// 강습 상품 수정페이지 보기.  lessonStatus에 따라 수정가능한 항목들 다르게 출력
	@RequestMapping(value="/lessonUpdate.do")
	public String lessonUpdate(int lessonNo, HttpSession session, Model model) {
		Lesson l = service.selectOneLesson(lessonNo);
		Member me = (Member)session.getAttribute("m");
		if(me.getMemberId().equals(l.getWriter())) {		
			model.addAttribute("lesson", l);
			return "product/lessonUpdate";
		}else {
			model.addAttribute("title","접근 제한됨");
			model.addAttribute("msg","상품 등록자만이 수정할 수 있습니다.");
			model.addAttribute("icon","error");
			model.addAttribute("loc","/lessonView.do?lessonNo="+lessonNo);
			return "common/msg";
		}
	}



// 숙박 상품 수정하기.   House 테이블에서 Row 1개 수정
	@RequestMapping(value="/updateLesson.do")
	public String updateLesson(Lesson l, MultipartFile lessonPhoto, HttpServletRequest request, Model model) {
		int result = service.updateLesson(l);
		if(result > 0) {
			if(lessonPhoto != null) {
				if(!lessonPhoto.isEmpty()) {
					String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/lesson/");
					l.setLessonInfoPic(fileManager.uploadLessonPhoto(savePath, lessonPhoto, l.getLessonNo()));
					service.uploadLessonPhoto(l);
				}
			}
			return "redirect:/lessonView.do?lessonNo="+l.getLessonNo();
		}else {
			model.addAttribute("title","실패");
			model.addAttribute("msg","알 수 없는 이유로 인해 상품 정보 변경이 실패했습니다.");
			model.addAttribute("icon","error");
			model.addAttribute("loc","/lessonUpdate.do?lessonNo="+l.getLessonNo());
			return "common/msg";
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
