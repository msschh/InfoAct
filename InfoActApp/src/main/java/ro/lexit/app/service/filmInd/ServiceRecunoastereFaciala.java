package ro.lexit.app.service.filmInd;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ro.lexit.app.dao.filmInd.DaoActor;
import ro.lexit.common.dataFilters.filmInd.FActor;
import ro.lexit.common.dataRecords.filmInd.Actor;
import ro.lexit.common.utils.DataQuery;
import ro.lexit.common.utils.IDataRecord;

@Service
public class ServiceRecunoastereFaciala {

	@Autowired private DaoActor daoActor;

	public Actor recunoasteActor(String img) {
		try {
			String command = "cmd.exe /c python demo1.py test.jpg";
			Process proc = Runtime.getRuntime().exec(command);
			BufferedReader reader = new BufferedReader(new InputStreamReader(proc.getInputStream()));
			String line = reader.readLine();
	        proc.waitFor();
	        List<IDataRecord> list = daoActor.readList(new DataQuery(new FActor().setNume(line)));
	        if (list.isEmpty()) {
	        	return null;
	        } else {
	        	return (Actor) list.get(0);
	        }
		} catch (IOException | InterruptedException e) {
			e.printStackTrace();
		}
		return null;
	}
}