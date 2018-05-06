package ro.lexit.web.core;

public class ContentType {
	public final static String XLSX = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
	public final static String PDF = "application/pdf";
	public final static String PNG = "image/png";
	public final static String DOCX = "document/docx";
	
	public static String get(String extensie) {
		switch (extensie) {
			case "xlsx": return XLSX;
			default: return null;
		}
	}
	
}
