package kr.co.review.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;

import common.FileManager;
import kr.co.review.model.service.ReviewService;
import kr.co.review.model.vo.RFileVO;
import kr.co.review.model.vo.Review;

@Controller
public class ReviewController {
	@Autowired
	private ReviewService service;
	@Autowired
	private FileManager manager;
	
	@ResponseBody
	@RequestMapping(value="/selectAllReview.do", produces = "application/text; charset=utf8")
	public String selectAllReview(Review r) {
		ArrayList<Review> list = service.selectAllReview2(r);
		System.out.println("리뷰 컨트롤러 리스트"+list);
		return new Gson().toJson(list);
	}
	
	@RequestMapping(value="/reviewWriteFrm.do")
	public String reviewWrite(Review rv, String previousUrl, MultipartFile[] reviewFile, HttpServletRequest request, Model model) {
		ArrayList<RFileVO> fileList = new ArrayList<RFileVO>();
		if(!reviewFile[0].isEmpty()) {
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/review/");
			for(MultipartFile file : reviewFile) {
				String filename = file.getOriginalFilename();
				String filepath = manager.upload(savePath, file);
				
				RFileVO rfileVO = new RFileVO();
				rfileVO.setFilename(filename);
				rfileVO.setFilepath(filepath);
				fileList.add(rfileVO);
			}
		}
		int result = service.insertReview(rv, fileList);
		if(result == (fileList.size()+1) && result == 0) {
			model.addAttribute("title","후기 작성");
  			model.addAttribute("msg","후기 작성에 실패하였습니다.");
  			model.addAttribute("icon","error");
  			model.addAttribute("loc","/"+previousUrl);
  			return "common/msg";
		}else {
			model.addAttribute("title","후기 작성");
    	  	model.addAttribute("msg","후기 작성에 성공하였습니다.");
  			model.addAttribute("icon","success");
  			model.addAttribute("loc","/"+previousUrl);
  			return "common/msg";
		}
		
	}
	
	@RequestMapping(value="/reviewUpdate.do")
	public String reviewUpdate(Review rv, String previousUrl, String[] delFileList, int[] fileNo, MultipartFile[] reviewFile, HttpServletRequest request, Model model) {
		ArrayList<RFileVO> fileList = new ArrayList<RFileVO>();
		String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/review/");
		if(!reviewFile[0].isEmpty()) {
			for(MultipartFile file : reviewFile) {
				String filename = file.getOriginalFilename();
				String upfilepath = manager.upload(savePath, file);
				RFileVO rfileVO = new RFileVO();
				rfileVO.setFilename(filename);
				rfileVO.setFilepath(upfilepath);
				rfileVO.setReviewNo(rv.getReviewNo());
				fileList.add(rfileVO);
				int insertFileResult = service.insertReviewFile(rfileVO);
			}
		}
		int result = service.reviewUpdate(rv);
			if(delFileList != null) {
				for(String delFile : delFileList) {
					boolean delResult = manager.deleteFile(savePath, delFile);
					if(delResult) {
						System.out.println("삭제완료");
					}else {
						System.out.println("삭제실패");
					}
				}
				int delDBResult = service.deleteReviewFile(fileNo);
			}
			if(fileNo == null || (result == fileList.size()+1)) {
				model.addAttribute("title","후기 수정");
	  			model.addAttribute("msg","후기 수정에 성공하였습니다.");
	  			model.addAttribute("icon","success");
	  			model.addAttribute("loc","/"+previousUrl);
	  			return "common/msg";
			}else {
				model.addAttribute("title","후기 수정");
	    	  	model.addAttribute("msg","후기 수정에 실패하였습니다.");
	  			model.addAttribute("icon","error");
	  			model.addAttribute("loc","/"+previousUrl);
	  			return "common/msg";
			}
	}
	
	@RequestMapping(value="/deleteReview.do")
	public String deleteReview(int reviewNo, int productNo, int productCat, Model model) {
		int result = service.deleteReview(reviewNo);
		if(result > 0) {
			model.addAttribute("title","후기 삭제");
    	  	model.addAttribute("msg","후기 삭제에 성공하였습니다.");
  			model.addAttribute("icon","success");
  			if(productCat == 1) {
  	  			model.addAttribute("loc","/lessonView.do?lessonNo="+productNo);
  			}else if(productCat == 2) {
  	  			model.addAttribute("loc","/houseView.do?houseNo="+productNo);
  			}
  			return "common/msg";
		}else{
			model.addAttribute("title","후기 삭제");
    	  	model.addAttribute("msg","후기 삭제에 실패하였습니다.");
  			model.addAttribute("icon","error");
  			if(productCat == 1) {
  	  			model.addAttribute("loc","/lessonView.do?lessonNo="+productNo);
  			}else if(productCat == 2) {
  	  			model.addAttribute("loc","/houseView.do?houseNo="+productNo);
  			}
  			return "common/msg";
		}
	}
	
}
























