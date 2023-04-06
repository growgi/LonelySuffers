package kr.co.admin.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.member.model.vo.Member;

@Repository
public class AdminDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<Member> selectAllMember() {
		List memberList = sqlSession.selectList("admin.selectAllMember");
		
		return (ArrayList<Member>)memberList;
	}
	
	public int selectMemberCount() {
		int memberCount = sqlSession.selectOne("admin.selectMemberCount");
		
		return memberCount;
	}

	public int updateMemberGrade(Member m) {
		int result = sqlSession.update("admin.updateMemberGrade", m);
		
		return result;
	}

	public int deleteMember(String memberId) {
		int result = sqlSession.delete("admin.deleteMember", memberId);
		
		return result;
	}

	public Member selectOneMember(String searchMemberId) {
		Member searchMember = sqlSession.selectOne("admin.selectOneMember", searchMemberId);
		
		return searchMember;
	}

	public ArrayList<Member> selectAllSellerApplication() {
		List sellerAppList = sqlSession.selectList("admin.selectAllSellerApplication");
		
		return (ArrayList<Member>)sellerAppList;
	}

	public int selectSellerAppCount() {
		int sellerAppCount = sqlSession.selectOne("admin.selectSellerAppCount");
		
		return sellerAppCount;
	}
	
	public Member selectOneSellerApplication(String searchMemberId) {
		Member searchSellerAppMember = sqlSession.selectOne("admin.selectOneSellerApplication", searchMemberId);
		
		return searchSellerAppMember;
	}

	public int updateMemberGradeSeller(String memberId) {
		int result = sqlSession.update("admin.updateMemberGradeSeller", memberId);
		
		return result;
	}

	public int deleteSellerApplication(int memberNo) {
		int result = sqlSession.delete("admin.deleteSellerApplication", memberNo);
		
		return result;
	}


}
