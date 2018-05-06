package ro.lexit.common.dataRecords.filmInd;

import java.util.Date;

import ro.lexit.common.dataRecords.base.Atasament;
import ro.lexit.common.dataRecords.base.Document;
import ro.lexit.common.utils.DataRecordID;

public class Film extends DataRecordID {

	private String nume;
	private String genuri;
	private Date dt;
	private String descriere;
	private Document document;
	private Atasament poza;
	private Boolean Favorit;
	private String personaj;
	
	public String getNume() { return nume; }
	public Film setNume(String nume) { this.nume = nume; return this; }
	
	public String getGenuri() { return genuri; }
	public Film setGenuri(String genuri) { this.genuri = genuri; return this; }
	
	public Date getDt() { return dt; }
	public Film setDt(Date dt) { this.dt = dt; return this; }
	
	public String getDescriere() { return descriere; }
	public Film setDescriere(String descriere) { this.descriere = descriere; return this; }
	
	public Document getDocument() { return document; }
	public Film setDocument(Document document) { this.document = document; return this; }
	
	public Atasament getPoza() { return poza; }
	public Film setPoza(Atasament poza) { this.poza = poza; return this; }
	
	public Boolean getFavorit() { return Favorit; }
	public Film setFavorit(Boolean favorit) { Favorit = favorit; return this; }
	
	public String getPersonaj() { return personaj; }
	public Film setPersonaj(String personaj) { this.personaj = personaj; return this; }
}