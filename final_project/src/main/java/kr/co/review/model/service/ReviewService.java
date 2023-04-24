package kr.co.review.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.review.model.dao.ReviewDao;
import kr.co.review.model.vo.RFileVO;
import kr.co.review.model.vo.Review;

@Service
public class ReviewService {
	@Autowired
	private ReviewDao dao;
	
	
}
