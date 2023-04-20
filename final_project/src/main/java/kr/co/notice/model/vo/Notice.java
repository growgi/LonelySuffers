package kr.co.notice.model.vo;

import java.util.ArrayList;

import kr.co.notice.model.vo.FileVO;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Notice {
	private int noticeNo;
	private String noticeTitle;
	private String noticeContent;
	private String noticeDate;
	private ArrayList<FileVO> fileList;
	
	
	public String getNoticeContentBr() {
		return noticeContent.replaceAll("\r\n", "<br>");
	}
}
