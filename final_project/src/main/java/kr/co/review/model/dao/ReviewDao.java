package kr.co.review.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.review.model.vo.RFileVO;
import kr.co.review.model.vo.Review;

@Repository
public class ReviewDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<Review> selectAllReview(int houseNo) {
		List list = sqlSession.selectList("review.selectAllReview", houseNo);
		return (ArrayList<Review>)list;
	}

	public int insertReview(Review rv) {
		int result = sqlSession.insert("review.insertReview", rv);
		return result;
	}

	public int insertFile(RFileVO file) {
		int result = sqlSession.insert("review.insertFile", file);
		return result;
	}

	public int reviewUpdate(Review rv) {
		int result = sqlSession.update("review.reviewUpdate", rv);
		return result;
	}

	public int deleteReview(int reviewNo) {
		int result = sqlSession.delete("review.deleteReview", reviewNo);
		return result;
	}

	public int selectReviewNo() {
		int reviewNo = sqlSession.selectOne("review.selectReviewNo");
		return reviewNo;
	}

	public int deleteFile(int i) {
		int result = sqlSession.delete("review.deleteFile", i);
		return result;
	}

	public ArrayList<Review> selectAllReview2(Review r) {
		List list = sqlSession.selectList("review.selectAllReview2", r);
		return (ArrayList<Review>)list;
	}
}



















