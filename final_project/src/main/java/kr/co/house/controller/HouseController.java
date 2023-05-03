package kr.co.house.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;

import common.ProductFileNumbering;
import kr.co.house.model.service.HouseService;
import kr.co.house.model.vo.FindRoomByCondition;
import kr.co.house.model.vo.House;
import kr.co.house.model.vo.HouseListing;
import kr.co.house.model.vo.HousePagination;
import kr.co.house.model.vo.Room;
import kr.co.house.model.vo.RoomBook;
import kr.co.member.model.vo.Member;
import kr.co.review.model.service.ReviewService;
import kr.co.review.model.vo.Review;

@Controller
public class HouseController {

	@Autowired
	private HouseService service;
	@Autowired
	private ProductFileNumbering fileManager;
	@Autowired
	private ReviewService rservice;

// 키오스크로 이동
	@RequestMapping(value="/kiosk.do")
	public String kiosk(HttpSession session,Model model) {
		Member me = (Member)session.getAttribute("m");
		if (me != null){
			return "kiosk/kiosk";
		}else {
			 model.addAttribute("errorMsg", "예약을 하려면 로그인이 필요합니다.");
		     return "redirect:/";
		}
	}
// 숙박 상품 상세페이지 보기.  House 테이블에서 Row 1개 전체 조회 후 반환
	@RequestMapping(value="/houseView.do")
	public String houseView(int houseNo, Model model, HttpSession session) {
		House h = service.selectOneHouse(houseNo);
		if(h.getHouseStatus()>=0) {
			//review 리스트 받아오는 코드
			ArrayList<Review> list = rservice.selectAllReview(houseNo);
			model.addAttribute("list", list);
			model.addAttribute("house", h);
			return "product/houseDetail";
		}else {
			Member me = (Member)session.getAttribute("m");
			if(me != null) {
				if(me.getMemberGrade()==1) {
					ArrayList<Review> list = rservice.selectAllReview(houseNo);
					model.addAttribute("list", list);
					model.addAttribute("house", h);
					return "product/houseDetail";
				}else if(me.getMemberGrade()==2) {
					if(h.getWriter().equals(me.getMemberId())) {
					ArrayList<Review> list = rservice.selectAllReview(houseNo);
					model.addAttribute("list", list);
					model.addAttribute("house", h);
					return "product/houseDetail";
					}else {
						model.addAttribute("title","접근 제한됨");
						model.addAttribute("msg","상품 등록자만이 열람할 수 있습니다.");
						model.addAttribute("icon","error");
						model.addAttribute("loc","/");
						return "common/msg";
					}
				}else {
					model.addAttribute("title","접근 제한됨");
					model.addAttribute("msg","열람할 수 없는 상품입니다.");
					model.addAttribute("icon","error");
					model.addAttribute("loc","/");
					return "common/msg";
				}
			}else {
				model.addAttribute("title","접근 제한됨");
				model.addAttribute("msg","열람할 수 없는 상품입니다.");
				model.addAttribute("icon","error");
				model.addAttribute("loc","/");
				return "common/msg";
			}
		}
	}
	

// 숙박 상품 상세페이지 모달.
	@ResponseBody
	@RequestMapping(value="/houseModalView.do", produces = "application/text; charset=utf8")
	public String houseModalView(int houseNo, Model model) {
		House h = service.selectOneHouse(houseNo);
		model.addAttribute("house", h);
		Gson gson = new Gson();
		String result = gson.toJson(h);
		System.out.println("숙박상품페이지 모달 컨트롤러 결과"+result.length());
		return result;
	}



// summernote 편집기로 본문에 파일 첨부하기 ajax
	@ResponseBody
	@RequestMapping(value="/attachHouseDescriptionImage.do", produces = "application/json;charset=utf-8")
	public String attachImage(@RequestParam("file") MultipartFile uploadFile, HttpServletRequest request) {
        String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/editor/house/");
        String filepath = fileManager.upload(savePath, uploadFile);
        String getPath = "resources/upload/editor/house/"+filepath;
		return new Gson().toJson(getPath);
	}



// 숙박 상품 등록.  House 테이블에 Row 1개 추가
	@RequestMapping(value="/insertHouse.do")
	public String insertHouse(House h, MultipartFile[] housePhoto, HttpServletRequest request, HttpSession session) {
		Member me = (Member)session.getAttribute("m");
		h.setWriter(me.getMemberId());
		String[] splitedAddress = h.getHouseAddress().split(" ");
		h.setHouseCity(splitedAddress[0]);
		int result = service.insertHouse(h);
		if(result > 0) {
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/house/");
			int flag = 0;
			for(int i=0; i<housePhoto.length; i++) {
				if(!housePhoto[i].isEmpty()) {
					h.setHousePhoto1(fileManager.uploadHousePhoto1(savePath, housePhoto[i], h.getHouseNo()));
					flag = i+1;
					break;
				}
			}
			for(int i=flag; i<housePhoto.length; i++) {
				if(!housePhoto[i].isEmpty()) {
					h.setHousePhoto2(fileManager.uploadHousePhoto2(savePath, housePhoto[i], h.getHouseNo()));
					flag = i+1;
					break;
				}
			}
			for(int i=flag; i<housePhoto.length; i++) {
				if(!housePhoto[i].isEmpty()) {
					h.setHousePhoto3(fileManager.uploadHousePhoto3(savePath, housePhoto[i], h.getHouseNo()));
					flag = i+1;
					break;
				}
			}
			for(int i=flag; i<housePhoto.length; i++) {
				if(!housePhoto[i].isEmpty()) {
					h.setHousePhoto4(fileManager.uploadHousePhoto4(savePath, housePhoto[i], h.getHouseNo()));
					break;
				}
			}
			service.uploadHousePhotos(h);
			return "redirect:/houseView.do?houseNo="+h.getHouseNo();
		}else {
	// 실패 시 처리내용 작성 필요
			return "member/myPage";
		}
	}



// 숙박 상품 수정페이지 보기.  houseStatus에 따라 수정가능한 항목들 다르게 출력
	@RequestMapping(value="/houseUpdate.do")
	public String houseUpdate(int houseNo, HttpSession session, Model model) {
		House h = service.selectOneHouse(houseNo);
		Member me = (Member)session.getAttribute("m");
		if(me.getMemberGrade()==1) {
			model.addAttribute("house", h);
			return "product/houseUpdate";
		}else {
			if(me.getMemberId().equals(h.getWriter())) {
				model.addAttribute("house", h);
				return "product/houseUpdate";
			}else {
				model.addAttribute("title","접근 제한됨");
				model.addAttribute("msg","상품 등록자만이 수정할 수 있습니다.");
				model.addAttribute("icon","error");
				model.addAttribute("loc","/houseView.do?houseNo="+houseNo);
				return "common/msg";
			}
		}
	}



// 숙박 상품 수정하기.   House 테이블에서 Row 1개 수정
	@RequestMapping(value="/updateHouse.do")
	public String updateHouse(House h, MultipartFile newPhoto1, MultipartFile newPhoto2, MultipartFile newPhoto3, MultipartFile newPhoto4, HttpServletRequest request, Model model) {
		if(h.getHouseLat().equals("")) {
			h.setHouseLat(null);
		}
		if(h.getHouseLng().equals("")) {
			h.setHouseLng(null);
		}
		int result = service.updateHouse(h);
		if(result > 0) {
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/house/");
			if(newPhoto1 != null) {
				int filled = 4;
				if(!newPhoto1.isEmpty()) {
					h.setHousePhoto1(fileManager.uploadHousePhoto1(savePath, newPhoto1, h.getHouseNo()));
				} else { filled--; }
				if(!newPhoto2.isEmpty()) {
					h.setHousePhoto2(fileManager.uploadHousePhoto2(savePath, newPhoto2, h.getHouseNo()));
				} else { filled--; }
				if(!newPhoto3.isEmpty()) {
					h.setHousePhoto3(fileManager.uploadHousePhoto3(savePath, newPhoto3, h.getHouseNo()));
				} else { filled--; }
				if(!newPhoto4.isEmpty()) {
					h.setHousePhoto4(fileManager.uploadHousePhoto4(savePath, newPhoto4, h.getHouseNo()));
				} else { filled--; }
				if(filled > 0) {
				service.uploadHousePhotos(h);
				}
			}
			return "redirect:/houseView.do?houseNo="+h.getHouseNo();
		}else {
			model.addAttribute("title","실패");
			model.addAttribute("msg","알 수 없는 이유로 인해 상품 정보 변경이 실패했습니다.");
			model.addAttribute("icon","error");
			model.addAttribute("loc","/houseUpdate.do?houseNo="+h.getHouseNo());
			return "common/msg";
		}
	}



// 객실 관리 페이지 roomManage.jsp를 방문하는 함수.  작성자(숙박 상품 등록자)만 허용됨
	@RequestMapping(value = "/roomManage.do")
	public String roomManage(int houseNo, HttpSession session, Model model) {
		House h = service.selectOneHouse(houseNo);
		Member me = (Member)session.getAttribute("m");
		if(me.getMemberGrade()==1) {
			ArrayList<Room> list = service.selectAllRoomsByHouseNo(houseNo);
			model.addAttribute("house", h);
			model.addAttribute("rooms", list);
			return "product/roomManage";
		}else {
			if(me.getMemberId().equals(h.getWriter())) {
				ArrayList<Room> list = service.selectAllRoomsByHouseNo(houseNo);
				model.addAttribute("house", h);
				model.addAttribute("rooms", list);
				return "product/roomManage";
			}else {
				model.addAttribute("title","접근 제한됨");
				model.addAttribute("msg","상품 등록자만이 해당 상품에 대한 객실들을 관리할 수 있습니다.");
				model.addAttribute("icon","error");
				model.addAttribute("loc","/houseView.do?houseNo="+houseNo);
				return "common/msg";
			}
		}
	}



// 객실 등록.  Room 테이블에 Row 여러개 추가
	@RequestMapping(value="/insertRooms.do")
	public String insertRooms(Room r, HttpSession session, Model model) {
		Member me = (Member)session.getAttribute("m");
		r.setMemberId(me.getMemberId());
		int result = service.insertRooms(r);
		if(result > 0) {
			return "redirect:/roomManage.do?houseNo="+r.getHouseNo();
		}else {
			model.addAttribute("title","실패");
			model.addAttribute("msg","알 수 없는 이유로 인해 객실 등록이 실패했습니다.");
			model.addAttribute("icon","error");
			model.addAttribute("loc","/roomManage.do?houseNo="+r.getHouseNo());
			return "common/msg";
		}
	}



// 기존 객실의 이름을 변경하기 전에 중복 검사. roomTitle과 roomName을 WHERE 조건으로 Room 테이블에서 조회 후 count를 반환
	@ResponseBody
	@RequestMapping(value="/checkRoomNewName.do")
	public String checkRoomNewName(String roomTitle, String roomName) {
		int result = service.checkRoomNewName(roomTitle, roomName);
		return String.valueOf(result);
	}


// 기존 객실의 이름을 변경하는 함수. Room 테이블에서 update
	@RequestMapping(value="/renameRoom.do")
	public String renameRoom(int houseNo, int roomNo, String roomNewName, String roomNewDescription, Model model) {
		Room r = new Room();
		r.setRoomNo(roomNo);
		r.setRoomName(roomNewName);
		r.setRoomDescription(roomNewDescription);
		int result = service.updateRoomName(r);
		if(result > 0) {
			return "redirect:/roomManage.do?houseNo="+houseNo;
		}else {
			model.addAttribute("title","실패");
			model.addAttribute("msg","알 수 없는 이유로 인해 객실 이름 변경이 실패했습니다.");
			model.addAttribute("icon","error");
			model.addAttribute("loc","/roomManage.do?houseNo="+houseNo);
			return "common/msg";
		}
	}



// 모든 객실들의 활성 상태값을 일괄적으로 변경
	@RequestMapping(value="/updateRoomEnable.do")
	public String updateRoomEnable(int houseNo, String roomNo, String roomEnable, Model model) {
		int result = service.updateRoomEnable(roomNo, roomEnable);
		if(result > 0) {
			return "redirect:/roomManage.do?houseNo="+houseNo;
		}else {
			model.addAttribute("title","실패");
			model.addAttribute("msg","알 수 없는 이유로 인해 객실 상태 변경이 실패했습니다.");
			model.addAttribute("icon","error");
			model.addAttribute("loc","/roomManage.do?houseNo="+houseNo);
			return "common/msg";
		}
	}



// 하나의 숙박 상품에 대한 객실들 조회.  숙박 상품이 갖고 있는 roomTitle과 roomCapa를 WHERE 조건으로 가져와서 Room 테이블에서 Row 여러개 조회 후 반환
	@ResponseBody
	@RequestMapping(value="/availableRooms.do", produces = "application/json;charset=utf-8")
	public String availableRooms(String roomTitle, int roomCapa) {
		FindRoomByCondition condition = new FindRoomByCondition();
		condition.setRoomTitle(roomTitle);
		condition.setRoomCapa(roomCapa);
		ArrayList<Room> list = service.selectAllAvailableRoom(condition);
		return new Gson().toJson(list);
	}

// 하나의 숙박 상품에 대한 객실들 조회.  숙박 상품이 갖고 있는 roomTitle과 roomCapa를 WHERE 조건으로 가져와서 Room 테이블에서 Row 여러개 조회 후 반환
	@ResponseBody
	@RequestMapping(value="/availableModalRooms.do", produces = "application/json;charset=utf-8")
	public String availableModalRooms(String roomTitle, int roomCapa) {
		FindRoomByCondition condition = new FindRoomByCondition();
		condition.setRoomTitle(roomTitle);
		condition.setRoomCapa(roomCapa);
		ArrayList<Room> list = service.selectAllAvailableRoom(condition);
		return new Gson().toJson(list);
	}
	
	
//모달용으로 복사, 예약이 없는(예약테이블에는 있어도 결제완료는 되어있지 않은 방들)을 조회
	@ResponseBody
	@RequestMapping(value="/availableModalRoomsList.do", produces = "application/json;charset=utf-8")
	public String availableModalRoomsList(House h) {
		ArrayList<House> list = service.selectAllAvailableRoomList(h);
		System.out.println("모달룸 리스트 테스트 : "+list.size());
		return new Gson().toJson(list);
	}



// 객실 이름들 중복 여부 조회. roomTitle을 WHERE 조건으로 Room 테이블에서 Row 0개 이상 조회 후 반환
	@ResponseBody
	@RequestMapping(value="/checkRoomName.do", produces = "application/json;charset=utf-8")
	public String checkRoomNameInSameRoomTitle(@RequestParam(value="roomNames[]") String[] roomNames, String roomTitle) {
		FindRoomByCondition condition = new FindRoomByCondition();
		condition.setRoomTitle(roomTitle);
		condition.setRoomNames(roomNames);
		ArrayList<String> list = service.checkRoomNameInSameRoomTitle(condition);
		return new Gson().toJson(list);
	}



// 하나의 객실에 대한 예약 내역(결제 완료 상태) 조회.    ROOM_BOOK 테이블에서 Row 여러개 조회 후 반환
	@ResponseBody
	@RequestMapping(value="/bookOneRoom.do")
	public String bookOneRoom(int roomNo) {
		ArrayList<RoomBook> list = service.selectAllBook(roomNo);
		return new Gson().toJson(list);
	}



// 메인 메뉴 > 숙박 상품들 보기.  House 테이블에서 Row 여러 개 조회 후 반환
	@RequestMapping(value="/selectHousesByCondition.do")
	public String selectHousePage(int reqPage, HouseListing condition, Model model) {
		if(condition.getHouseCity() != null) {
			if(condition.getHouseCity().equals("") || condition.getHouseCity().equals("- 광역시/도 -")) {
			condition.setHouseCity(null);
			}
		}
		if(condition.getHouseTitle() != null) {
			condition.setHouseTitle(condition.getHouseTitle().trim().replaceAll("(\\s)\\1+","$1"));
			condition.setHtKeywords(condition.getHouseTitle().split(" "));
		}
		if(condition.getRoomTitle() != null) {
			condition.setRoomTitle(condition.getRoomTitle().trim().replaceAll("(\\s)\\1+","$1"));
			condition.setRtKeywords(condition.getRoomTitle().split(" "));
		}
		HousePagination hp = service.selectHousePage(condition, reqPage);
		model.addAttribute("list", hp.getList());
		model.addAttribute("totalCount", hp.getTotalCount());
		model.addAttribute("pageNavi", hp.getPageNavi());
		model.addAttribute("condition", condition);
		return "product/houseList";
	}



//네이버지도 api 마커를 위한 경도,위도 조회.
	@ResponseBody
	@RequestMapping(value="/allAddress.do" , produces = "application/json;charset=utf-8")
	public String selectAllAddress() {
		ArrayList<House> list = service.selectAllAddress();
		System.out.println("리스트사이즈:"+list.size());
		Gson gson = new Gson();
		String result = gson.toJson(list);
		System.out.println("지도 호출"+result);
		return result;
	}
//숙소 리스트를 조회하는 것
	@ResponseBody
	@RequestMapping(value="/roomList.do", produces = "application/json;charset=utf-8")
	public String selectRoomList(House house) {
		System.out.println("housedata"+house);
		ArrayList<House> list = service.selectRoomList(house);
		Gson gson = new Gson();
		String result = gson.toJson(list);
		System.out.println("room result 결과"+result.length());
		return result;
		
	}

//roomBook insert
	@ResponseBody
	@RequestMapping(value="/roomBookInsert.do", produces = "application/json;charset=utf-8")
	public String roomBookInsert(RoomBook rb) {
		int result = service.roomBookInsert(rb);
		if(result>0) {
			String roomBookNo = Integer.toString(rb.getRoomBookNo());
			System.out.println("contoller"+roomBookNo);
			return roomBookNo;
		}else {
			return "kiosk/kiosk";
		}
	}
}
