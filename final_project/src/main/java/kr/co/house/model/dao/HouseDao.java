package kr.co.house.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.house.model.vo.FindRoomByCondition;
import kr.co.house.model.vo.House;
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



// 하나의 숙박 상품에 대한 객실들 조회.  숙박 상품이 갖고 있는 roomTitle과 roomCapa를 WHERE 조건으로 가져와서 Room 테이블에서 Row 여러개 조회 후 반환
	public ArrayList<Room> selectAllAvailableRoom(FindRoomByCondition condition) {
		List list = sqlSession.selectList("r.selectAllAvailableRoom", condition);
		return (ArrayList<Room>)list;
	}



// 하나의 객실에 대한 예약 내역(결제 완료 상태) 조회.    ROOM_BOOK 테이블에서 Row 여러개 조회 후 반환
	public ArrayList<RoomBook> selectAllBook(int roomNo){
		List list = sqlSession.selectList("rb.selectAllBook", roomNo);
		return (ArrayList<RoomBook>)list;
	}
}
