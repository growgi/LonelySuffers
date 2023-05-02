package common;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.springframework.web.servlet.FrameworkServlet;

import kr.co.admin.model.service.AdminService;
import kr.co.admin.model.vo.Visitant;

public class SessionListener implements HttpSessionListener {
	AdminService service;

	public void sessionCreated(HttpSessionEvent arg0) {
		HttpSession session = arg0.getSession();
		
		//AdminService를 강제로 사용하기 위해 작성하는 코드
		//servlet-context.xml에 선언되어 있는 appServlet 사용 가능해짐
		 WebApplicationContext context 
		 = WebApplicationContextUtils.getWebApplicationContext(session.getServletContext(),
				 											FrameworkServlet.SERVLET_CONTEXT_PREFIX + "appServlet" ); 
		 service = context.getBean(AdminService.class);
		
		int todayCount = 0;
		int totalCount = 0;
		ArrayList<Visitant> weekCountList = new ArrayList<Visitant>();

		// 전체 방문자 수 +1
		try {
			service.setVisitTotalCount();

			// 오늘 방문자 수
			todayCount = service.getVisitTodayCount();
			//System.out.println(todayCount);

			// 전체 방문자 수
			totalCount = service.getVisitTotalCount();
			//System.out.println(totalCount);

			// 일주일간 방문자 수
			weekCountList = service.getVisitWeekCount();
			//System.out.println(weekCountList);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

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
