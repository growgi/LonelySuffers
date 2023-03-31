package kr.co.carpool.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.carpool.model.dao.CarpoolDao;

@Service
public class CarpoolService {
	@Autowired
	private CarpoolDao dao;

}
