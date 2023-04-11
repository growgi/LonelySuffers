package kr.co.chat.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.chat.model.dao.ChatDao;
import kr.co.chat.model.vo.ChatActive;
import kr.co.chat.model.vo.ChatContent;

@Service
public class ChatService {
	
	@Autowired
	private ChatDao dao;

	public ChatActive selectChatActive(String memberId) {
		return dao.selectChatActive(memberId);
	}
	
	@Transactional
	public int insertChatActive(String memberId) {
		return dao.insertChatActive(memberId);
	}

	public ArrayList<ChatContent> selectChatContent(String memberId) {
		return dao.selectChatContent(memberId);
	}

	public int insertChatStart(ChatActive ca) {
		// TODO Auto-generated method stub
		return dao.insertChatStart(ca);
	}

	public int updateChatActivation(int chatActiveNo) {
		return dao.updateChatActivation(chatActiveNo);
	}

	public int insertSendChat(ChatContent cc) {
		System.out.println("service check : "+cc.getSenderCheck());
		return dao.insertSendChat(cc);
	}
}
