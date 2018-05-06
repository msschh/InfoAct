package ro.lexit.common.dataRecords.base;

import java.util.Date;

import ro.lexit.common.dataRecords.admin.Utilizator;
import ro.lexit.common.utils.DataRecordID;

public class Atasament extends DataRecordID {
	
	private Document document;
	private String url;
	private Date dtUpload;
	private Utilizator creatDe;
	private String tipFisier;
	
	public Document getDocument() { return document; }
	public Atasament setDocument(Document document) { this.document = document; return this; }
	
	public String getUrl() { return url; }
	public Atasament setUrl(String url) { this.url = url; return this; }
	
	public Date getDtUpload() { return dtUpload; }
	public Atasament setDtUpload(Date dtUpload) { this.dtUpload = dtUpload; return this; }
	
	public Utilizator getCreatDe() { return creatDe; }
	public Atasament setCreatDe(Utilizator utilizator) { this.creatDe = utilizator; return this; }
	
	public String getTipFisier() { return tipFisier; }
	public Atasament setTipFisier(String tipFisier) { this.tipFisier = tipFisier; return this; }
}