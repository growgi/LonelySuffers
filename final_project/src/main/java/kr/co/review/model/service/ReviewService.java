package kr.co.review.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

	public int reviewUpdate(Review rv) {
		int result = dao.reviewUpdate(rv);
		return result;
	}

	public int deleteReview(int reviewNo) {
		return dao.deleteReview(reviewNo);
	}

	public int deleteReviewFile(int[] fileNo) {
		int result = 0;
		if(fileNo != null) {
			for(int i : fileNo) {
				result = dao.deleteFile(i);
			}
		}
		return result;
	}

	public int insertReviewFile(RFileVO rfileVO) {
		int result = dao.insertFile(rfileVO);
		return result;
	}

	public ArrayList<Review> selectAllReview2(Review r) {
		return dao.selectAllReview2(r);
	}
	
	
}
