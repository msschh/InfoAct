package ro.lexit.web.util.base;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;

import ro.lexit.app.dao.base.DaoAtasament;
import ro.lexit.common.dataFilters.base.FAtasament;
import ro.lexit.common.dataRecords.base.Atasament;
import ro.lexit.common.dataRecords.base.Document;
import ro.lexit.common.utils.DataQuery;
import ro.lexit.common.utils.IDataRecord;

@Component
public class UtilDocument {
	
	//@Autowired private DaoComentariu daoComentariu;
	@Autowired private DaoAtasament daoAtasament;
	
	public void addForView(Model model, Document document) {
		
		//List<IDataRecord> comentarii = daoComentariu.readList(new DataQuery(new FComentariu(document)));
		List<IDataRecord> atasamente = daoAtasament.readList(new DataQuery( new FAtasament(document)));
        /* griduri copil */
		model
			//.addAttribute("comentarii", comentarii)
			.addAttribute("atasamente", atasamente)
			;
		
		/* ddl-uri in modale */
		List<IDataRecord> listAtasament =  daoAtasament.readList(new DataQuery(new FAtasament()));
		
		model
			.addAttribute("listAtasament", listAtasament)
			;	
		
		/* form add new atasament */
		model .addAttribute("atasament", new Atasament());	
	}

}
