package kr.co.notice.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.notice.model.dao.NoticeDao;
import kr.co.notice.model.vo.FileVO;
import kr.co.notice.model.vo.Notice;
import kr.co.notice.model.vo.NoticePageData;

@Service
public class NoticeService {
	@Autowired
	private NoticeDao dao;

	public NoticePageData selectAllNotice(int reqPage) {
		int numPerPage = 5;
		int end = reqPage * numPerPage;
		int start = end - numPerPage + 1;
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		ArrayList<Notice> list = dao.selectAllNotice(map);
		int totalCount = dao.selectNoticeCount();
		int totalPage = (int)Math.ceil(totalCount/(double)numPerPage);
		
		int pageNaviSize = 5;
		
		int pageNo = 1;
		if(reqPage > 3) {
			pageNo = reqPage - 2;
		}
		
		String pageNavi = "";
		
		if(pageNo != 1) {
			pageNavi += "<a href='/noticeList.do?reqPage="+(pageNo-1)+"'>[이전]</a>";
		}
		
		for(int i=0;i<pageNaviSize;i++) {
			if(pageNo == reqPage) {
				pageNavi += "<span>"+pageNo+"</span>";
			}else {
				pageNavi += "<a href='noticeList.do?reqPage="+pageNo+"'>"+pageNo+"</a>";
			}
			pageNo++;
			if(pageNo > totalPage) {
				break;
			}
		}
		
		if(pageNo <= totalPage) {
			pageNavi += "<a href='noticeList.do?reqPage="+pageNo+"'>[다음]</a>";
		}
		NoticePageData npd = new NoticePageData(list, pageNavi);
		return npd;
	}

	public Notice selectOneNotice(int noticeNo) {
		Notice n = dao.selectOneNotice(noticeNo); 
		return n;
	}

	public int insertNotice(Notice n, ArrayList<FileVO> fileList) {
		int result = dao.insertNotice(n);
		if(result > 0) {
			for(FileVO file : fileList) {
				file.setNoticeNo(n.getNoticeNo());
				result += dao.insertFile(file);
			}
		}
		return result;
	}

	public int noticeUpdate(Notice n, ArrayList<FileVO> fileList, int[] fileNo) {
		int result = dao.noticeUpdate(n);
		if(result > 0) {
			if(fileNo != null) {
				for(int no : fileNo) {
					result += dao.deleteFile(no);
				}
			}
			for(FileVO f : fileList) {
				f.setNoticeNo(n.getNoticeNo());
				result += dao.insertFile(f);
			}
		}
		return result;
	}

	
}





















