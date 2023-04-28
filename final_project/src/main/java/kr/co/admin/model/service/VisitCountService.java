package kr.co.admin.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.admin.model.dao.VisitCountDao;
import kr.co.admin.model.vo.Visitant;

@Service
public class VisitCountService {

	@Autowired
	VisitCountDao vDao;
	
	public int setVisitTotalCount() {
		
		return vDao.setVisitTotalCount();
	}

	public int getVisitTodayCount() {
		
		return vDao.getVisitTodayCount();
	}

	public int getVisitTotalCount() {
		
		return vDao.getVisitTotalCount();
	}
	
	public ArrayList<Visitant> getVisitWeekCount() {
		
		return vDao.getVisitWeekCount();
	}
}
