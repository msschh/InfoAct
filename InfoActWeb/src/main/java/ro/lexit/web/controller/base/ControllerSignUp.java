package ro.lexit.web.controller.base;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ro.lexit.app.dao.admin.DaoUtilizator;
import ro.lexit.app.service.admin.ServiceUtilizator;
import ro.lexit.app.validator.admin.ValidatorUtilizator;
import ro.lexit.common.dataRecords.admin.Utilizator;
import ro.lexit.common.encryption.EncryptionUtils;

@Controller
public class ControllerSignUp {

	private String viewname="base/signUp";
	
	@Autowired private ValidatorUtilizator validator;
	@Autowired private DaoUtilizator dao;
	@Autowired private ServiceUtilizator service;
	
	@RequestMapping(value = "/signUp", method = RequestMethod.GET)
	private String signUp(Model model) {
		Utilizator utilizator = new Utilizator();
		model
			.addAttribute("screenTitle", "Inregistrare")
			.addAttribute("record", utilizator);
		return viewname;
	}
	
	@RequestMapping(value = "/signUp", method = RequestMethod.POST)
	private String signUpPost(@ModelAttribute("record") Utilizator utilizator, BindingResult result, Model model) {
		validator.validateSignUp(utilizator, result);
		if (result.hasErrors()) {
			model
				.addAttribute("screenTitle", "Inregistrare")
				.addAttribute("record", utilizator);
			return viewname;
		}
	    String passEnc = EncryptionUtils.encrypt(utilizator.getParola());
	    utilizator.setParola(passEnc);
	    service.create(utilizator);
	    dao.createRoluri(utilizator.getId(), 3);
		model
			.addAttribute("screenTitle", "Login")
			.addAttribute("record", utilizator);
		return "redirect:login";
	}

}
