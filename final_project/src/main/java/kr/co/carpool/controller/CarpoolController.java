package kr.co.carpool.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kr.co.carpool.model.service.CarpoolService;
import kr.co.carpool.model.vo.Carpool;

@Controller
public class CarpoolController {
	@Autowired
	private CarpoolService service;
	
	//카풀 메인으로 가기(selectAll)
	@RequestMapping(value="/carpoolMain.do")
	public String carpoolMain(Model model) {
		ArrayList<Carpool> list = service.selectAllCarpool();
		model.addAttribute("list",list);
		return "carpool/carpoolMain";
	}
	//탑승자의 카풀 신청하기! 카풀 메인의 개별 하나를 클릭 했을때 신청하는 상세 페이지로 넘어가기
	@RequestMapping(value="/carpoolRequest.do")
	public String carpoolRequest(Carpool carpool, Model model) {
		Carpool c = service.selectOneCarpool(carpool);
		if(c!=null) {
			model.addAttribute("c", c);
			return "carpool/carpoolRequest";
		}else {
			return "carpool/carpoolMain";			
		}
		
	}
	//운전자의 카풀 등록하는 페이지로 넘어가기 carpoolOfferForm.do
	@RequestMapping(value="/carpoolOfferForm.do")
	public String carpoolOfferForm() {
		return "carpool/carpoolOfferForm";
	}
	
	//운전자의 카풀이 등록되면 기능구현하는 registerCarpool.do
	//카풀 페이지는 누구에게나 뜨지만 등록은 가입된 회원만 할 수 있도록
	
	
	//ajax로 필터 값 적용하기 filterSearch.do
	@ResponseBody
	@RequestMapping(value="/filterCarpool.do", produces="application/json;charset=utf-8")
	public String filterCarpool() {
		ArrayList<Carpool> list = service.filterCarpool();
		Gson gson = new Gson();
		String result= gson.toJson(list);
		System.out.println(result);
		return result;
	}

	
	//운전자의 내 카풀 리스트 보기!!!
	//운전자의 카풀 수락, 거절, 마감 등 관리하기
	@RequestMapping(value="/driverPage.do")
	public String mycarpoolDriver() {
		return "carpool/driverPage";
	}
	

	
	
	//탑승자의 내 카풀 리스트 보기!!!
	//탑승자의 카풀 수락, 거절 관리하기
		@RequestMapping(value="/passengerPage.do")
		public String mycarpoolPassenger() {
			return "carpool/passengerPage";
		}

	
}
