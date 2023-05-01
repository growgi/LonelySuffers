package kr.co.carpool.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.carpool.model.dao.CarpoolDao;
import kr.co.carpool.model.vo.Carpool;
import kr.co.carpool.model.vo.CarpoolFilter;
import kr.co.carpool.model.vo.CarpoolMatch;
import kr.co.carpool.model.vo.Passenger;

@Service
public class CarpoolService {
	@Autowired
	private CarpoolDao dao;

	public ArrayList<Carpool> selectAllCarpool() {
		System.out.println("dao에서 카풀목록 조회결과"+dao.selectAllCarpool());
		return dao.selectAllCarpool();
	}

	public Carpool selectOneCarpool(int carpoolNo) {
		return dao.selectOneCarpool(carpoolNo);
		
	}

	public ArrayList<Carpool> filterCarpool(CarpoolFilter cf, int amount) {
		//System.out.println("controller에서 service로 넘겨준조건"+cf);
		int end = cf.getStart()+amount-1;
		cf.setEnd(end);
		//System.out.println("dao로부터 controller로 넘겨준 것 "+dao.filterCarpool(cf));
		return dao.filterCarpool(cf);
	}

	//카풀 신청하기(승객)
	@Transactional
	public int insertPassenger(CarpoolMatch match) {
		//select count(*) passenger where carpool_no=? and passengerNo=?
		//0이면 insert진행
		//1이면 이미 신청한 사람
		int result = dao.selectPassenger(match);
		if(result==0) {
			return dao.insertPassenger(match);
		}else {
			return -1;
		}
		
	}
	
	//운전자의 카풀 등록하기(controller에서는 registerCarpool)
	@Transactional
	public int insertCarpool(Carpool carpool) {
		return dao.insertCarpool(carpool);
	}
	
	//더보기 버튼 구현을 위한 카풀수 구하기
	public int totalCount(CarpoolFilter cf) {
		return dao.totalCount(cf);
	}
	//운전자의 마이페이지 
	public ArrayList<Carpool> getMyLists(int driverNo) {
		HashMap<String, Integer> param = new HashMap<String, Integer>();
		param.put("driverNo",driverNo);
		ArrayList<Carpool> clist = dao.getMyLists(param);
		for(int i=0; i<clist.size();i++) {
			for(int j=0; j<clist.get(i).getPassengerList().size();j++) {
				int matchStatus = clist.get(i).getPassengerList().get(j).getMatchStatus();
				if(matchStatus!=2) {
					clist.get(i).getPassengerList().get(j).setPassengerEmail("***********");
					clist.get(i).getPassengerList().get(j).setPassengerPhone("***********");
				}
			}
		}
		return clist;
	}
	// 운전자페이지 : matchNo로 카풀 수락, 거절 
	// 1명 남았을 때 수락을 하면 '마감', '삭제' 버튼 사라지고 '정원이 다 찼습니다' 메세지가 뜨면서 다른 신청자 칸에 있는 '수락', '거절' 버튼이 사라진다. 
	@Transactional
	public int updateDriverDecision(Passenger passenger) {
		int result = dao.updateDriverDecision(passenger);
		if(result > 0 && passenger.getMatchStatus() == 2) {
			//0. 카풀 번호 조회
			int searchCarpoolNo = dao.selectCarpoolNo(passenger);
			//1. 현재 수락된 인원 조회
			int reserved = dao.selectReserved(searchCarpoolNo);
			//2. 해당태워드려요 최대인원조회
			int capacity = dao.selectCapacity(searchCarpoolNo);
			//1 == 2 조회결과 같으면 마감처리(update)
			if(reserved==capacity) {
				//카풀 마감으로 처리
				result += dao.updateClosureto1(searchCarpoolNo);
				//result += dao.마감 , 자동으로 나머지 신청자들은 match_status 1로 변한다(거절)
				result += dao.updateMatchStatus(searchCarpoolNo);
			}
		}
		return result;
	}
	
	
	// 운전자페이지 : carpoolNo로 카풀 마감, 취소(아예삭제)
	@Transactional
	public int updateDriverClosing(Carpool carpool) {
		return dao.updateDriverClosing(carpool);
	}
	//탑승자의 마이페이지(운전자의 마이페이지에서 Carpool VO에 있는 passengerList를 
	//HashMap으로 받아오기 때문에 여기서 운전자마이페이지의 getMyLists를 다시 활용한다.
	public ArrayList<Carpool> getMyRequests(int memberNo) {
		System.out.println("getMyRequest의 memberNo: "+memberNo);
		//반환한 값을 꺼내주는데, carpoolNo와 memberNo 두개를 받아와야하니까 HashMap 쓴다.
		HashMap<String, Integer> param = new HashMap<String, Integer>();
		param.put("memberNo", memberNo);
		//카풀 리스트로 값 반환해주고~
		ArrayList<Carpool> list = dao.selectPassengerList(param);
		
		for(Carpool c : list) {
			param.put("carpoolNo", c.getCarpoolNo());
			ArrayList<Passenger> passengerList = dao.selectPassengerOne(param);
			c.setPassengerList(passengerList);
		}
		//HashMap으로 받아온다.
		return list;
	}
	//날짜 지나면 만료되는 것 
	public int updateClosure() {
		return dao.updateClosure();
	}

	public Passenger selectOnePassenger(int matchNo) {
		return dao.selectPassenger(matchNo);
	}
	
	





}
