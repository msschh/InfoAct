package ro.lexit.web.core;

import java.io.Serializable;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

@SuppressWarnings("serial")
@Component
@Scope("session")
public class AppInfo implements Serializable {
    public int majorVersion;
    public int minorVersion;
    public int release;
    public String stage;
    public String environment;
    
	public int getMajorVersion() { return majorVersion; }
	public void setMajorVersion(int majorVersion) { this.majorVersion = majorVersion; }

	public int getMinorVersion() { return minorVersion; }
	public void setMinorVersion(int minorVersion) { this.minorVersion = minorVersion; }
	
	public int getRelease() { return release; }
	public void setRelease(int release) { this.release = release; }
	
	public String getStage() { return stage; }
	public void setStage(String stage) { this.stage = stage; }
	
	public String getEnvironment() { return environment; }
	public void setEnvironment(String environment) { this.environment = environment; }
    
    
}

           
       