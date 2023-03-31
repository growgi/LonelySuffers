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

		public Member login(Member m) {
			return sqlSession.selectOne("member.login",m);
		}

		public int joinMember(Member m) {
			return 0;
		}
		
		
}
