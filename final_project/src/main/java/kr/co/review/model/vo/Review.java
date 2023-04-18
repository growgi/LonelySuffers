package kr.co.review.model.vo;

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
}
