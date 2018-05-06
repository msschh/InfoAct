package ro.lexit.app.validator.filmInd;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import ro.lexit.app.dao.filmInd.DaoActor;
import ro.lexit.common.dataFilters.filmInd.FActor;
import ro.lexit.common.dataRecords.filmInd.Actor;
import ro.lexit.common.utils.DataQuery;
import ro.lexit.common.utils.IDataRecord;

@Controller
public class ValidatorActor implements Validator {

	@Autowired private DaoActor dao;
	
	@Override
	public boolean supports(Class<?> clazz){
		return Actor.class.isAssignableFrom(clazz);
	}

	public void validate(Object target, Errors errors) {
		
		Actor actor = (Actor) target;
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "nume", null, "Numele nu poate fi vid");
		if (actor.getDescriere().length() > 2000) {
			errors.rejectValue("descriere", null, "Descrierea nu poate avea mai mult de 2000 caractere");
		}
		if (errors.hasErrors()) { return; }
		validateByNume(actor, errors);
	}
	
	private void validateByNume(Actor actor, Errors errors) {
		String errMsg = "Există deja un actor cu numele [" + actor.getNume() + "]";
		FActor filter = new FActor().setNume(actor.getNume());
		DataQuery qry = new DataQuery().setFilter(filter);
		List<IDataRecord> list = dao.readList(qry);
		if (list.isEmpty()) { return; }
		if (actor.isNew()) {
			errors.rejectValue("nume", null, errMsg);
			return;
		} 
		Actor a = (Actor) list.get(0);
		if (a.getId().equals(actor.getId())) { return; }
		errors.rejectValue("nume", null, errMsg);
	}

}
