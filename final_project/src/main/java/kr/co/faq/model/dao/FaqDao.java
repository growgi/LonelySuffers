package kr.co.faq.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.faq.model.vo.Category;
import kr.co.faq.model.vo.Faq;
import kr.co.notice.model.vo.Notice;

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

	public ArrayList<Faq> selectOneFaqListKind(HashMap<String, Object> map) {
		List list = sqlSession.selectList("faq.selectOneFaqListKind", map);
		return (ArrayList<Faq>)list;
	}

	public int selectFaqCount(int categoryNo) {
		int totalCount = sqlSession.selectOne("faq.totalCount", categoryNo);
		return totalCount;
	}
	
	public ArrayList<Faq> selectSearchFaq(String[] keywords) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("array",keywords);
		List searchFaq = sqlSession.selectList("faq.selectSearchFaq", map);
		return (ArrayList<Faq>)searchFaq;
	}

}
