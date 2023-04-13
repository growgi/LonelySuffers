package kr.co.faq.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.faq.model.dao.FaqDao;
import kr.co.faq.model.vo.Faq;

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
}
