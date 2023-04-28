package kr.co.lesson.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.lesson.model.dao.LessonDao;
import kr.co.lesson.model.vo.Lesson;
import kr.co.lesson.model.vo.LessonBook;
import kr.co.lesson.model.vo.LessonListing;
import kr.co.lesson.model.vo.LessonPagination;
import kr.co.review.model.dao.ReviewDao;

@Service
public class LessonService {

	@Autowired
	private LessonDao dao;
	@Autowired
	private ReviewDao rdao;


// 강습 상품 상세페이지 보기.  Lesson 테이블에서 Row 1개 전체 조회 후 반환
	public Lesson selectOneLesson(int lessonNo) {
		return dao.selectOneLesson(lessonNo);
	}


// 강습 상품 등록.  Lesson 테이블에 Row 1개 추가
	@Transactional
	public int insertLesson(Lesson l) {
		return dao.insertLesson(l);
	}



	@Transactional
// 강습 상품 수정.  Lesson 테이블에서 Row 1개 수정
	public int updateLesson(Lesson l) {
		return dao.updateLesson(l);
	}



// 상품 등록 후 강습 상품 업로드
	public int uploadLessonPhoto(Lesson l) {
		return dao.uploadLessonPhoto(l);
	}



// 하나의 강습에 대한 예약 내역(결제 완료 상태) 조회.    LESSON_BOOK 테이블에서 Row 여러개 조회 후 반환
	public ArrayList<LessonBook> selectAllbookedDates(int lessonNo) {
		return dao.selectAllbookedDates(lessonNo);
	}



// 메인 메뉴 > 강습 상품들 보기.  Lesson 테이블에서 Row 여러 개 조회 후 반환
	public LessonPagination selectLessonPage(LessonListing condition, int reqPage){
		int numPerPage = 15;	// 한 페이지 당 상품 15개씩 출력
		condition.setPagingEnd(numPerPage * reqPage);
		condition.setPagingStart(numPerPage * (reqPage-1) + 1);
		ArrayList<Lesson> list = dao.selectLessonPage(condition);
		
		int totalCount = dao.totalNumberOfLessonByProduct(condition);
		
	// pagination 출력 구문 시작
		int maxPage = 0;
		if(totalCount%numPerPage == 0) { maxPage = totalCount/numPerPage;
		} else { maxPage = totalCount/numPerPage + 1; }
		
		int pageNaviSize = 5;	// 페이지 이동 버튼 표시 수		
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize + 1;
		
		String pageNavi = "<ul class='pagination'>";
		if(pageNo != 1) {
			pageNavi += "<li>";
			pageNavi += "<a href='javascript:getLessons("+(pageNo-1)+", 0)'>";
			pageNavi += "＜";
			pageNavi += "</a></li>";
		}
		
		for(int i=0; i<pageNaviSize; i++) {
			if(pageNo == reqPage) {
				pageNavi += "<li>";
				pageNavi += "<a class='active' href='javascript:getLessons("+pageNo+", 0)'>";
				pageNavi += pageNo;
				pageNavi += "</a></li>";
			}else {
				pageNavi += "<li>";
				pageNavi += "<a href='javascript:getLessons("+pageNo+", 0)'>";
				pageNavi += pageNo;
				pageNavi += "</a></li>";
			}
			pageNo++;
			if(pageNo > maxPage) {
				break;
			}
		}

		if(pageNo <= maxPage) {
			pageNavi += "<li>";
			pageNavi += "<a href='javascript:getLessons("+pageNo+", 0)'>";
			pageNavi += "＞";
			pageNavi += "</a></li>";
		}
		
		pageNavi += "</ul>";
	// pagination 출력 구문 끝

		return new LessonPagination(totalCount, list, pageNavi, condition.getPagingStart());
	}



// 조건에 맞는 숙소 리스트를 조회하는 것
	public ArrayList<Lesson> selectSelectList(Lesson lesson) {
		return dao.selectLessonList(lesson);
	}

	@Transactional
	public int lessonBookInsert(LessonBook lb) {
		return dao.lessonBookInsert(lb);
	}
}