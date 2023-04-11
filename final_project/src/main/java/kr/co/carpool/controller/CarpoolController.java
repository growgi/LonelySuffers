package kr.co.carpool.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.google.gson.Gson;

import kr.co.carpool.model.service.CarpoolService;
import kr.co.carpool.model.vo.Carpool;
import kr.co.carpool.model.vo.CarpoolFilter;
import kr.co.carpool.model.vo.CarpoolMatch;
import kr.co.carpool.model.vo.Passenger;
import kr.co.member.model.vo.Member;

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
	@RequestMapping(value="/registerCarpool.do")
	public String registerCarpool(Carpool carpool) {
		System.out.println(carpool.getDriverNo());
		System.out.println(carpool.getDepartureDate());
		int result = service.insertCarpool(carpool);
		if(result>0){
			return "redirect:/carpoolMain.do";
		}else {
			return "redirect:/carpoolOfferForm.do";
		}
	}
	
	
	//ajax로 필터링 된 값 화면에서 보기 filterSearch.do 
	//1. 결국 페이지는 변경되지않고 carpoolMain.jsp 페이지에서 보여주는 것
	//2. carpoolMain.do 처럼 ArrayList 가져오나?
	@ResponseBody
	@RequestMapping(value="/filterCarpool.do", produces="application/json;charset=utf-8")
	public String filterCarpool(CarpoolFilter cf) {
		ArrayList<Carpool> list = service.filterCarpool(cf);
		Gson gson = new Gson();
		String result= gson.toJson(list);
		System.out.println(result);
		return result;
	}
	
	//carpoolRequest.jsp에서 '태워주세요' 누르면 guest 테이블에 insert
	@RequestMapping(value="/carpoolMatch.do")
	public String carpoolMatch(int carpoolNo, @SessionAttribute(required = false) Member m ) {
		CarpoolMatch match = new CarpoolMatch();
		match.setCarpoolNo(carpoolNo);
		match.setPassengerNo(m.getMemberNo());
		int result = service.insertPassenger(match);
		if(result>0) {
			return "carpool/passengerPage";
		}else {
			return "carpool/carpoolMain";
		}
		
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
