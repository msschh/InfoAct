package ro.lexit.web.core;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import ro.lexit.common.dataRecords.admin.Drept;
import ro.lexit.common.dataRecords.admin.Utilizator;
import ro.lexit.web.exceptions.EroareAutorizare;

@Controller
public class SecurityUtils {

	@Autowired private ServletUtils servletUtils;

	public boolean isAuthenticated() {
		HttpSession session = servletUtils.getSession();
		return (session.getAttribute("utilizator") != null);
	}

	public Utilizator getCurrentUser() {
		if (!isAuthenticated()) {
			return null;
		}
		Utilizator utilizator = (Utilizator) servletUtils.getSession().getAttribute("utilizator");
		return utilizator;
	}
	
	public Integer getIdSesiune() {
		if (!isAuthenticated()) {
			return null;
		}
		Integer idSesiune = (Integer) servletUtils.getSession().getAttribute("idSesiune");
		return idSesiune;
	}
	
	public void authorize(String entityCode, String method) throws EroareAutorizare {
		if (hasRights(entityCode, method)) { return; }
		EroareAutorizare ex = new EroareAutorizare(entityCode, method);
		throw (ex);
	}

	public boolean hasRight(String entityCode, String method) {
		Utilizator utilizator = getCurrentUser();
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

	public boolean hasRights(String entityCode, String methods) {
		String[] methodArray = methods.split(",");
		for (String method : methodArray) {
			String m = method.trim();
			if (hasRight(entityCode, m)) {
				return true;
			}
		}
		return false;
	}
}
