package ro.lexit.web.util.admin;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import ro.lexit.common.dataRecords.admin.Sesiune;
import ro.lexit.common.dataRecords.admin.Utilizator;
import ro.lexit.web.core.ServletUtils;

@Component
public class UtilSesiune {

	//@Autowired private DaoSesiune daoSesiune;	
	@Autowired private ServletUtils servletUtils;
	
	public Sesiune initSesiune(HttpServletRequest request, HttpSession session, Utilizator utilizator) {
		session.setAttribute("utilizator", utilizator);		
		Sesiune sesiune = new Sesiune();
		sesiune.setBrowser(servletUtils.getBrowser(request));
		sesiune.setOs(servletUtils.getOs(request));
		sesiune.setIp(servletUtils.getIp(request));
		sesiune.setDtAccesare(new Date());
		sesiune.setUtilizator(utilizator);
		//daoSesiune.create(sesiune);		
		session.setAttribute("idSesiune", sesiune.getId());
		return sesiune;
	}

}
