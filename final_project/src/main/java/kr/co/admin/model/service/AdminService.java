package kr.co.admin.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.admin.model.dao.AdminDao;

@Service
public class AdminService {

	@Autowired
	AdminDao dao;
	
}
