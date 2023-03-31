package kr.co.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDao {

		@Autowired
		private SqlSessionTemplate sqlSession;

		public MemberDao() {
			super();
			System.out.println("MemberDao 생성 완료");
		}
		
		
}
