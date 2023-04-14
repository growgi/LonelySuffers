package kr.co.faq.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.faq.model.vo.Category;
import kr.co.faq.model.vo.Faq;

@Repository
public class FaqDao {
	@Autowired
	private SqlSession sqlSession;

	public ArrayList<Faq> selectAllFaq() {
		List list = sqlSession.selectList("faq.selectAllFaq");
		return (ArrayList<Faq>)list;
	}

	public int insertFaq(Faq faq) {
		int result = sqlSession.insert("faq.insertFaq", faq);
		return result;
	}

	public Faq selectOneFaq(int faqNo) {
		Faq faq = sqlSession.selectOne("faq.selectOneFaq", faqNo);
		return faq;
	}

	public int updateFaq(Faq faq) {
		int result = sqlSession.update("faq.updateFaq", faq);
		return result;
	}

	public int deleteFaq(int faqNo) {
		int result = sqlSession.delete("faq.deleteFaq", faqNo);
		return result;
	}

	public ArrayList<Faq> selectOneFaqCancel(int categoryNo) {
		List list = sqlSession.selectList("faq.selectOneFaqCancel", categoryNo);
		return (ArrayList<Faq>)list;
	}
}
