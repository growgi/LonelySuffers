package kr.co.lesson.model.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Lesson {
	private int lessonNo;
	private String lessonNameLevel;
	private String lessonTitle;
	private String lessonCity;
	private int lessonPrice;
	private String lessonInfo;
	private String lessonInfoPic;
	private String lessonTeacher;
	private int lessonMaxNo;
	private String lessonStartTime;
	private String lessonEndTime;
	private int lessonStatus;
	private int lessonScore;
	private String Writer;
	private ArrayList<FileVO> fileList;
}
