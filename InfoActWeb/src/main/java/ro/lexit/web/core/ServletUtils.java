package ro.lexit.web.core;

import java.io.Serializable;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Component;
import org.springframework.web.context.ServletContextAware;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

@Component
public class ServletUtils implements ServletContextAware, ApplicationContextAware, Serializable {
	
	private static final long serialVersionUID = -1502608181348401699L;
	private ServletContext servletContext;
	private ApplicationContext applicationContext;
	
	public HttpSession getSession() {
		ServletRequestAttributes attr = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
		HttpServletRequest request = attr.getRequest();
		HttpSession session = request.getSession();
		return session;
	}

	public HttpServletRequest getServletRequest() {
		ServletRequestAttributes attr = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
		HttpServletRequest request = attr.getRequest();
		return request;
	}
	
	public String getBaseUrl () {
		ServletRequestAttributes attr = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
		HttpServletRequest request = attr.getRequest();
		String serverName = request.getServerName();
		int serverPort = request.getServerPort();
		String contextPath = request.getContextPath();
		String url = "http://{serverName}{serverPort}{contextPath}"; 
		url = url.replace("{serverName}", serverName);
		url = url.replace("{contextPath}", contextPath);
		String serverPortString = (serverPort == 80 ? "" : ":" + serverPort);
		url = url.replace("{serverPort}", serverPortString);		
		return url;		
	}	
	
	@Override
	public void setServletContext(ServletContext servletContext) { this.servletContext = servletContext; }
	public ServletContext getServletContext() { return this.servletContext; }

	@Override
	public void setApplicationContext(ApplicationContext applicationContext) throws BeansException { this.applicationContext = applicationContext; }	
	public ApplicationContext getApplicationContext() { return this.applicationContext; }
	
	public String getOs(HttpServletRequest request){
		String  userAgent = request.getHeader("User-Agent");
		String os = "";
		 if (userAgent.toLowerCase().indexOf("windows") >= 0 )
		 {
		     os = "Windows";
		 } else if(userAgent.toLowerCase().indexOf("mac") >= 0)
		 {
		     os = "Mac";
		 } else if(userAgent.toLowerCase().indexOf("x11") >= 0)
		 {
		     os = "Unix";
		 } else if(userAgent.toLowerCase().indexOf("android") >= 0)
		 {
		     os = "Android";
		 } else if(userAgent.toLowerCase().indexOf("iphone") >= 0)
		 {
		     os = "IPhone";
		 }else{
		     os = "UnKnown, More-Info: "+userAgent;
		 }
		 return os;
	}
	
	public String getBrowser(HttpServletRequest request){
		String  userAgent = request.getHeader("User-Agent");
		String  user = userAgent.toLowerCase();
		String browser = "";
		if (user.contains("msie")) {
			//String substring = userAgent.substring(userAgent.indexOf("MSIE")).split(";")[0];
			browser = "Internet Explorer";
		} else if (user.contains("safari") && user.contains("version")) {
			browser = "Safari";
		} else if (user.contains("opr") || user.contains("opera")) {
			if (user.contains("opera"))
				browser = "Opera";
			else if (user.contains("opr"))
				browser = "Opera";
		} else if (user.contains("chrome")) {
			browser = "Chrome";
		} else if ((user.indexOf("mozilla/7.0") > -1) || (user.indexOf("netscape6") != -1)
				|| (user.indexOf("mozilla/4.7") != -1) || (user.indexOf("mozilla/4.78") != -1)
				|| (user.indexOf("mozilla/4.08") != -1) || (user.indexOf("mozilla/3") != -1)) {
			browser = "Netscape";

		} else if (user.contains("firefox")) {
			browser = "Firefox";
		} else if (user.contains("rv")) {
			browser = "Internet Explorer";
		} else {
			browser = "UnKnown, More-Info: " + userAgent;
		}
		return browser;
	}

	public String getIp(HttpServletRequest request){
		return request.getRemoteAddr();
	}

}
