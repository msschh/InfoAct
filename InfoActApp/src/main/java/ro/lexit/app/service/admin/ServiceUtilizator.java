package ro.lexit.app.service.admin;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ro.lexit.app.dao.admin.DaoDrept;
import ro.lexit.app.dao.admin.DaoRol;
import ro.lexit.app.dao.admin.DaoUtilizator;
import ro.lexit.app.dao.base.DaoDocument;
import ro.lexit.common.dataFilters.admin.FDrept;
import ro.lexit.common.dataFilters.admin.FRol;
import ro.lexit.common.dataFilters.admin.FUtilizator;
import ro.lexit.common.dataRecords.admin.Drept;
import ro.lexit.common.dataRecords.admin.PassChg;
import ro.lexit.common.dataRecords.admin.Rol;
import ro.lexit.common.dataRecords.admin.Utilizator;
import ro.lexit.common.dataRecords.base.Document;
import ro.lexit.common.encryption.EncryptionUtils;
import ro.lexit.common.utils.DataQuery;
import ro.lexit.common.utils.IDataRecord;

@Service
public class ServiceUtilizator {
	
	@Autowired DaoUtilizator daoUtilizator;
	@Autowired DaoRol daoRol;
	@Autowired DaoDrept daoDrept;
	@Autowired DaoDocument daoDocument;

	public Utilizator decorate(String username) {
		
		/* citire utilizator din baza */
		FUtilizator filtruUtilizator = new FUtilizator().setUsername(username);
		DataQuery qryUtilizator = new DataQuery().setFilter(filtruUtilizator);
		List<IDataRecord> list = daoUtilizator.readList(qryUtilizator);
		if (list.isEmpty()) { return null; }
		Utilizator utilizator = (Utilizator) list.get(0);

		/* adaugare roluri */
		FRol filtruRol = new FRol().setUtilizator(utilizator);
		DataQuery qryRol = new DataQuery().setFilter(filtruRol);
		List<IDataRecord> listaRoluri = daoRol.readList(qryRol);
		utilizator.roluri = new ArrayList<>();
		for (IDataRecord iDataRecord : listaRoluri) {
			utilizator.roluri.add((Rol) iDataRecord);
		}
		
		/* adaugare drepturi  */
		FDrept filtruDrept = new FDrept().setUtilizator(utilizator);
		DataQuery qryDrept = new DataQuery().setFilter(filtruDrept);
		List<IDataRecord> listaDrepturi = daoDrept.readList(qryDrept);
		utilizator.drepturi = new ArrayList<>();
		for (IDataRecord iDataRecord : listaDrepturi) {
			utilizator.drepturi.add((Drept) iDataRecord);
		}
		
		return utilizator;
		
	}

	public void changePassword(PassChg passChg) {
		Utilizator utilizator = (Utilizator) daoUtilizator.read(passChg.getUtilizator().getId());
		String passwordEnc = EncryptionUtils.encrypt(passChg.getNewpass1());
		utilizator.setParola(passwordEnc);		
		daoUtilizator.update(utilizator);		
	}
	
	public void create(Utilizator utilizator) {
		Document document = new Document().setTip("UTI");
		daoDocument.create(document);
		utilizator.setDocument(document);
		daoUtilizator.create(utilizator);
	}
	
	public void delete(Integer id) {
		Utilizator utilizator = (Utilizator) daoUtilizator.read(id);
		daoDocument.delete(utilizator.getDocument().getId());
		daoUtilizator.delete(id);
	}
}
