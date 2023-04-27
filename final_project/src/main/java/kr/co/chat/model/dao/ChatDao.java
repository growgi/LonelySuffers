package kr.co.chat.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.chat.model.vo.ChatActive;
import kr.co.chat.model.vo.ChatContent;

@Repository
public class ChatDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ChatActive selectChatActive(String memberId) {
		return sqlSession.selectOne("chat.selectChatActive",memberId);
	}

	public int insertChatActive(String memberId) {
		return sqlSession.insert("chat.insertChatActive",memberId);
	}

	public ArrayList<ChatContent> selectChatContent(String memberId) {
		List list =  sqlSession.selectList("chat.selectChatContent",memberId);
		return (ArrayList<ChatContent>)list;
	}

	public int insertChatStart(ChatActive ca) {
		return sqlSession.insert("chat.insertChatStart",ca);
	}

	public int updateChatActivation(int chatActiveNo) {
		return sqlSession.update("chat.updateChatActivation",chatActiveNo);
	}

	public int insertSendChat(ChatContent cc) {
		// TODO Auto-generated method stub
		return sqlSession.insert("chat.insertSendChat",cc);
	}

	public ArrayList<ChatActive> selectAllChatActive() {
		List list = sqlSession.selectList("chat.selectAllChatActive");
		return (ArrayList<ChatActive>)list;
	}

	public ChatContent selectChatData(String memberId) {
		return sqlSession.selectOne("chat.selectChatData",memberId);
	}

	public int endChat(String memberId) {
		return sqlSession.update("chat.endChat",memberId);
	}

	public int selectChatActivation(String memberId) {
		return sqlSession.selectOne("chat.selectChatActivation",memberId);
	}
	
}
