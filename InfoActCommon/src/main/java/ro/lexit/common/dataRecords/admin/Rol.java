package ro.lexit.common.dataRecords.admin;

import ro.lexit.common.utils.DataRecordID;

public class Rol extends DataRecordID {

	private String cod;
	private String nume;
	private String memo;
	private Drept Drept;

	public String getCod() { return cod; }
	public Rol setCod(String cod) { this.cod = cod; return this;}
	
	public String getNume() { return nume; }
	public Rol setNume(String nume) { this.nume = nume; return this;}
	
	public String getMemo() { return memo; }
	public Rol setMemo(String memo) { this.memo = memo; return this;}
	
	public Drept getDrept() { return Drept; }
	public Rol setDrept(Drept Drept) { this.Drept = Drept;	return this; }
}

