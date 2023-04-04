package kr.co.carpool.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.carpool.model.service.CarpoolService;

@Controller
public class CarpoolController {
	@Autowired
	private CarpoolService service;
	
	@RequestMapping(value="/filterSearch.do")
	public String filter() {
		
		return null;
		
	}
	

	//필터 값 적용하기 filterSearch.do
	
	//운전자 카풀 신청하기 carpoolOffer.do
	
	
}
