package kr.co.notice.model.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class NoticePageData {
	private ArrayList<Notice> list;
	private String pageNavi;
}
