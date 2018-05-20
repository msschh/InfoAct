package ro.lexit.app.service.base;

import java.io.File;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ro.lexit.common.dataRecords.base.Atasament;
import ro.lexit.common.dataValues.AppSettings;

@Service
public class ServiceAtasament {
	
	@Autowired private AppSettings appSettings;

	public String getFilepath(Atasament atasament) {
	    
		File directory = null;
		String basedir = appSettings.getBasedir();
		directory = new File(basedir);
		if (! directory.exists()) { directory.mkdir(); }
		directory = new File(basedir + "//" + atasament.getDocument().getId());
		if (! directory.exists()) { directory.mkdir(); }
		
		String filepath = basedir + "//" + atasament.getDocument().getId() + "//" + atasament.getUrl();
		
		return filepath;
	}

	public String getFilepathTest(Atasament atasament) {
	    
		File directory = null;
		String testdir = appSettings.getTestdir();
		directory = new File(testdir);
		if (! directory.exists()) { directory.mkdir(); }
		
		String filepath = testdir + "//" + atasament.getUrl();
		
		return filepath;
	}

}