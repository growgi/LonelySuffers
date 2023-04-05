package kr.co.admin.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.admin.model.dao.AdminDao;
import kr.co.member.model.vo.Member;

@Service
public class AdminService {

	@Autowired
	AdminDao dao;

	public ArrayList<Member> selectAllMember() {
		
		return dao.selectAllMember();
	}

	public int updateMemberGrade(Member m) {
		
		return dao.updateMemberGrade(m);
	}
	
}
