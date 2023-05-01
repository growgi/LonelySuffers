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
		int numPerPage = 10;
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
		
		String pageNavi = "<ul class='pagination'>";;
		
		if(pageNo != 1) {
			pageNavi += "<li>";
			pageNavi += "<a href='/noticeList.do?reqPage="+(pageNo-1)+"'>◀</a>";
			pageNavi += "</li>";
		}
		
		for(int i=0;i<pageNaviSize;i++) {
			if(pageNo == reqPage) {
				pageNavi += "<li>";
				pageNavi += "<span>"+pageNo+"</span>";
				pageNavi += "</li>";
			}else {
				pageNavi += "<li>";
				pageNavi += "<a href='noticeList.do?reqPage="+pageNo+"'>"+pageNo+"</a>";
				pageNavi += "</li>";
			}
			pageNo++;
			if(pageNo > totalPage) {
				break;
			}
			
		}
		
		if(pageNo <= totalPage) {
			pageNavi += "<li>";
			pageNavi += "<a href='noticeList.do?reqPage="+pageNo+"'>▶</a>";
			pageNavi += "</li>";
		}
		pageNavi += "</ul>";
		
		
		
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

	public ArrayList<FileVO> deleteNotice(int noticeNo) {
		ArrayList<FileVO> fileList = dao.selectFileList(noticeNo);
		int result = dao.deleteNotice(noticeNo);
		if(result > 0) {
			return fileList;
		}else {
			return null;
		}
	}

	public ArrayList<Notice> selectSearchNotice(String[] keywords) {
		return dao.selectSearchNotice(keywords);
	}

	
}





















