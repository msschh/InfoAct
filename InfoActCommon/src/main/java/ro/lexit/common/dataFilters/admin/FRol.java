package ro.lexit.common.dataFilters.admin;

import ro.lexit.common.dataRecords.admin.Utilizator;
import ro.lexit.common.utils.IDataFilter;

public class FRol implements IDataFilter {
	
	private Utilizator utilizator;
	private String cod;
	private String nume;
	
	public Utilizator getUtilizator() { return utilizator; }
	public FRol setUtilizator(Utilizator utilizator) { this.utilizator = utilizator; return this; }

	public String getCod() { return cod; }
	public FRol setCod(String cod) { this.cod = cod; return this; }
	
	public String getNume() { return nume; }
	public FRol setNume(String nume) { this.nume = nume; return this; }

}