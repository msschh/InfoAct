package ro.lexit.common.dataRecords.filmInd;

import java.util.Date;

import ro.lexit.common.dataRecords.base.Atasament;
import ro.lexit.common.dataRecords.base.Document;
import ro.lexit.common.utils.DataRecordID;

public class Actor extends DataRecordID {
	
	private String nume;
	private Date dtNastere;
	private String locNastere;
	private String descriere;
	private Document document;
	private Atasament poza;
	private String personaj;
	
	public String getNume() { return nume; }
	public Actor setNume(String nume) { this.nume = nume; return this; }
	
	public Date getDtNastere() { return dtNastere; }
	public Actor setDtNastere(Date dtNastere) { this.dtNastere = dtNastere; return this; }
	
	public String getLocNastere() { return locNastere; }
	public Actor setLocNastere(String locNastere) { this.locNastere = locNastere; return this; }
	
	public String getDescriere() { return descriere; }
	public Actor setDescriere(String descriere) { this.descriere = descriere; return this; }
	
	public Document getDocument() { return document; }
	public Actor setDocument(Document document) { this.document = document; return this; }
	
	public Atasament getPoza() { return poza; }
	public Actor setPoza(Atasament poza) { this.poza = poza; return this; }
	
	public String getPersonaj() { return personaj; }
	public Actor setPersonaj(String personaj) { this.personaj = personaj; return this; }
}