package kr.co.review.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.notice.model.vo.FileVO;
import kr.co.review.model.dao.ReviewDao;
import kr.co.review.model.vo.RFileVO;
import kr.co.review.model.vo.Review;

@Service
public class ReviewService {
	@Autowired
	private ReviewDao dao;

	public ArrayList<Review> selectAllReview(int houseNo) {
		return dao.selectAllReview(houseNo);
	}

	public int insertReview(Review rv, ArrayList<RFileVO> fileList) {
		int result = dao.insertReview(rv);
		if(result > 0) {
			int reviewNo = dao.selectReviewNo();
			for(RFileVO file : fileList) {
				file.setReviewNo(reviewNo);
				result += dao.insertFile(file);
			}
		}
		return result;
	}

	public int reviewUpdate(Review rv, ArrayList<RFileVO> fileList, int[] fileNo) {
		int result = dao.reviewUpdate(rv);
		if(result > 0) {
			if(fileNo != null) {
				for(int no : fileNo) {
					result += dao.deleteFile(no);
				}
			}
			for(RFileVO rf : fileList) {
				rf.setReviewNo(rv.getReviewNo());
				result += dao.insertFile(rf);
			}
		}
		return result;
	}

	public int deleteReview(int reviewNo) {
		return dao.deleteReview(reviewNo);
	}
	
	
}
