package kr.co.aop;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.carpool.model.service.CarpoolService;
import kr.co.carpool.model.vo.Carpool;

@Component
public class CarpoolSchedule {
	@Autowired
	private CarpoolService carpoolService;
	
	// 0 0 0 * * * : 매일 0시 0분 0초에 한번동작함, 트래픽이 없는 시간에 서버가 돌게해서 업데이트 해주는것
	// 발표일에는 임의로 시간을 바꿔서 그 시간에 업데이트 되는것을 보여주는 것. 5/2일 자료들로.
	@Scheduled(cron="0 0 0 * * *")
	public void expireCarpool() {
		//날짜가 만료된 카풀은 운전자가 마이페이지에서 '마감'누른것과 같은 효과가 생기게 한다.
		//스케쥴러는 매개변수를 넣지 않는다. 
		int result = carpoolService.updateClosure();
		if(result>0) {
			System.out.println("스케쥴러 성공 :"+result+"개");
		}else {
			System.out.println("스케쥴러 갯수:"+result+"개");
		}
	}
}

/*
cron 
초      분      시        일      월       요일      [년도] 
x    x    x    x    x     x     x 
second : 0~59, *, -, / 
min : 0~59, *, -, / 
hour : 0~59, *, -, /
day of month : 1~31,*,-,/,?,L, W
month : 1~12 or JAN~DEC,-,*,/
day of week : 1~7 or SUN-SAT, ?, L, -, *
year : 1970 ~ 2099, -, *, /

? : 해당항목 사용안함(월, 요일에만 사용 가능)
L : 마지막 날(날짜 : 해당 월의 마지막날(1/31, 2/28, 3/31, 4/30)
L : 요일에 사용한 경우(토요일)
W : 가장 가까운 평일
-> 15W 
	ex) 15일이 토요일인 경우 : 14일
	ex) 15일이 일요일인경우 : 16일
LW : 그달 마지막평일에 동작(월 결산 필요한 경우)	
 
 
* * * * * * : 1초에 1번 동작해라 
10 * * * * * : 1분에 1번동작(매 분 10초) 
15 * * * * * : 매분15초마다 동작(1분에 1번)
20 10 * * * * : 매시간 10분 20초마다 동작(1시간에 한번)
20 10 12 * * *  : 매일 12시 10분 20초마다 동작(1일에 한번)
20-23 * * * * * : 매분 20, 21, 22, 23 초마다 동작(1분에 4번)
0/15 * * * * * : 매분 0초에서 시작해서 15초마다 반복
0 0 0 * * * : 매일 0시 0분 0초에 한번동작(DB조회 생일쿠폰 자동 insert)
*/
