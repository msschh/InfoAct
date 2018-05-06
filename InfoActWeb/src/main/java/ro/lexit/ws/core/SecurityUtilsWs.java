package ro.lexit.ws.core;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;

import ro.lexit.common.dataRecords.admin.Drept;
import ro.lexit.common.dataRecords.admin.Utilizator;
import ro.lexit.web.exceptions.EroareAutorizare;

@Controller
public class SecurityUtilsWs {

	public boolean isAuthenticated(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		return (session.getAttribute("utilizator") != null);
	}

	public Utilizator getCurrentUser(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		if (!isAuthenticated(request)) {
			return null;
		}
		Utilizator utilizator = (Utilizator) session.getAttribute("utilizator");
		return utilizator;
	}

	public void authorize(HttpServletRequest request, String entityCode, String method) throws EroareAutorizare {
		if (hasRights(request, entityCode, method)) { return; }
		EroareAutorizare ex = new EroareAutorizare(entityCode, method);
		throw (ex);
	}

	public boolean hasRight(HttpServletRequest request, String entityCode, String method) {
		Utilizator utilizator = getCurrentUser(request);
		if (utilizator == null) {
			return false;
		}
		for (Drept drept : utilizator.drepturi) {
			if (drept.getEntitate().equalsIgnoreCase(entityCode) && drept.getCod().equalsIgnoreCase(method)) {
				return true;
			}
		}
		return false;
	}

	public boolean hasRights(HttpServletRequest request, String entityCode, String methods) {
		String[] methodArray = methods.split(",");
		for (String method : methodArray) {
			String m = method.trim();
			if (hasRight(request, entityCode, m)) {
				return true;
			}
		}
		return false;
	}
	
}
