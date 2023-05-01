package kr.co.faq.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.faq.model.service.FaqService;
import kr.co.faq.model.vo.Category;
import kr.co.faq.model.vo.Faq;
import kr.co.faq.model.vo.FaqPageData;

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
	public String faqWrite(Faq faq, Model model) {
		int result = service.insertFaq(faq);
		if(result > 0) {
			model.addAttribute("title","자주묻는질문 작성");
    	  	model.addAttribute("msg","자주묻는질문 작성에 성공하였습니다.");
  			model.addAttribute("icon","success");
  			model.addAttribute("loc","/faqListKind.do?categoryNo="+faq.getCategoryNo()+"&reqPage=1");
  			return "common/msg";
		}else {
			model.addAttribute("title","자주묻는질문 작성");
  			model.addAttribute("msg","자주묻는질문 작성에 실패하였습니다.");
  			model.addAttribute("icon","error");
  			model.addAttribute("loc","/faqWriterFrm.do");
  			return "common/msg";
		}
	}
	
	@RequestMapping(value="faqView.do")
	public String faqView(int faqNo, Model model) {
		Faq faq = service.selectOneFaq(faqNo);
		model.addAttribute("faq", faq);
		return "faq/faqView";
	}
	
	@RequestMapping(value="/faqUpdateFrm.do")
	public String faqUpdateFrm(int faqNo, Model model) {
		Faq faq = service.selectOneFaq(faqNo);
		model.addAttribute("faq", faq);
		if(faq != null) {
			return "faq/faqUpdateFrm";
		}else {
			return "redirect:/faqListKind.do?categoryNo="+faq.getCategoryNo()+"&reqPage=1";
		}
	}
	
	@RequestMapping(value="/faqUpdate.do")
	public String updateFaq(Faq faq, Model model) {
		int result = service.updateFaq(faq);
		if(result > 0) {
			model.addAttribute("title","자주묻는질문 수정");
  			model.addAttribute("msg","자주묻는질문 수정에 성공하였습니다.");
  			model.addAttribute("icon","success");
  			model.addAttribute("loc","/faqView.do?faqNo="+faq.getFaqNo());
  			return "common/msg";
		}else {
			model.addAttribute("title","자주묻는질문 수정");
    	  	model.addAttribute("msg","자주묻는질문 수정에 실패하였습니다.");
  			model.addAttribute("icon","error");
  			model.addAttribute("loc","/faqListKind.do?categoryNo="+faq.getCategoryNo()+"&reqPage=1");
  			return "common/msg";
		}
	}
	
	@RequestMapping(value="/deleteFaq.do")
	public String deleteFaq(int faqNo, int categoryNo, Model model) {
		int result = service.deleteFaq(faqNo);
		if(result > 0) {
			model.addAttribute("title","공지사항 삭제");
			model.addAttribute("msg","공지사항 삭제에 성공하였습니다.");
			model.addAttribute("icon","success");
			model.addAttribute("loc","/faqListKind.do?categoryNo="+categoryNo+"&reqPage=1");
			return "common/msg";
		}else {
			return "redirect:/";
		}
		
	}
	
	@RequestMapping(value="/faqHeader.do")
	public String faqHeader() {
		return "common/faqHeader";
	}
	
	@RequestMapping(value="/faqListKind.do")
	public String faqListKind(int reqPage, int categoryNo, Model model) {
		FaqPageData fpd = service.selectOneFaqListKind(reqPage, categoryNo);
		model.addAttribute("list", fpd.getList());
		model.addAttribute("pageNavi", fpd.getPageNavi());
		return "faq/faqListKind";
	}
	
	@RequestMapping(value="/searchFaqTitle.do")
	public String searchFaqTitle(String searchFaqTitle, Model model) {
		ArrayList<Faq> list = service.selectSearchFaq(searchFaqTitle);
		if(list != null) { 
			model.addAttribute("list", list);
			return "faq/faqListKind";
		}else {
			return "redirect:/";
		}
	}
	
	
}



















