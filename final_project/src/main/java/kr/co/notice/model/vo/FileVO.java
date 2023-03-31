package kr.co.notice.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class FileVO {
	private int fileNo;
	private int noticeNo;
	private String filename;
	private String filepath;
}
