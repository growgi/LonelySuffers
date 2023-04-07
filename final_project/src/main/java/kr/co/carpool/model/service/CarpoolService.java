package kr.co.carpool.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.carpool.model.dao.CarpoolDao;
import kr.co.carpool.model.vo.Carpool;

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

	public ArrayList<Carpool> filterCarpool() {
		return dao.filterCarpool();
	}

}
