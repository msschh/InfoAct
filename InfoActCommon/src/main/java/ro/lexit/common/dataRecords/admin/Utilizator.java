package ro.lexit.common.dataRecords.admin;

import java.io.Serializable;
import java.util.List;

import ro.lexit.common.dataRecords.base.Document;
import ro.lexit.common.utils.DataRecordID;

@SuppressWarnings("serial")
public class Utilizator extends DataRecordID implements Serializable {

	private String nume;
	private String username;
	private String parola;
	private String email;
	private Document document;
	
	public List<Rol> roluri;
	public List<Drept> drepturi;
	
	public String getNume() { return nume; }
	public Utilizator setNume(String nume) { this.nume = nume; return this;}
	
	public String getUsername() { return username; }
	public Utilizator setUsername(String username) { this.username = username; return this;}
	
	public String getParola() { return parola; }
	public Utilizator setParola(String parola) { this.parola = parola; return this; }
	
	public String getEmail() { return email; }
	public Utilizator setEmail(String email) { this.email = email; return this; }
	
	public Document getDocument() { return document; }
	public Utilizator setDocument(Document document) { this.document = document; return this; }
	
}