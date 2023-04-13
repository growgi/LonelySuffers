package kr.co.chat.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kr.co.chat.model.service.ChatService;
import kr.co.chat.model.vo.ChatActive;
import kr.co.chat.model.vo.ChatContent;

@Controller
public class ChatController {
	
	@Autowired
	private ChatService service;
	
	@ResponseBody
	@RequestMapping(value = "/chat.do")
	public String chat(String memberId) {
		ChatActive ca = service.selectChatActive(memberId);
		System.out.println(ca);
		if(ca.getChatActivation() == 2) {
			int result = service.updateChatActivation(ca.getChatActiveNo());
			if(result == 0) {
				return "caNo";
			}else {
				return "caOk";
			}
		}else {
			return "caOk";
		}
	}
	
//	@ResponseBody
//	@RequestMapping(value = "/chat.do",produces = "application/json;charset=utf-8")
//	public String chat(String memberId) {
//	ChatActive ca = service.selectChatActive(memberId);
//		if(ca == null) {
//			int result = service.insertChatActive(memberId);
//			if(result != 0 ) {
//				return "caOk";
//			}else {
//				return "caNo";
//			}
//		}else {
//			return "caOk";
//		}
//	}
	
	@ResponseBody
	@RequestMapping(value = "/chatList.do",produces = "application/json;charset=utf-8")
	public String chatList(String memberId) {
		ArrayList<ChatContent> list = service.selectChatContent(memberId);
		return new Gson().toJson(list);
	}
}
