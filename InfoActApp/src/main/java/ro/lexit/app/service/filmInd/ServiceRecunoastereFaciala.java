package ro.lexit.app.service.filmInd;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
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
			String url = "http://127.0.0.1:8081/recognizeKNN/" + img;
			URL obj = new URL(url);
			HttpURLConnection con = (HttpURLConnection) obj.openConnection();
			con.setRequestMethod("GET");
			BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
			String inputLine;
			StringBuffer response = new StringBuffer();

			while ((inputLine = in.readLine()) != null) {
				response.append(inputLine);
			}
			in.close();
	        List<IDataRecord> list = daoActor.readList(new DataQuery(new FActor().setNume(response.toString())));
	        if (list.isEmpty()) {
	        	return null;
	        } else {
	        	return (Actor) list.get(0);
	        }
		} catch (IOException e) {
			return null;
		}
	}
}