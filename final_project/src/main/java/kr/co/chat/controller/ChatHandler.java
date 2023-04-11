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
		if(type.equals("start")) {
			String memberId = element.getAsJsonObject().get("msg").getAsString();
			System.out.println("memberId : "+memberId);
			connectionMemberList.put(memberId, session);
			memberIdList.put(session,memberId);
			System.out.println(connectionMemberList);
			ChatActive ca = service.selectChatActive(memberId);
			int result;
			if(ca.getChatActivation() == 2) {
				service.updateChatActivation(ca.getChatActiveNo());
				result = service.insertChatStart(ca);
			}else {
				result = 1;
			}
			JsonObject obj = new JsonObject();
			if(result != 0) {
				obj.addProperty("type", "startCondition");
				obj.addProperty("msg", "ok");
				String resultStr = new Gson().toJson(obj);
				TextMessage tm = new TextMessage(resultStr);
				session.sendMessage(tm);
			}else {
				obj.addProperty("type", "startCondition");
				obj.addProperty("msg", "no");
				String resultStr = new Gson().toJson(obj);
				TextMessage tm = new TextMessage(resultStr);
				session.sendMessage(tm);
			}
		}else if(type.equals("send")) {
			String chatContent = element.getAsJsonObject().get("msg").getAsString();
			String memberId = memberIdList.get(session);
			String sender = element.getAsJsonObject().get("sender").getAsString();
			ChatActive ca = service.selectChatActive(memberId);
			int chatActiveNo = ca.getChatActiveNo();
			int result;
			System.out.println("memberId : "+memberId);
			System.out.println("sender : "+sender);
			if(memberId.equals(sender)) {
				//유저가 관리자에게 보낼때
				ChatContent cc = new ChatContent();
				cc.setChatActiveNo(chatActiveNo);
				cc.setMemberId(sender);
				cc.setChatContent(chatContent);
				cc.setSenderCheck(1);
				result = service.insertSendChat(cc);
			}else {
				//관리자가 유저에게 보낼때
				ChatContent cc = new ChatContent();
				cc.setChatActiveNo(chatActiveNo);
				cc.setMemberId(sender);
				cc.setChatContent(chatContent);
				cc.setSenderCheck(2);
				result = service.insertSendChat(cc);
			}
			if(result != 0) {
				WebSocketSession adminSession = connectionMemberList.get("admin");
				WebSocketSession userSession = connectionMemberList.get(sender);
				JsonObject obj = new JsonObject();
				obj.addProperty("type", "sendCondition");
				obj.addProperty("msg", "ok");
				String resultStr = new Gson().toJson(obj);
				TextMessage tm = new TextMessage(resultStr);
				if(adminSession != null) {
					adminSession.sendMessage(tm);
				}
				userSession.sendMessage(tm);
			}else {
				JsonObject obj = new JsonObject();
				obj.addProperty("type", "sendCondition");
				obj.addProperty("msg", "no");
				String resultStr = new Gson().toJson(obj);
				TextMessage tm = new TextMessage(resultStr);
				session.sendMessage(tm);
			}
		}
	}
	
	public void afterConnectionClosed(WebSocketSession session,CloseStatus status)throws Exception {
		
	}
}
