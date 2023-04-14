package kr.co.carpool.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
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
		//model.addAttribute("totalNumber", list.size());
		return "carpool/carpoolMain";
	}
	//카풀 메인에서 '더보기'버튼 구현을 위한 등록된 카풀 갯수 구하기(필터해서 볼때도 필터된 리스트 사이에서 구현된다.)
	@ResponseBody
	@RequestMapping(value="/carpoolCount.do")
	public String carpoolCount(CarpoolFilter cf, Model model) {
		System.out.println(cf);
		int totalCount = service.totalCount(cf);		
		return String.valueOf(totalCount);
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
		//운전자가 한달에 4개 이상의 카풀을 등록하지 못하게
		//날짜가 겹치지 않게
		//날짜가 지나면 등록하지 못하게 
		int result = service.insertCarpool(carpool);
		if(result>0){
			return "redirect:/carpoolMain.do";
		}else {
			return "redirect:/carpoolOfferForm.do";
		}
	}
	
	
	@ResponseBody //ajax쓸때는 ResponseBody 꼭 써야하지!!
	@RequestMapping(value="/filterCarpool.do", produces="application/json;charset=utf-8")
	public String filterCarpool(CarpoolFilter cf,int amount) {
		ArrayList<Carpool> list = service.filterCarpool(cf, amount);
		Gson gson = new Gson();
		String result= gson.toJson(list);
		System.out.println(result);
		return result;
	}
	
	//carpoolRequest.jsp에서 '태워주세요' 누르면 passenger 테이블에 insert
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
	public String mycarpoolDriver(Model model, int driverNo) {
		ArrayList<Carpool> list = service.getMyLists(driverNo);
		model.addAttribute("list",list);
		return "carpool/driverPage";
	}
	//운전자의 거절, 수락(번복없다!)
	@ResponseBody	
	@RequestMapping(value="driverDecide.do")
	public String driverDecide(Passenger passenger) {
		System.out.println("운전자페이지 테스트"+passenger);
		int result = service.updateDriverDecision(passenger);
		System.out.println(result);
		if(result>0) {
			return "success"; //success가 ajax의 decision으로 결과값이 돌아간다. ajax에서 url 안넣는다.
		}else {
			return "error";
		}
	}
		
	
	
	//탑승자의 내 카풀 리스트 보기!!!
	//탑승자의 카풀 수락, 거절 관리하기
		@RequestMapping(value="/passengerPage.do")
		public String mycarpoolPassenger() {
			return "carpool/passengerPage";
		}

	
}
