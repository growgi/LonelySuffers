package kr.co.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.member.model.service.MemberService;

@Controller
public class MemberController {
	@Autowired
	private MemberService service;

	public MemberController() {
		super();
		System.out.println("MemberController 생성 완료");
	}
	
	//@RequestMapping(value = "/")
	
}
