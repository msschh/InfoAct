package ro.lexit.common.dataValues;

import ro.lexit.common.dataRecords.admin.Drept;

public class DreptCurent {
	private Drept drept;
	private Boolean allowed;
	
	public Drept getDrept() { return drept; }
	public void setDrept(Drept drept) { this.drept = drept; }
	
	public Boolean getAllowed() { return allowed; }
	public void setAllowed(Boolean allowed) { this.allowed = allowed; }
	
}
