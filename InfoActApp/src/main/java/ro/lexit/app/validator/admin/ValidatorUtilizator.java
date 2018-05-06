package ro.lexit.app.validator.admin;

import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import ro.lexit.app.dao.admin.DaoUtilizator;
import ro.lexit.common.dataFilters.admin.FUtilizator;
import ro.lexit.common.dataRecords.admin.Utilizator;
import ro.lexit.common.utils.DataQuery;
import ro.lexit.common.utils.IDataRecord;

@Controller
public class ValidatorUtilizator implements Validator{
	
	@Autowired private DaoUtilizator dao;

	@Override
	public boolean supports(Class<?> clazz) {
		return Utilizator.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "nume", null, "Numele nu poate fi vid");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "email", null, "Email-ul nu poate fi vid");
		Utilizator utilizator = (Utilizator) target;
        Pattern pattern = Pattern.compile("[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}");
        Matcher mat = pattern.matcher(utilizator.getEmail());
        if (! mat.matches()){
			errors.rejectValue("email", null, "Email-ul introdus nu este valid"); return; 
        }
	}
	
	public void validateSignUp(Object target, Errors errors) {
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "nume", null, "Numele nu poate fi vid");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "username", null, "Username-ul nu poate fi vid");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "parola", null, "Parola nu poate fi vida");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "email", null, "Email-ul nu poate fi vid");
		Utilizator utilizator = (Utilizator) target;
        Pattern pattern = Pattern.compile("[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}");
        Matcher mat = pattern.matcher(utilizator.getEmail());
        if (! mat.matches()){
			errors.rejectValue("email", null, "Email-ul introdus nu este valid"); return; 
        }
		if(errors.hasErrors()) { return; }
		validateByUsername(utilizator, errors);
		validateByEmail(utilizator, errors);
		validatePassLengths(utilizator, errors);
	}
	
	private void validateByUsername(Utilizator utilizator, Errors errors) {
		String errMsg = "Exista deja un utilizator cu username-ul [" + utilizator.getUsername() + "]";
		FUtilizator filter = new FUtilizator().setUsername(utilizator.getUsername());
		DataQuery qry = new DataQuery().setFilter(filter);
		List<IDataRecord> list = dao.readList(qry);
		if(list.isEmpty()) { return; }
		if(utilizator.isNew()) {
			errors.rejectValue("username", null, errMsg);
			return;
		}
		Utilizator u = (Utilizator) list.get(0);
		if(u.getId().equals(utilizator.getId())) {
			return; }
		errors.rejectValue("username", null, errMsg);
	}
	
	private void validateByEmail(Utilizator utilizator, Errors errors) {
		String errMsg = "Exista deja un utilizator cu email-ul [" + utilizator.getEmail() + "]";
		FUtilizator filter = new FUtilizator().setEmail(utilizator.getEmail());
		DataQuery qry = new DataQuery().setFilter(filter);
		List<IDataRecord> list = dao.readList(qry);
		if(list.isEmpty()) { return; }
		if(utilizator.isNew()) {
			errors.rejectValue("email", null, errMsg);
			return;
		}
		Utilizator u = (Utilizator) list.get(0);
		if(u.getId().equals(utilizator.getId())) {
			return; }
		errors.rejectValue("email", null, errMsg);
	}
	
	private void validatePassLengths(Utilizator utilizator, Errors errors) {
		String errMsgUsr = "Usernameul nu poate fi mai lung de 20 de caractere!";
		String errMsgPass = "Parola nu poate fi mai lunga de 20 de caractere!";
		if(utilizator.getUsername().length() > 20) {
			errors.rejectValue("username", null,  errMsgUsr);
			return;
		}
		if(utilizator.isNew() && (utilizator.getParola().length() > 20)) {
			errors.rejectValue("parola", null,  errMsgPass);
			return;
		}

	}

	
}
