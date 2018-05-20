package ro.lexit.common.dataValues;

public class AppSettings {
	
	private String basedir;
	private String testdir;
	
	/*
	 * getters & setters
	 */
	
	public String getBasedir() { return basedir; }
	public AppSettings setBasedir(String basedir) { this.basedir = basedir; return this; }

	public String getTestdir() { return testdir; }
	public AppSettings setTestdir(String testdir) { this.testdir = testdir; return this; }
	
}