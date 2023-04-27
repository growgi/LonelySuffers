package kr.co.house.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.house.model.vo.FindRoomByCondition;
import kr.co.house.model.vo.House;
import kr.co.house.model.vo.HouseListing;
import kr.co.house.model.vo.Room;
import kr.co.house.model.vo.RoomBook;

@Repository
public class HouseDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;


// 숙박 상품 상세페이지 보기.  House 테이블에서 Row 1개 전체 조회 후 반환
	public House selectOneHouse(int houseNo) {
		return sqlSession.selectOne("h.selectOneHouse", houseNo);
	}



// 숙박 상품 등록.  House 테이블에 Row 1개 추가
	public int insertHouse(House h) {
		return sqlSession.insert("h.insertHouse", h);
	}



// 상품 등록 후 숙박 상품 사진들 업로드
	public int uploadHousePhotos(House h) {
		return sqlSession.update("h.uploadHousePhotos", h);
	}



// 숙박 상품 수정.  House 테이블에서 Row 1개 수정
	public int updateHouse(House h) {
		return sqlSession.update("h.updateHouse", h);
	}



// 객실 등록.  Room 테이블에 Row 1개 추가
	public int insertRoom(Room r) {
		return sqlSession.insert("r.insertRoom", r);
	}



// 기존 객실의 이름을 변경하기 전에 중복 검사. roomTitle과 roomName을 WHERE 조건으로 Room 테이블에서 조회 후 count를 반환
	public int checkRoomNewName(Room r) {
		return sqlSession.selectOne("r.checkRoomNewName", r);
	}


// 기존 객실의 이름을 변경하는 함수. Room 테이블에서 update
	public int updateRoomName(Room r) {
		return sqlSession.update("r.updateRoomName", r);
	}



// 객실의 활성 상태값을 변경
	public int updateRoomEnable(Room r) {
		return sqlSession.update("r.updateRoomEnable", r);
	}



// 하나의 숙박 상품에 대한 객실들 조회.  숙박 상품이 갖고 있는 roomTitle과 roomCapa를 WHERE 조건으로 가져와서 Room 테이블에서 Row 여러개 조회 후 반환
	public ArrayList<Room> selectAllAvailableRoom(FindRoomByCondition condition) {
		List list = sqlSession.selectList("r.selectAllAvailableRoom", condition);
		return (ArrayList<Room>)list;
	}



//모달용으로 복사, 예약이 없는(예약테이블에는 있어도 결제완료는 되어있지 않은 방들)을 조회	
	public ArrayList<House> selectAllAvailableRoomList(House h) {
		System.out.println(h);
		List list = sqlSession.selectList("h.selectAllAvailableRoomList", h);
		return (ArrayList<House>)list;
	}



// 하나의 houseNo에 대한 모든 객실들을 조회. 사용 중지된 객실도 포함하여 Room 테이블에서 Row 여러개 조회 후 반환
	public ArrayList<Room> selectAllRoomsByHouseNo(int houseNo) {
		List list = sqlSession.selectList("r.selectAllRoomsByHouseNo", houseNo);
		return (ArrayList<Room>)list;
	}



// 객실 이름들 중복 여부 조회. roomTitle을 WHERE 조건으로 Room 테이블에서 Row 0개 이상 조회 후 반환
	public ArrayList<String> checkRoomNameInSameRoomTitle(FindRoomByCondition condition) {
		List list = sqlSession.selectList("r.checkRoomName", condition);
		return (ArrayList<String>)list;
	}


	
// 하나의 객실에 대한 예약 내역(결제 완료 상태) 조회.    ROOM_BOOK 테이블에서 Row 여러개 조회 후 반환
	public ArrayList<RoomBook> selectAllBook(int roomNo){
		List list = sqlSession.selectList("rb.selectAllBook", roomNo);
		return (ArrayList<RoomBook>)list;
	}


// 메인 메뉴 > 숙박 상품들 보기.  House 테이블에서 Row 여러 개 조회 후 반환
	public ArrayList<House> selectHousePage(HouseListing condition){
		List list = sqlSession.selectList("h.selectHousePage", condition);
		return(ArrayList<House>)list;
	}



// 조건에 맞는 판매중인 상품들의 총 개수
	public int totalNumberOfHouseByProduct(HouseListing condition) {
		return sqlSession.selectOne("h.totalNumberOfHouseByProduct", condition);
	}



// 모든 숙박 상품의 위치(위도, 경도)를 조회.    HOUSE 테이블에서 Row 여러개 조회 후 반환
	public ArrayList<House> selectAllAddress(){
		List list = sqlSession.selectList("h.selectAllAddress");
		return(ArrayList<House>)list;
	}



	public ArrayList<House> selectRoomList(House house) {
		//System.out.println(house);
		List list = sqlSession.selectList("h.selectRoomList", house);
		return(ArrayList<House>)list;
	}



	public int roomBookInsert(RoomBook rb) {
		
		return sqlSession.insert("rb.insertRoomBook",rb);
	}



}
