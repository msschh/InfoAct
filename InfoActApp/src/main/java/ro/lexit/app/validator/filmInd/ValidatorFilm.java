package ro.lexit.app.validator.filmInd;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import ro.lexit.app.dao.filmInd.DaoFilm;
import ro.lexit.common.dataFilters.filmInd.FFilm;
import ro.lexit.common.dataRecords.filmInd.Film;
import ro.lexit.common.utils.DataQuery;
import ro.lexit.common.utils.IDataRecord;

@Controller
public class ValidatorFilm implements Validator {

	@Autowired private DaoFilm dao;
	
	@Override
	public boolean supports(Class<?> clazz){
		return Film.class.isAssignableFrom(clazz);
	}

	public void validate(Object target, Errors errors) {
		
		Film film = (Film) target;
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "nume", null, "Titlul nu poate fi vid");
		if (film.getDescriere().length() > 2000) {
			errors.rejectValue("descriere", null, "Descrierea nu poate avea mai mult de 2000 caractere");
		}
		if (errors.hasErrors()) { return; }
		validateByNume(film, errors);
	}
	
	private void validateByNume(Film film, Errors errors) {
		String errMsg = "Există deja un film cu titlul [" + film.getNume() + "]";
		FFilm filter = new FFilm().setNume(film.getNume());
		DataQuery qry = new DataQuery().setFilter(filter);
		List<IDataRecord> list = dao.readList(qry);
		if (list.isEmpty()) { return; }
		if (film.isNew()) {
			errors.rejectValue("nume", null, errMsg);
			return;
		} 
		Film a = (Film) list.get(0);
		if (a.getId().equals(film.getId())) { return; }
		errors.rejectValue("nume", null, errMsg);
	}
}