package kr.co.notice.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import common.FileManager;
import kr.co.member.model.vo.Member;
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
	public String noticeWriteFrm(HttpSession session) {
		Member me = (Member)session.getAttribute("m");
		if(me != null) {
			if(me.getMemberGrade() == 1) {
				return "notice/noticeWriteFrm";
			}else {
				return "redirect:/noticeList.do?reqPage=1";
			}
		}else {
			return "redirect:/";
		}
	}
	
	
	
	@RequestMapping(value="/noticeWrite.do")
	public String noticeWrite(Notice n, MultipartFile[] noticeFile, HttpServletRequest request, Model model) {
		ArrayList<FileVO> fileList = new ArrayList<FileVO>();
		if(!noticeFile[0].isEmpty()) {
	         String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/notice/");
	         for(MultipartFile file : noticeFile) {
	            String filename = file.getOriginalFilename();
	            String filepath = manager.uploadImg(savePath, file);
	            if(filepath != null) {
		            FileVO fileVO = new FileVO();
		            fileVO.setFilename(filename);
		            fileVO.setFilepath(filepath);
		            fileList.add(fileVO);
	            }
	         }
	      }
	      int result = service.insertNotice(n,fileList);
	      if(result == (fileList.size()+1) && result == 0) {
  			model.addAttribute("title","공지사항 작성");
  			model.addAttribute("msg","공지사항 작성에 실패하였습니다.");
  			model.addAttribute("icon","error");
  			model.addAttribute("loc","/noticeList.do?reqPage=1");
  			return "common/msg";
	      }else {
    	  	model.addAttribute("title","공지사항 작성");
    	  	model.addAttribute("msg","공지사항 작성에 성공하였습니다.");
  			model.addAttribute("icon","success");
  			model.addAttribute("loc","/noticeList.do?reqPage=1");
  			return "common/msg";
	      }
	}
	
	@RequestMapping(value="/noticeUpdateFrm.do")
	public String noticeUpdateFrm(int noticeNo, HttpSession session, Model model) {
		Member me = (Member)session.getAttribute("m");
		if(me != null) {
			if(me.getMemberGrade() == 1) {
				Notice n = service.selectOneNotice(noticeNo);
				model.addAttribute("n",n);
				return "notice/noticeUpdateFrm";
				}else {
					return "redirect:/noticeView.do?noticeNo="+noticeNo;
				}
			}else {
		        return "redirect:/";
		}
	}
	
	@RequestMapping(value="/noticeUpdate.do")
	public String noticeUpdate(Notice n, int[] fileNo, String[] filepath, MultipartFile[] noticeFile, HttpServletRequest request, Model model) {
		ArrayList<FileVO> fileList = new ArrayList<FileVO>();
		String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/notice/");
		if(!noticeFile[0].isEmpty()) {
	       for(MultipartFile file : noticeFile) {
	          String filename = file.getOriginalFilename();
	          String upfilepath = manager.upload(savePath, file);
	            
	          FileVO fileVO = new FileVO();
	          fileVO.setFilename(filename);
	          fileVO.setFilepath(upfilepath);
	          fileList.add(fileVO);
	       }
	    }
		int result = service.noticeUpdate(n,fileList,fileNo);
		if(fileNo != null && (result == (fileList.size()+fileNo.length+1))) {
			for(String delFile : filepath) {
				boolean delResult = manager.deleteFile(savePath, delFile);
				if(delResult) {
					System.out.println("삭제완료");
				}else {
					System.out.println("삭제실패");
				}
			}
			return "redirect:/noticeView.do?noticeNo="+n.getNoticeNo();
		}else if(fileNo == null && (result == fileList.size()+1)) {
			model.addAttribute("title","공지사항 수정");
  			model.addAttribute("msg","공지사항 수정에 성공하였습니다.");
  			model.addAttribute("icon","success");
  			model.addAttribute("loc","/noticeView.do?noticeNo="+n.getNoticeNo());
  			return "common/msg";
	      }else {
    	  	model.addAttribute("title","공지사항 수정");
    	  	model.addAttribute("msg","공지사항 수정에 실패하였습니다.");
  			model.addAttribute("icon","error");
  			model.addAttribute("loc","/noticeList.do?reqPage=1");
  			return "common/msg";
	      }
			
			
	}
	
	@RequestMapping(value="/deleteNotice.do")
	public String deleteNotice(int noticeNo, HttpServletRequest request, HttpSession session, Model model) {
		Member me = (Member)session.getAttribute("m");
		if(me != null) {
			if(me.getMemberGrade() == 1) {
				ArrayList<FileVO> list = service.deleteNotice(noticeNo);
				if(list == null) {
					return "redirect:/noticeView.do?noticeNo="+noticeNo;
				}else {
					String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/notice/");
					for(FileVO file : list) {
						boolean deleteResult = manager.deleteFile(savePath, file.getFilepath());
					}
					model.addAttribute("title","공지사항 삭제");
					model.addAttribute("msg","공지사항 삭제에 성공하였습니다.");
					model.addAttribute("icon","success");
					model.addAttribute("loc","/noticeList.do?reqPage=1");
					return "common/msg";
				}
				
			}else {
				return "redirect:/noticeView.do?noticeNo="+noticeNo;
			}
		}else {
			 return "redirect:/";

		}
	}
	
	@RequestMapping(value="/company.do")
	public String company() {
		return "company/company";
	}

	@RequestMapping(value="/credit.do")
	public String credit() {
		return "company/credit";
	}
	
	@RequestMapping(value="/searchNoticeTitle.do")
	public String searchNoticeTitle(String searchNtTitle, Model model) {
		String[] keywords = searchNtTitle.trim().replaceAll("(\\s)\\1+","$1").split(" ");		
		ArrayList<Notice> list = service.selectSearchNotice(keywords);
		if(list != null) { 
			model.addAttribute("list", list);
			return "notice/noticeList";
		}else {
			return "redirect:/";
		}
		
	}
	
}
