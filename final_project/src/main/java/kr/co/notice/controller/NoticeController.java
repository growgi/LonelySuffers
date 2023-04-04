package kr.co.notice.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import common.FileManager;
import kr.co.notice.model.service.NoticeService;
import kr.co.notice.model.vo.FileVO;
import kr.co.notice.model.vo.Notice;
import kr.co.notice.model.vo.NoticePageData;

@Controller
public class NoticeController {
	@Autowired
	private NoticeService service;
	@Autowired
	private FileManager manager;
	
	@RequestMapping(value="/noticeList.do")
	public String noticeList(int reqPage, Model model) {
		NoticePageData npd = service.selectAllNotice(reqPage);
		model.addAttribute("list", npd.getList());
		model.addAttribute("pageNavi", npd.getPageNavi());
		return "notice/noticeList";
	}
	
	@RequestMapping(value="/noticeView.do")
	public String noticeView(int noticeNo, Model model) {
		Notice n = service.selectOneNotice(noticeNo);
		model.addAttribute("n", n);
		return "notice/noticeView";
	}
	
	@RequestMapping(value="/noticeWriteFrm.do")
	public String noticeWriteFrm() {
		return " notice/noticeWriteFrm";
	}
	
	@RequestMapping(value="/noticeWrite.do")
	public String noticeWrite(Notice n, MultipartFile[] noticeFile, HttpServletRequest request) {
		ArrayList<FileVO> fileList = new ArrayList<FileVO>();
		if(!noticeFile[0].isEmpty()) {
	         String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/board/");
	         for(MultipartFile file : noticeFile) {
	            String filename = file.getOriginalFilename();
	            String filepath = manager.upload(savePath, file);
	            
	            FileVO fileVO = new FileVO();
	            fileVO.setFilename(filename);
	            fileVO.setFilepath(filepath);
	            fileList.add(fileVO);
	         }
	      }
	      int result = service.insertNotice(n,fileList);
	      if(result == (fileList.size()+1)) {
	         return "redirect:/noticeList.do?reqPage=1";
	      }else {
	         return "redirect:/";
	      }
	}
}
























