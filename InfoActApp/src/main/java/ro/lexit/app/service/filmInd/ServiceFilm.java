package ro.lexit.app.service.filmInd;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ro.lexit.app.dao.base.DaoDocument;
import ro.lexit.app.dao.filmInd.DaoFilm;
import ro.lexit.common.dataRecords.base.Document;
import ro.lexit.common.dataRecords.filmInd.Film;

@Service
public class ServiceFilm {

	@Autowired private DaoFilm daoFilm;
	@Autowired private DaoDocument daoDocument;
	
	public void create(Film film) {
		Document document = new Document().setTip("ACT");
		daoDocument.create(document);
		film.setDocument(document);
		daoFilm.create(film);
	}
	
	public void delete(Integer id) {
		Film actor = (Film) daoFilm.read(id);
		daoDocument.delete(actor.getDocument().getId());
		daoFilm.delete(id);
	}
}