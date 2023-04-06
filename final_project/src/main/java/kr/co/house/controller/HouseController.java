package kr.co.house.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kr.co.house.model.service.HouseService;
import kr.co.house.model.vo.FindRoomByCondition;
import kr.co.house.model.vo.House;
import kr.co.house.model.vo.Room;
import kr.co.house.model.vo.RoomBook;

@Controller
public class HouseController {

	@Autowired
	private HouseService service;



// 숙박 상품 상세페이지 보기.  House 테이블에서 Row 1개 전체 조회 후 반환
	@RequestMapping(value="/houseView.do")
	public String houseView(int houseNo, Model model) {
		House h = service.selectOneHouse(houseNo);
		model.addAttribute("house", h);
		return "product/houseDetail";
	}



// 하나의 숙박 상품에 대한 객실들 조회.  숙박 상품이 갖고 있는 roomTitle과 roomCapa를 WHERE 조건으로 가져와서 Room 테이블에서 Row 여러개 조회 후 반환
	@RequestMapping(value="/availableRooms.do")
	public String availableRooms(String roomTitle, int roomCapa, Model model) {
		FindRoomByCondition condition = new FindRoomByCondition();
		condition.setRoomTitle(roomTitle);
		condition.setRoomCapa(roomCapa);
		ArrayList<Room> list = service.selectAllAvailableRoom(condition);
		model.addAttribute("roomList", list);
		return "product/houseDetail";
	}



// 하나의 객실에 대한 예약 내역(결제 완료 상태) 조회.    ROOM_BOOK 테이블에서 Row 여러개 조회 후 반환
	@RequestMapping(value="/bookOneRoom.do")
	public String bookOneRoom(int roomNo, Model model) {
		ArrayList<RoomBook> list = service.selectAllBook(roomNo);
		model.addAttribute("invalidDateList", list);
		return "product/houseDetail";
	}
//네이버지도 api 마커를 위한 경도,위도 조회.
	@ResponseBody
	@RequestMapping(value="/allAddress.do" , produces = "application/json;charset=utf-8")
	public String selectAllAddress() {
		ArrayList<House> list = service.selectAllAddress();
		Gson gson = new Gson();
		String result = gson.toJson(list);
		System.out.println(result);
		return result;
	}

}
