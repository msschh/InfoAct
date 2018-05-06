package ro.lexit.app.validator.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import ro.lexit.app.dao.admin.DaoRol;
import ro.lexit.common.dataFilters.admin.FRol;
import ro.lexit.common.dataRecords.admin.Rol;
import ro.lexit.common.utils.DataQuery;
import ro.lexit.common.utils.IDataRecord;

@Controller
public class ValidatorRol implements Validator {

	@Autowired private DaoRol dao;
	
	@Override
	public boolean supports(Class<?> clazz){
		return Rol.class.isAssignableFrom(clazz);
	}

	public void validate(Object target, Errors errors) {
		
		Rol rol = (Rol) target;
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "cod", null, "Codul nu poate fi vid");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "nume", null, "Numele nu poate fi vid");
		if (errors.hasErrors()) { return; }
		validateByCod(rol, errors);
	}
	
	private void validateByCod(Rol rol, Errors errors) {
		String errMsg = "Există deja un rol cu codul [" + rol.getCod() + "]";
		FRol filter = new FRol().setCod(rol.getCod());
		DataQuery qry = new DataQuery().setFilter(filter);
		List<IDataRecord> list = dao.readList(qry);
		if (list.isEmpty()) { return; }
		if (rol.isNew()) {
			errors.rejectValue("cod", null, errMsg);
			return;
		} 
		Rol a = (Rol) list.get(0);
		if (a.getId().equals(rol.getId())) { return; }
		errors.rejectValue("cod", null, errMsg);
	}
}