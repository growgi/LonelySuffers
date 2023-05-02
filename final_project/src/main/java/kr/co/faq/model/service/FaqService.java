package kr.co.faq.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.faq.model.dao.FaqDao;
import kr.co.faq.model.vo.Category;
import kr.co.faq.model.vo.Faq;
import kr.co.faq.model.vo.FaqPageData;

@Service
public class FaqService {
	@Autowired
	private FaqDao dao;

	public ArrayList<Faq> selectAllFaq() {
		return dao.selectAllFaq();
	}

	public int insertFaq(Faq faq) {
		return dao.insertFaq(faq);
	}

	public Faq selectOneFaq(int faqNo) {
		return dao.selectOneFaq(faqNo);
	}

	public int updateFaq(Faq faq) {
		return dao.updateFaq(faq);
	}

	public int deleteFaq(int faqNo) {
		return dao.deleteFaq(faqNo);
	}

	public FaqPageData selectOneFaqListKind(int reqPage, int categoryNo) {
		int numPerPage = 10;
		int end = reqPage * numPerPage;
		int start = end - numPerPage + 1;
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("categoryNo", categoryNo);
		ArrayList<Faq> list = dao.selectOneFaqListKind(map);
		int totalCount = dao.selectFaqCount(categoryNo);
		int totalPage = (int)Math.ceil(totalCount/(double)numPerPage);
		
		int pageNaviSize = 5;
		
		int pageNo = 1;
		if(reqPage > 3) {
			pageNo = reqPage - 2;
		}
		
		String pageNavi = "<ul class='pagination'>";;
		
		if(pageNo != 1) {
			pageNavi += "<li>";
			pageNavi += "<a href='/faqListKind.do?categoryNo="+(categoryNo)+"&reqPage="+(pageNo-1)+"'>◀</a>";
			pageNavi += "</li>";
		}
		
		for(int i=0;i<pageNaviSize;i++) {
			if(pageNo == reqPage) {
				pageNavi += "<li>";
				pageNavi += "<span>"+pageNo+"</span>";
				pageNavi += "</li>";
			}else {
				pageNavi += "<li>";
				pageNavi += "<a href='faqListKind.do?categoryNo="+categoryNo+"&reqPage="+pageNo+"'>"+pageNo+"</a>";
				pageNavi += "</li>";
			}
			pageNo++;
			if(pageNo > totalPage) {
				break;
			}
			
		}
		
		if(pageNo <= totalPage) {
			pageNavi += "<li>";
			pageNavi += "<a href='faqListKind.do?categoryNo="+categoryNo+"&reqPage="+pageNo+"'>▶</a>";
			pageNavi += "</li>";
		}
		pageNavi += "</ul>";
		
		
		
		FaqPageData fpd = new FaqPageData(list, pageNavi);
		return fpd;
	}
	

	public ArrayList<Faq> selectSearchFaq(String[] keywords ) {
		return dao.selectSearchFaq(keywords);
	}
}


