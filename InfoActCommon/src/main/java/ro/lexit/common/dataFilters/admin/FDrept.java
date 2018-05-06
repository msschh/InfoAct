package ro.lexit.common.dataFilters.admin;

import ro.lexit.common.dataRecords.admin.Rol;
import ro.lexit.common.dataRecords.admin.Utilizator;
import ro.lexit.common.utils.IDataFilter;

public class FDrept implements IDataFilter {
	
	private Utilizator utilizator;
	private Rol rol;
	private String cod;
	private String entitate;
	
	public Utilizator getUtilizator() { return utilizator; }
	public FDrept setUtilizator(Utilizator utilizator) { this.utilizator = utilizator; return this; }

	public String getCod() { return cod; }
	public FDrept setCod(String cod) { this.cod = cod; return this; }
	
	public Rol getRol() { return rol; }
	public FDrept setRol(Rol rol) { this.rol = rol; return this; }
	
	public String getEntitate() { return entitate; }
	public FDrept setEntitate(String entitate) { this.entitate = entitate; return this; }

}
	

