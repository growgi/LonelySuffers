package kr.co.notice.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.notice.model.dao.NoticeDao;
import kr.co.notice.model.vo.Notice;

@Service
public class NoticeService {
	@Autowired
	private NoticeDao dao;

	public ArrayList<Notice> selectAllNotice() {
		return dao.selectAllNotice();
	}
}
