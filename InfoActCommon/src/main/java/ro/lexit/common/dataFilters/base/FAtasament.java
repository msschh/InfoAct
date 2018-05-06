package ro.lexit.common.dataFilters.base;

import ro.lexit.common.dataRecords.base.Document;
import ro.lexit.common.utils.IDataFilter;

public class FAtasament implements IDataFilter {
	
	private Document document;

	public FAtasament() { }
	public FAtasament(Document document) { this.document = document;}
	
	public Document getDocument() { return document; }
	public FAtasament setDocument(Document document) { this.document = document; return this; }

}