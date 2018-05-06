package ro.lexit.app.service.filmInd;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ro.lexit.app.dao.base.DaoDocument;
import ro.lexit.app.dao.filmInd.DaoActor;
import ro.lexit.common.dataRecords.base.Document;
import ro.lexit.common.dataRecords.filmInd.Actor;

@Service
public class ServiceActor {

	@Autowired private DaoActor daoActor;
	@Autowired private DaoDocument daoDocument;
	
	public void create(Actor actor) {
		Document document = new Document().setTip("ACT");
		daoDocument.create(document);
		actor.setDocument(document);
		daoActor.create(actor);
	}
	
	public void delete(Integer id) {
		Actor actor = (Actor) daoActor.read(id);
		daoDocument.delete(actor.getDocument().getId());
		daoActor.delete(id);
	}
}