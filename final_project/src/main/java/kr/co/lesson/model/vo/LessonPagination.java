package kr.co.lesson.model.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor

public class LessonPagination {
	private int totalCount;					// 판매중인 전체 강습 상품 수
	private ArrayList<Lesson> list;			// 상품들
	private String pageNavi;				// class가 pagination인 ul태그 전체
	private int start;						// 문의글 목록 한 페이지만 조회할 때 시작할 번호
}
