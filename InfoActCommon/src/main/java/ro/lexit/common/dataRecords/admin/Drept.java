package ro.lexit.common.dataRecords.admin;

import ro.lexit.common.utils.DataRecordID;

public class Drept extends DataRecordID {

	private String cod;
	private String entitate;
	private String descriere;

	public String getCod() { return cod; }
	public Drept setCod(String cod) { this.cod = cod; return this; }

	public String getEntitate() { return entitate; }
	public Drept setEntitate(String entitate) { this.entitate = entitate; return this; }
	
	public String getDescriere() { return descriere; }
	public Drept setDrescrier(String descriere) {this.descriere = descriere; return this; }
}
