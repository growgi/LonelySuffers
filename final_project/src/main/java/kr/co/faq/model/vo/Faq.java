package kr.co.faq.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Faq {
	private int faqNo;
	private int categoryNo;
	private String faqTitle;
	private String faqContent;
	
	public String getFaqContentBr() {
		return faqContent.replaceAll("\r\n", "<br>");
	}
}
