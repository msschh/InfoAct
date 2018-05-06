package ro.lexit.common.dataValues;

public class ScreenInfo {

	private String module;
	private String screenCode;
	private String screenTitle;
	private String viewname;
	private String menuLink;
	private String menuHead;
	private String menuTitle;
	
	public String getMenuTitle() { return menuTitle; }
	public ScreenInfo setMenuTitle(String menuTitle) { this.menuTitle = menuTitle; return this; }
	
	public String getModule() { return module; }
	public ScreenInfo setModule(String module) { this.module = module; return this; }
	
	public String getScreenCode() { return screenCode; }
	public ScreenInfo setScreenCode(String screenCode) { this.screenCode = screenCode; return this; }
	
	public String getScreenTitle() { return screenTitle; }
	public ScreenInfo setScreenTitle(String screenTitle) { this.screenTitle = screenTitle; return this; }
	
	public String getViewname() { return viewname; }
	public ScreenInfo setViewname(String viewname) { this.viewname = viewname; return this; }
	
	public String getMenuLink() { return menuLink; }
	public ScreenInfo setMenuLink(String menuLink) { this.menuLink = menuLink; return this; }
	
	public String getMenuHead() { return menuHead; }
	public ScreenInfo setMenuHead(String menuHead) { this.menuHead = menuHead; return this; }

	
}
