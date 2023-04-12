package kr.co.carpool.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.carpool.model.dao.CarpoolDao;
import kr.co.carpool.model.vo.Carpool;
import kr.co.carpool.model.vo.CarpoolFilter;
import kr.co.carpool.model.vo.CarpoolMatch;
import kr.co.carpool.model.vo.Passenger;

@Service
public class CarpoolService {
	@Autowired
	private CarpoolDao dao;

	public ArrayList<Carpool> selectAllCarpool() {
		return dao.selectAllCarpool();
	}

	public Carpool selectOneCarpool(Carpool carpool) {
		return dao.selectOneCarpool(carpool);
		
	}

	public ArrayList<Carpool> filterCarpool(CarpoolFilter cf, int amount) {
		System.out.println("controller에서 service로 넘겨준조건"+cf);
		int end = cf.getStart()+amount-1;
		cf.setEnd(end);
		System.out.println("dao로부터 controller로 넘겨준 것 "+dao.filterCarpool(cf));
		return dao.filterCarpool(cf);
	}

	//카풀 신청하기(승객)
	public int insertPassenger(CarpoolMatch match) {
		return dao.insertPassenger(match);
	}
	
	//운전자의 카풀 등록하기(controller에서는 registerCarpool)
	public int insertCarpool(Carpool carpool) {
		return dao.insertCarpool(carpool);
	}
	
	//더보기 버튼 구현을 위한 카풀수 구하기
	public int totalCount(CarpoolFilter cf) {
		return dao.totalCount(cf);
	}


}
