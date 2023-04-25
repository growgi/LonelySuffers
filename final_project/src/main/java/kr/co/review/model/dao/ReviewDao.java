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

	public ArrayList<Review> selectAllReview() {
		List list = sqlSession.selectList("review.selectAllReview");
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

	public int deleteFile(int no) {
		int result = sqlSession.delete("review.deleteFile", no);
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
}



















