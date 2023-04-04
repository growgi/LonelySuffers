package kr.co.carpool.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.carpool.model.service.CarpoolService;
import kr.co.carpool.model.vo.Carpool;

@Controller
public class CarpoolController {
	@Autowired
	private CarpoolService service;
	
	//카풀 메인으로 가기
	@RequestMapping(value="/carpoolMain.do")
	public String carpoolMain(Model model) {
		ArrayList<Carpool> list = service.selectAllCarpool();
		model.addAttribute("list",list);
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
	
	//카풀 메인의 개별 하나를 클릭 했을때 신청하는 상세 페이지로 넘어가기
	@RequestMapping(value="carpoolRequest.do")
	public String carpoolRequest() {
		return "carpool/carpoolRequest";
	}
	
	
}
