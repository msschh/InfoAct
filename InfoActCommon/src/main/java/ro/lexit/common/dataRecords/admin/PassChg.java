package ro.lexit.common.dataRecords.admin;

import ro.lexit.common.utils.IDataRecord;

public class PassChg implements IDataRecord {

	private Utilizator utilizator;
	private String oldpass;
	private String newpass1;
	private String newpass2;

	public Utilizator getUtilizator() { return utilizator; }
	public PassChg setUtilizator(Utilizator utilizator) { this.utilizator = utilizator; return this; }

	public String getOldpass() { return oldpass; }
	public PassChg setOldpass(String oldpass) { this.oldpass = oldpass; return this; }

	public String getNewpass1() { return newpass1; }
	public PassChg setNewpass1(String newpass1) { this.newpass1 = newpass1; return this; }

	public String getNewpass2() { return newpass2; }
	public PassChg setNewpass2(String newpass2) { this.newpass2 = newpass2; return this; }
	
}
