package kr.co.admin.model.service;

import java.util.ArrayList;
import java.util.StringTokenizer;

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
	
	public int selectMemberCount() {

		return dao.selectMemberCount();
	}

	public int updateMemberGrade(Member m) {
		
		return dao.updateMemberGrade(m);
	}

	public boolean checkedChangeGrade(String id, String grade) {
		//id, grade 구분자 "/" 분리
		StringTokenizer sT1 = new StringTokenizer(id,"/");
		StringTokenizer sT2 = new StringTokenizer(grade,"/");
		
		boolean result = true;
		
		while(sT1.hasMoreTokens()) {
			//토큰 남아있으면 true
			String memberId = sT1.nextToken();
			int memberGrade = Integer.parseInt(sT2.nextToken());
			
			Member m = new Member();
			m.setMemberId(memberId);
			m.setMemberGrade(memberGrade);
			
			int changeResult = dao.updateMemberGrade(m); //등급 변경
			
			if(changeResult == 0) {
				//실패한 경우
				result = false;
				break;
			}
		}
		
		return result;
	}

	public boolean deleteMember(String id) {
		//id 구분자 "/" 분리
		StringTokenizer sT = new StringTokenizer(id,"/");
		
		boolean result = true;
		
		while(sT.hasMoreTokens()) {
			String memberId = sT.nextToken();
			
			int deleteResult = dao.deleteMember(memberId); //회원 탈퇴
			
			if(deleteResult == 0) {
				//실패
				result = false;
				break;
			}
		}

		return result;
	}

	public Member selectOneMember(String searchMemberId) {
		
		return dao.selectOneMember(searchMemberId);
	}


	
}
