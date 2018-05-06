package ro.lexit.web.exceptions;

@SuppressWarnings("serial")
public class EroareAutorizare extends RuntimeException {
	private String entityCode;
	private String grant;
	
	public EroareAutorizare(String entityCode, String grant) {
		super("Eroare de autorizare");
		this.entityCode = entityCode;
		this.grant = grant;
	}

	public String getEntityCode() { return entityCode; }
	public String getGrant() { return grant; }

}