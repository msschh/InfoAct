package ro.lexit.common.dataRecords.base;

import ro.lexit.common.utils.DataRecordID;

public class Document extends DataRecordID {
	
	private String tip;			
		/*
		 * ACT = actor
		 * FLM = film
		 */
	
	public String getTip() { return tip; }
	public Document setTip(String tip) { this.tip = tip; return this; }
	
}