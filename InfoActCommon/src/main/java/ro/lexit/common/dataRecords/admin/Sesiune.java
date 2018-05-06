package ro.lexit.common.dataRecords.admin;

import java.util.Date;

import ro.lexit.common.utils.DataRecordID;

public class Sesiune extends DataRecordID {
	
	private Utilizator utilizator;
	private Date dtAccesare;
	private String browser;
	private String ip;
	private String os;

	public Sesiune() { }
	public Sesiune(Integer idSesiune) { this.id = idSesiune; }
	
	public String getOs() {	return os; }
	public Sesiune setOs(String os) { this.os = os; return this; }
	
	public Utilizator getUtilizator() { return utilizator; }
	public Sesiune setUtilizator(Utilizator utilizator) { this.utilizator = utilizator; return this; }
	
	public Date getDtAccesare() {return dtAccesare;	}
	public Sesiune setDtAccesare(Date dtAccesare) { this.dtAccesare = dtAccesare; return this; }
	
	public String getBrowser() { return browser; }
	public Sesiune setBrowser(String browser) { this.browser = browser; return this; }
	
	public String getIp() {	return ip; }
	public Sesiune setIp(String ip) { this.ip = ip; return this; }
	
}
