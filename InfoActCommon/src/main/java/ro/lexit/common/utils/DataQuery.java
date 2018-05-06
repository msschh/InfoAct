package ro.lexit.common.utils;

public class DataQuery {
	
	private IDataFilter filter;
	private Sorter sorter;
	
	public DataQuery() { }
	public DataQuery(IDataFilter filter) { this.filter = filter; }
	public DataQuery(IDataFilter filter, Sorter sorter) { this.filter = filter; this.sorter = sorter; }
	
	
	public IDataFilter getFilter() { return filter; }
	public DataQuery setFilter(IDataFilter filter) { this.filter = filter; return this; }

	public Sorter getSorter() { return sorter; }
	public DataQuery setSorter(Sorter sorter) { this.sorter = sorter; return this; }

}

