package kr.co.chat.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.server.WebSession;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import kr.co.chat.model.service.ChatService;
import kr.co.chat.model.vo.ChatActive;
import kr.co.chat.model.vo.ChatContent;

public class ChatHandler extends TextWebSocketHandler{
	
	@Autowired
	private ChatService service;
	
	private HashMap<String, WebSocketSession> connectionMemberList;
	private HashMap<WebSocketSession, String> memberIdList;
	
	
	public ChatHandler() {
		super();
		connectionMemberList = new HashMap<String, WebSocketSession>();
		memberIdList = new HashMap<WebSocketSession, String>();
	}

	public void afterConnectionEstablished(WebSocketSession session)throws Exception {
		
	}
	
	public void handleTextMessage(WebSocketSession session,TextMessage message)throws Exception {
		String receiveMsg = message.getPayload();
		JsonElement element = JsonParser.parseString(receiveMsg);
		System.out.println("element : "+element);
		String type = element.getAsJsonObject().get("type").getAsString();
		if(type.equals("login")) {
			String memberId = element.getAsJsonObject().get("memberId").getAsString();
			connectionMemberList.put(memberId, session);
			memberIdList.put(session, memberId);
		}else if(type.equals("logout")){
			String memberId = element.getAsJsonObject().get("memberId").getAsString();
			connectionMemberList.remove(memberId);
			memberIdList.remove(session);
		}
	}
	
	public void afterConnectionClosed(WebSocketSession session,CloseStatus status)throws Exception {
		
	}
}
