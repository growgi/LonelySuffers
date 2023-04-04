package kr.co.carpool.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.carpool.model.service.CarpoolService;

@Controller
public class CarpoolController {
	@Autowired
	private CarpoolService service;
	
	//카풀 메인으로 가기
	@RequestMapping(value="/carpoolMain.do")
	public String carpoolMain() {
		return "carpool/carpoolMain";
	}
	
	//필터 값 적용하기 filterSearch.do
	//@RequestMapping(value="/filterSearch.do")
	//public String filter() {
		
		
	//}

	//운전자 카풀 신청하는 페이지로 넘어가기 carpoolOfferForm.do
	@RequestMapping(value="carpoolOfferForm.do")
	public String carpoolOfferForm() {
		return "carpool/carpoolOfferForm";
		
	}
	
	
}
