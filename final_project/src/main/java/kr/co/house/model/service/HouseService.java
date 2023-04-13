package kr.co.house.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.house.model.dao.HouseDao;
import kr.co.house.model.vo.FindRoomByCondition;
import kr.co.house.model.vo.House;
import kr.co.house.model.vo.Room;
import kr.co.house.model.vo.RoomBook;

@Service
public class HouseService {

	@Autowired
	private HouseDao dao;


// 숙박 상품 상세페이지 보기.  House 테이블에서 Row 1개 전체 조회 후 반환
	public House selectOneHouse(int houseNo) {
		return dao.selectOneHouse(houseNo);
	}


	@Transactional
// 숙박 상품 등록.  House 테이블에 Row 1개 추가
	public int insertHouse(House h) {
		return dao.insertHouse(h);
	}



// 상품 등록 후 숙박 상품 사진들 업로드
	public int uploadHousePhotos(House h) {
		return dao.uploadHousePhotos(h);
	}


	
// 하나의 숙박 상품에 대한 객실들 조회.  숙박 상품이 갖고 있는 roomTitle과 roomCapa를 WHERE 조건으로 가져와서 Room 테이블에서 Row 여러개 조회 후 반환
	public ArrayList<Room> selectAllAvailableRoom(FindRoomByCondition condition) {
		return dao.selectAllAvailableRoom(condition);
	}



// 하나의 객실에 대한 예약 내역(결제 완료 상태) 조회.    ROOM_BOOK 테이블에서 Row 여러개 조회 후 반환
	public ArrayList<RoomBook> selectAllBook(int roomNo){
		return dao.selectAllBook(roomNo);
	}
	
// 네이버지도 api 마커를 위한 경도,위도 조회.
	public ArrayList<House> selectAllAddress(){
		return dao.selectAllAddress();
	}



	public ArrayList<House> selectRoomList(House house) {
		return dao.selectRoomList(house);
	}
}
