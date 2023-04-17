package kr.co.review.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class RFileVO {
	private int fileNo;
	private int reviewNo;
	private String filename;
	private String filepath;
}
