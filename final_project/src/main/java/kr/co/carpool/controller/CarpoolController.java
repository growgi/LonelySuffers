package kr.co.carpool.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

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

	// 카풀 메인으로 가기(selectAll)
	@RequestMapping(value = "/carpoolMain.do")
	public String carpoolMain(Model model) {
		ArrayList<Carpool> list = service.selectAllCarpool();
		model.addAttribute("list", list);
		// model.addAttribute("totalNumber", list.size());
		return "carpool/carpoolMain";
	}

	// 카풀 메인에서 '더보기'버튼 구현을 위한 등록된 카풀 갯수 구하기(필터해서 볼때도 필터된 리스트 사이에서 구현된다.)
	@ResponseBody
	@RequestMapping(value = "/carpoolCount.do")
	public String carpoolCount(CarpoolFilter cf, Model model) {
		//System.out.println(cf);
		int totalCount = service.totalCount(cf);
		return String.valueOf(totalCount);
	}

	// 탑승자의 카풀 신청하기! 카풀 메인의 개별 하나를 클릭 했을때 신청하는 상세 페이지로 넘어가기
	@RequestMapping(value = "/carpoolRequest.do")
	public String carpoolRequest(int carpoolNo, Model model, HttpSession session) {
		Member me = (Member)session.getAttribute("m");
		if(me!=null) {
			Carpool c = service.selectOneCarpool(carpoolNo);
			if(me.getMemberGrade() == 3) {
				if (c != null) {
					model.addAttribute("c", c);
					return "carpool/carpoolRequest";
				} else {
					return "carpool/carpoolMain";
				}
			}else {
				model.addAttribute("title","접근 제한됨");
				model.addAttribute("msg","일반 회원만 탑승신청 가능합니다.");
				model.addAttribute("icon","error");
				model.addAttribute("loc","/loginFrm.do");
				return "common/msg";
			}
		}else {
			model.addAttribute("title","접근 제한됨");
			model.addAttribute("msg","로그인을 해주십시오.");
			model.addAttribute("icon","error");
			model.addAttribute("loc","/loginFrm.do");
			return "common/msg";
		}
	}

	// 운전자의 카풀 등록하는 페이지로 넘어가기 carpoolOfferForm.do
	@RequestMapping(value = "/carpoolOfferForm.do")
	public String carpoolOfferForm(HttpSession session, Model model) {
		Member me = (Member)session.getAttribute("m");
		if(me!=null) {
			if(me.getMemberGrade() == 3) {
				return "carpool/carpoolOfferForm";
			}else {
				model.addAttribute("title","접근 제한됨");
				model.addAttribute("msg","일반 회원만 차량등록 가능합니다.");
				model.addAttribute("icon","error");
				model.addAttribute("loc","/loginFrm.do");
				return "common/msg";
			}
		}else {
			model.addAttribute("title","접근 제한됨");
			model.addAttribute("msg","로그인을 해주십시오.");
			model.addAttribute("icon","error");
			model.addAttribute("loc","/loginFrm.do");
			return "common/msg";
		}
	}

	// 운전자의 카풀이 등록되면 기능구현하는 registerCarpool.do
	@RequestMapping(value = "/registerCarpool.do")
	public String registerCarpool(Carpool carpool, HttpSession session, Model model) {
		//System.out.println(carpool);
		// 운전자가 한달에 4개 이상의 카풀을 등록하지 못하게
		// 날짜가 겹치지 않게
		// 날짜가 지나면 등록하지 못하게
		Member me = (Member)session.getAttribute("m");
		if(me != null) {
		int result = service.insertCarpool(carpool);
			if (result > 0) {
				return "redirect:/carpoolMain.do";
			} else {
				return "redirect:/carpoolOfferForm.do";
			}
		}else {
			model.addAttribute("title","접근 제한됨");
			model.addAttribute("msg","로그인을 해주십시오.");
			model.addAttribute("icon","error");
			model.addAttribute("loc","/loginFrm.do");
			return "common/msg";
		}
	}

	@ResponseBody // ajax쓸때는 ResponseBody 꼭 써야하지!!
	@RequestMapping(value = "/filterCarpool.do", produces = "application/json;charset=utf-8")
	public String filterCarpool(CarpoolFilter cf, int amount) {
	/*	System.out.println("cf : " + cf);
		if (cf != null) {
			if (cf.getClosure() != null) {
				System.out.println("★cf.getclosure 배열길이: " + cf.getClosure().length);
				for (int i = 0; i < cf.getClosure().length; i++) {
					System.out.println("★cf.getclosure 값: " + cf.getClosure()[i]);
				}
			}
		}*/
		ArrayList<Carpool> list = service.filterCarpool(cf, amount);
		Gson gson = new Gson();
		String result = gson.toJson(list);
		System.out.println(result);
		return result;
	}

	// carpoolRequest.jsp에서 '태워주세요' 누르면 passenger 테이블에 insert
	@RequestMapping(value = "/carpoolMatch.do")
	public String carpoolMatch(Model model, int carpoolNo, String passengerMsg,
			@SessionAttribute(required = false) Member m) {
		Carpool c = service.selectOneCarpool(carpoolNo);
		if (c.getClosure() == 2) {
			if (c.getDriverNo() == m.getMemberNo()) {
				// 작성자와 신청자가 같지 않도록, 본인이 작성한 글에는 본인이 신청할 수 없도록 한다.
				model.addAttribute("title", "카풀 신청 실패");
				model.addAttribute("msg", "본인의 카풀에 신청할 수 없습니다.");
				model.addAttribute("icon", "error");
				model.addAttribute("loc", "/carpoolRequest.do?carpoolNo=" + carpoolNo);
				return "common/msg";
			} else {
				CarpoolMatch match = new CarpoolMatch();
				match.setCarpoolNo(carpoolNo);
				match.setPassengerMsg(passengerMsg);
				match.setPassengerNo(m.getMemberNo());
				int result = service.insertPassenger(match);
				if (result > 0) {
					model.addAttribute("title", "카풀 신청 완료");
					model.addAttribute("msg", "카풀 신청을 완료했습니다.");
					model.addAttribute("icon", "success");
					model.addAttribute("loc", "/passengerPage.do?memberNo=" + m.getMemberNo());
					return "common/msg";
				} else if (result == 0) {
					model.addAttribute("title", "카풀 신청 실패");
					model.addAttribute("msg", "카풀 신청을 실패했습니다.");
					model.addAttribute("icon", "error");
					model.addAttribute("loc", "/passengerPage.do?memberNo=" + m.getMemberNo());
					return "common/msg";
				} else {
					model.addAttribute("title", "카풀 신청 실패");
					model.addAttribute("msg", "이미 신청하셨습니다.");
					model.addAttribute("icon", "error");
					model.addAttribute("loc", "/carpoolRequest.do?carpoolNo=" + carpoolNo);
					return "common/msg";
				}
			}
		} else {
			model.addAttribute("title", "모집기간이 아닙니다.");
			model.addAttribute("msg", "카풀 마감 혹은 삭제된 건입니다.");
			model.addAttribute("icon", "error");
			model.addAttribute("loc", "/passengerPage.do?memberNo=" + m.getMemberNo());
			return "common/msg";
		}

	}

	// 운전자의 내 카풀 리스트 보기!!!
	// 운전자의 카풀 수락, 거절, 마감 등 관리하기
	@RequestMapping(value = "/driverPage.do")
	public String mycarpoolDriver(Model model, int driverNo, HttpSession session) {
		Member me = (Member)session.getAttribute("m");
		if(me!=null) {
			ArrayList<Carpool> list = service.getMyLists(driverNo);
			model.addAttribute("list", list);
			return "carpool/driverPage";
		}else {
			model.addAttribute("title","로그아웃됨");
			model.addAttribute("msg","로그인을 해주십시오.");
			model.addAttribute("icon","error");
			model.addAttribute("loc","/loginFrm.do");
			return "common/msg";
		}
	}

	// 운전자 페이지 : 거절, 수락(번복없다!)
	@ResponseBody
	@RequestMapping(value = "driverDecide.do")
	public String driverDecide(Passenger passenger) {
		System.out.println("운전자페이지 테스트 passenger" + passenger);
		int result = service.updateDriverDecision(passenger);
		System.out.println("result : " +result);
		if (result > 0) {
			Passenger p = service.selectOnePassenger(passenger.getMatchNo());
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("result",result);
			map.put("p", p);
			return new Gson().toJson(map); // success가 ajax의 decision으로 결과값이 돌아간다. ajax에서 url 안넣는다.
		} else {
			return "error";
		}
	}

	// 운전자 페이지 : 마감, 취소(번복없다)
	@ResponseBody
	@RequestMapping(value = "driverClosing.do")
	public String driverClosing(Carpool carpool) {
		//System.out.println("운전자 closure 페이지 컨트롤러테스트: " + carpool);
		int result = service.updateDriverClosing(carpool);
		//System.out.println("운전자 closure 페이지 컨트롤러 result 테스트: " + result);
		if (result > 0) {
			return "success"; // success가 ajax의 decision으로 결과값이 돌아간다. ajax에서 url 안넣는다.
		} else {
			return "error";
		}
	}

	// 탑승자의 내 카풀 리스트 보기!!!
	// 탑승자의 카풀 수락, 거절 관리하기
	@RequestMapping(value = "/passengerPage.do")
	public String mycarpoolPassenger(Model model, int memberNo, HttpSession session) {
		Member me = (Member)session.getAttribute("m");
		if(me!=null) {
			ArrayList<Carpool> list = service.getMyRequests(memberNo);
			//System.out.println("passengerPage.do의 controller: " + list);
			model.addAttribute("list", list);
			return "carpool/passengerPage";
		}else {
			model.addAttribute("title","로그아웃됨");
			model.addAttribute("msg","로그인을 해주십시오.");
			model.addAttribute("icon","error");
			model.addAttribute("loc","/loginFrm.do");
			return "common/msg";
		}
	}

}
