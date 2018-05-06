package ro.lexit.common.dataFilters.admin;

import ro.lexit.common.dataRecords.admin.Rol;
import ro.lexit.common.utils.IDataFilter;

public class FUtilizator implements IDataFilter {
	private String nume;
	private String username;
	private String parola;
	private String email;
	private Rol rol;
	
	public String getNume() { return nume; }
	public void setNume(String nume) { this.nume = nume; }
	
	public String getUsername() { return username; }
	public FUtilizator setUsername(String username) { this.username = username; return this; }
	
	public String getParola() { return parola; }
	public FUtilizator setParola(String parola) { this.parola = parola; return this; }
	
	public String getEmail() { return email; }
	public FUtilizator setEmail(String email) { this.email = email; return this; }
	
	public Rol getRol() { return rol; }
	public FUtilizator setRol(Rol rol) { this.rol = rol; return this; }

}
