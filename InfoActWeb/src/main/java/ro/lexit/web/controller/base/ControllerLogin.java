package ro.lexit.web.controller.base;

import java.io.IOException;
import java.text.ParseException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.BeansException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ro.lexit.app.service.admin.ServiceUtilizator;
import ro.lexit.app.validator.base.ValidatorLogin;
import ro.lexit.common.dataRecords.admin.Utilizator;
import ro.lexit.web.util.admin.UtilSesiune;

@Controller
public class ControllerLogin {

	private String viewname="base/login";
	
	@Autowired private ValidatorLogin validator;
	@Autowired private ServiceUtilizator serviceSecurity;
	@Autowired private UtilSesiune utilSesiune;
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	private String login(Model model) {
		Utilizator utilizator = new Utilizator();
		model
			.addAttribute("screenTitle", "Login")
			.addAttribute("record", utilizator);
		return viewname;
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	private String loginPost(
			@ModelAttribute("record") Utilizator utilizator, BindingResult result, 
			HttpSession session, Model model, HttpServletRequest request) throws ParseException {
		
		/*
		 * autentificare
		 */
		validator.validate(utilizator, result);
		if (result.hasErrors()) {
			model
				.addAttribute("screenTitle", "Login")
				.addAttribute("record", utilizator);
			return viewname;
		}
		
		/*
		 * initializare
		 */
		Utilizator dbUser = serviceSecurity.decorate(utilizator.getUsername());
		utilSesiune.initSesiune(request, session, dbUser);
		
		/*
		 * return
		 */
		return "redirect:home";
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	private String logout(HttpSession session) throws BeansException, IOException{
		session.invalidate();
		return "redirect:login";	
	}
}
