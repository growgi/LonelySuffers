package kr.co.admin.model.vo;

import java.util.ArrayList;

import kr.co.lesson.model.vo.Lesson;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class LessonPageData {
	
	private ArrayList<Lesson> lessonList;
	private String pageNavi;
	private int start;
	private int totalCount;

}
