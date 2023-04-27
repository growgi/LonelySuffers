package common;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.context.WebApplicationContext;

import kr.co.admin.model.service.AdminService;
import kr.co.admin.model.vo.Visitant;

public class SessionListener implements HttpSessionListener {
	@Autowired
	AdminService vService;

	public void sessionCreated(HttpSessionEvent arg0) {
		int todayCount = 0;
		int totalCount = 0;
		ArrayList<Visitant> weekCountList = new ArrayList<Visitant>();

		// 전체 방문자 수 +1
		try {
			vService.setVisitTotalCount();

			// 오늘 방문자 수
			todayCount = vService.getVisitTodayCount();

			// 전체 방문자 수
			totalCount = vService.getVisitTotalCount();

			// 일주일간 방문자 수
			weekCountList = vService.getVisitWeekCount();

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		HttpSession session = arg0.getSession();

		// 세션 속성에 담아준다.
		session.setAttribute("totalCount", totalCount); // 전체 방문자 수
		session.setAttribute("todayCount", todayCount); // 오늘 방문자 수
		session.setAttribute("weekCountList", weekCountList); // 일주일간 방문자 수
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent arg0) {
		// TODO Auto-generated method stub
	}
}
