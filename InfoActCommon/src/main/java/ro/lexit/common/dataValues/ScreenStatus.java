package ro.lexit.common.dataValues;

public class ScreenStatus {

	private String code;

	public static final ScreenStatus LIST = new ScreenStatus("list");
	public static final ScreenStatus VIEW = new ScreenStatus("view");
	public static final ScreenStatus EDIT = new ScreenStatus("edit");
	public static final ScreenStatus ADD = new ScreenStatus("add");
	public static final ScreenStatus FILTER = new ScreenStatus("filter");
	
	public ScreenStatus() { }
	
	public ScreenStatus(String code) {
		this.code = code;
	}
	
	public String getCode() { return code; }
	public ScreenStatus setCode(String code) { this.code = code; return this; }
	
	public boolean isList() { return this.code.equalsIgnoreCase("list"); }
	public boolean isView() { return this.code.equalsIgnoreCase("view"); }
	public boolean isEdit() { return this.code.equalsIgnoreCase("edit"); }
	public boolean isAdd() { return this.code.equalsIgnoreCase("add"); }
	public boolean isFilter() { return this.code.equalsIgnoreCase("filter"); }
	
	public boolean isEditable() { return this.code.equalsIgnoreCase("add") || this.code.equalsIgnoreCase("edit"); }
	public boolean isDetail() { return this.code.equalsIgnoreCase("add") || this.code.equalsIgnoreCase("edit") || this.code.equalsIgnoreCase("view"); }
	
}
