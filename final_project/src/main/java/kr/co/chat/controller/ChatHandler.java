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

public class ChatHandler extends TextWebSocketHandler {

	@Autowired
	private ChatService service;

	private HashMap<String, WebSocketSession> connectionMemberList;
	private HashMap<WebSocketSession, String> memberIdList;
	private ArrayList<WebSocketSession> adminList;

	public ChatHandler() {
		super();
		connectionMemberList = new HashMap<String, WebSocketSession>();
		memberIdList = new HashMap<WebSocketSession, String>();
		adminList = new ArrayList<WebSocketSession>();
	}

	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		
	}

	public void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		String receiveMsg = message.getPayload();
		JsonElement element = JsonParser.parseString(receiveMsg);
		System.out.println("element : " + element);
		String type = element.getAsJsonObject().get("type").getAsString();
		// 로그인시 memberId 가 admin인지 구분하여 각 List에 맡게 입력
		if (type.equals("login")) {
			String memberId = element.getAsJsonObject().get("memberId").getAsString();
			if (memberId.equals("admin")) {
				adminList.add(session);
			}
			connectionMemberList.put(memberId, session);
			memberIdList.put(session, memberId);
			System.out.println("connectionMemberList :" + connectionMemberList);
			System.out.println("memberIdList : " + memberIdList);
			System.out.println("adminList : " + adminList);
		} else if (type.equals("logout")) {
			String memberId = element.getAsJsonObject().get("memberId").getAsString();
			if (memberId.equals("admin")) {
				adminList.remove(session);
			}
			connectionMemberList.remove(memberId);
			memberIdList.remove(session);
			System.out.println("connectionMemberList :" + connectionMemberList);
			System.out.println("memberIdList : " + memberIdList);
			System.out.println("adminList : " + adminList);
		} else if (type.equals("send")) {
			String sender = element.getAsJsonObject().get("sender").getAsString();
			String msg = element.getAsJsonObject().get("msg").getAsString();
			String memberId = memberIdList.get(session);
			ChatActive ca = service.selectChatActive(sender);
			ChatContent cc = new ChatContent();
			JsonObject obj = new JsonObject();
			obj.addProperty("type", "sendCondition");
			obj.addProperty("msg", "sendOk");
			obj.addProperty("senderId", sender);
			String resultStr = new Gson().toJson(obj);
			TextMessage tm = new TextMessage(resultStr);
			System.out.println("sender 체크 : " + sender);
			int result;
			if (ca != null) {
				if (memberId.equals(sender)) {
					cc.setMemberId(sender);
					cc.setChatActiveNo(ca.getChatActiveNo());
					cc.setSenderCheck(1);
					cc.setChatContent(msg);
					result = service.insertSendChat(cc);

				} else {
					cc.setMemberId(sender);
					cc.setChatActiveNo(ca.getChatActiveNo());
					cc.setSenderCheck(2);
					cc.setChatContent(msg);
					result = service.insertSendChat(cc);

				}
				System.out.println("tm : " + tm);
				System.out.println("result : " + result);
				if (result != 0) {
					for (WebSocketSession admin : adminList) {
						admin.sendMessage(tm);
						System.out.println(admin);
					}
					System.out.println("send memberId : " + sender);
					WebSocketSession userSession = connectionMemberList.get(sender);
					System.out.println("userSession : " + userSession);
					if (userSession != null) {
						userSession.sendMessage(tm);
						System.out.println(userSession);
					}

				}
			}
		}else if(type.equals("endChatBtn")) {
			String endMemberId = element.getAsJsonObject().get("msg").getAsString();
			JsonObject obj = new JsonObject();
			obj.addProperty("type", "endChat");
			obj.addProperty("memberId", endMemberId);
			String resultStr = new Gson().toJson(obj);
			TextMessage tm = new TextMessage(resultStr);
			for(WebSocketSession admin : adminList) {
				admin.sendMessage(tm);
			}
		}else if(type.equals("startChatBtn")) {
			String startMemberId = element.getAsJsonObject().get("msg").getAsString();
			JsonObject obj = new JsonObject();
			obj.addProperty("type", "startChat");
			obj.addProperty("memberId", startMemberId);
			String resultStr = new Gson().toJson(obj);
			TextMessage tm = new TextMessage(resultStr);
			for(WebSocketSession admin : adminList) {
				admin.sendMessage(tm);
			}
		}
	}

	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		String memberId = memberIdList.get(session);
		if (memberId.equals("admin")) {
			adminList.remove(session);
		}
		connectionMemberList.remove(memberId);
		memberIdList.remove(session);
	}
}
