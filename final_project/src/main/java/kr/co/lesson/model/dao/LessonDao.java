package kr.co.lesson.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.lesson.model.vo.Lesson;
import kr.co.lesson.model.vo.LessonBook;
import kr.co.lesson.model.vo.LessonListing;

@Repository
public class LessonDao {

	@Autowired
	private SqlSessionTemplate sqlSession;


// 강습 상품 상세페이지 보기.  Lesson 테이블에서 Row 1개 전체 조회 후 반환
	public Lesson selectOneLesson(int lessonNo) {
		return sqlSession.selectOne("l.selectOneLesson", lessonNo);
	}



// 강습 상품 등록.  Lesson 테이블에 Row 1개 추가
	public int insertLesson(Lesson l) {
		return sqlSession.insert("l.insertLesson", l);
	}


// 강습 상품 수정.  Lesson 테이블에서 Row 1개 수정
	public int updateLesson(Lesson l) {
		return sqlSession.update("l.updateLesson", l);
	}



// 상품 등록 후 강습 상품 업로드
	public int uploadLessonPhoto(Lesson l) {
		return sqlSession.update("l.uploadLessonPhoto", l);
	}



// 하나의 강습에 대한 예약 내역(결제 완료 상태) 조회.    LESSON_BOOK 테이블에서 Row 여러개 조회 후 반환
	public ArrayList<LessonBook> selectAllbookedDates(int lessonNo) {
		List list = sqlSession.selectList("lb.selectAllBook", lessonNo);
		return (ArrayList<LessonBook>)list;
	}



// 메인 메뉴 > 강습 상품들 보기.  Lesson 테이블에서 Row 여러 개 조회 후 반환
	public ArrayList<Lesson> selectLessonPage(LessonListing condition){
		List list = sqlSession.selectList("l.selectLessonPage", condition);
		return(ArrayList<Lesson>)list;
	}



// 조건에 맞는 판매중인 상품들의 총 개수
	public int totalNumberOfLessonByProduct(LessonListing condition) {
		return sqlSession.selectOne("l.totalNumberOfLessonByProduct", condition);
	}



// 조건에 맞는 숙소 리스트를 조회하는 것
	public ArrayList<Lesson> selectLessonList(Lesson lesson) {
		List list = sqlSession.selectList("l.selectLessonList",lesson);
		return(ArrayList<Lesson>)list;
	}



	public int lessonBookInsert(LessonBook lb) {
		System.out.println("lessonDao"+lb);
		return sqlSession.insert("lb.insertLessonBook",lb);
	}
}
