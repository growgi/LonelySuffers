package kr.co.faq.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.faq.model.service.FaqService;
import kr.co.faq.model.vo.Faq;

@Controller
public class FaqController {
	@Autowired
	private FaqService service;
	
	@RequestMapping(value="/faqList.do")
	public String faqList(Model model) {
		ArrayList<Faq> list = service.selectAllFaq();
		model.addAttribute("list", list);
		return "faq/faqList";
	}
	
	@RequestMapping(value="/faqWriterFrm.do")
	public String faqWriterFrm() {
		return "faq/faqWriterFrm";
	}
	
	@RequestMapping(value="/faqWrite.do")
	public String faqWrite(Faq faq) {
		int result = service.insertFaq(faq);
		if(result > 0) {
			return "redirect:/";
		}else {
			return "redirect:/faqWriterFrm.do";
		}
	}
	
	@RequestMapping(value="faqView.do")
	public String faqView(int faqNo, Model model) {
		Faq faq = service.selectOneFaq(faqNo);
		model.addAttribute("faq", faq);
		return "faq/faqView";
	}
}



















