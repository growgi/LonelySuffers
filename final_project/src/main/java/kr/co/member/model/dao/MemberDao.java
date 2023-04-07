package kr.co.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.member.model.vo.Member;

@Repository
public class MemberDao {

		@Autowired
		private SqlSessionTemplate sqlSession;

		public MemberDao() {
			super();
			System.out.println("MemberDao 생성 완료");
		}

		public Member loginMember(Member m) {
			System.out.println("dao : "+m);
			return sqlSession.selectOne("member.login",m);
		}

		public int joinMember(Member m) {
			return sqlSession.insert("member.joinMember",m);
		}

		public Member idChk(String memberId) {
			return sqlSession.selectOne("member.idChk",memberId);
		}

		public Member findMemberId(Member m) {
			return sqlSession.selectOne("member.findMemberId",m);
		}

		public Member beforePwMember(Member m) {
			return sqlSession.selectOne("member.beforePwMember",m);
		}

		public int updatePwMember(Member m) {
			return sqlSession.update("member.updatePwMember",m);
		}

		public int sellerApplication(int memberNo) {
			return sqlSession.insert("member.sellerApplication",memberNo);
		}

		public int cancelSeller(int memberNo) {
			return sqlSession.delete("member.cancelSeller",memberNo);
		}

		public Member selectSellerApplication(int memberNo) {
			return sqlSession.selectOne("member.selectSellerApplication",memberNo);
		}
		
		
}
