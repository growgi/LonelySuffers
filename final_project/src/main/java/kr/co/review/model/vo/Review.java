package kr.co.review.model.vo;

import java.util.ArrayList;

import kr.co.notice.model.vo.FileVO;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Review {
	private int reviewNo;
	private String reviewWriter;
	private String reviewTitle;
	private String reviewContent;
	private int rating;
	private String reviewDate;
	private int productCategory;
	private int productNo;
	private ArrayList<RFileVO> rfileList;
	
	private int houseNo;
}
