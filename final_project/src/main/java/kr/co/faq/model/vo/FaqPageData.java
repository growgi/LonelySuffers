package kr.co.faq.model.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class FaqPageData {
	private ArrayList<Faq> list;
	private String pageNavi;
}
