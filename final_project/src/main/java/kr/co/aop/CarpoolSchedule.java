package kr.co.aop;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import kr.co.carpool.model.service.CarpoolService;
import kr.co.carpool.model.vo.Carpool;

public class CarpoolSchedule {
	private CarpoolService carpoolService;
	
	public void expireCarpool() {
		//날짜가 만료된 카풀은 운전자가 마이페이지에서 '마감'누른것과 같은 효과가 생기게 한다.
		
	}
}
