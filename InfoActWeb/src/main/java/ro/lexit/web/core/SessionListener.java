package ro.lexit.web.core;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Component;
import org.springframework.web.context.support.WebApplicationContextUtils;

@Component
public class SessionListener implements HttpSessionListener {
	
	@Override
	public void sessionCreated(HttpSessionEvent sessionEvent) {
		HttpSession session = sessionEvent.getSession();
		ApplicationContext ctx = WebApplicationContextUtils.getWebApplicationContext(session.getServletContext());
		AppInfo appInfo = (AppInfo) ctx.getBean("appInfo");	
		session.setAttribute("appInfo", appInfo);
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent sessionEvent) {
		// do nothing
	}

         

}
