package kr.co.review.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

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
	
	@RequestMapping(value="/reviewWriteFrm.do")
	public String reviewWrite(Review rv, MultipartFile[] reviewFile, HttpServletRequest request) {
		System.out.println("reviewController에서 review값"+rv.getProductNo());
		System.out.println("reviewController에서 review값"+reviewFile);
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
		if(result == (fileList.size()+1)) {
			return "redirect:/";
		}else {
			return "redirect:/";
		}
		
	}
	
	@RequestMapping(value="/reviewUpdate.do")
	public String reviewUpdate(Review rv, String[] delFileList, int[] fileNo, MultipartFile[] reviewFile, HttpServletRequest request) {
		ArrayList<RFileVO> fileList = new ArrayList<RFileVO>();
		System.out.println(rv);
		System.out.println(fileNo);
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
				System.out.println(rfileVO);
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
			return "redirect:/";
	}
	
	@RequestMapping(value="/deleteReview.do")
	public String deleteReview(int reviewNo) {
		int result = service.deleteReview(reviewNo);
		if(result > 0) {
			return "redirect:/";
		}else{
			return "redirect:/";
		}
	}
	
}
























