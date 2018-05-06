package ro.lexit.app.validator.base;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import ro.lexit.app.dao.admin.DaoUtilizator;
import ro.lexit.common.dataFilters.admin.FUtilizator;
import ro.lexit.common.dataRecords.admin.Utilizator;
import ro.lexit.common.encryption.EncryptionUtils;
import ro.lexit.common.utils.DataQuery;
import ro.lexit.common.utils.IDataRecord;

@Controller
public class ValidatorLogin implements Validator {

	@Autowired private DaoUtilizator dao;
	
	@Override
	public boolean supports(Class<?> clazz){
		return Utilizator.class.isAssignableFrom(clazz);
	}

	public void validate(Object target, Errors errors) {
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "username", null, "Username nu poate fi vid");
		//ValidationUtils.rejectIfEmptyOrWhitespace(errors, "parola", null, "Parola nu poate fi vida");
		if (errors.hasErrors()) { return; }
		
		Utilizator utilizator = (Utilizator) target;
		FUtilizator filter = new FUtilizator().setUsername(utilizator.getUsername());
		DataQuery qry = new DataQuery().setFilter(filter);
		List<IDataRecord> list = dao.readList(qry);
		if (list.isEmpty()) {
			errors.rejectValue("username", null, "Nu exista utilizatorul [ " + utilizator.getUsername() + " ]");
			return; 
		}
		Utilizator dbUser = (Utilizator) list.get(0);
		String dbPass = dbUser.getParola();
		String pass = EncryptionUtils.encrypt(utilizator.getParola());
		
		if (! pass.equals(dbPass)) {
			errors.rejectValue("parola", null, "Parola incorecta");
		}
	}
}