package ro.lexit.web.core;

import static ro.lexit.common.dataValues.ScreenStatus.*;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.function.Consumer;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.support.WebRequestDataBinder;
import org.springframework.web.context.request.WebRequest;

import ro.lexit.app.core.intf.IDao;
import ro.lexit.app.core.intf.IDaoID;
import ro.lexit.common.dataValues.ScreenInfo;
import ro.lexit.common.dataValues.ScreenStatus;
import ro.lexit.common.utils.DataQuery;
import ro.lexit.common.utils.DataRecordID;
import ro.lexit.common.utils.DataUtils;
import ro.lexit.common.utils.IDataFilter;
import ro.lexit.common.utils.IDataRecord;
import ro.lexit.common.utils.ObjectFactory;
import ro.lexit.common.utils.Pager;
import ro.lexit.common.utils.Sorter;

public class ScreenAdapter {
	
	private WebRequest webRequest;
	private IDao dao;
	private Class<? extends IDataFilter> filterClass;
	private Consumer<IDataFilter> filterProcessor; 
	private Consumer<IDataRecord> recordProcessor; 
	private ScreenInfo screenInfo;
	
	public ScreenAdapter() {}
	public ScreenAdapter(WebRequest webRequest) { this.webRequest = webRequest; }
	public ScreenAdapter(ScreenInfo screenInfo) { this.screenInfo = screenInfo; }
	
	public ScreenAdapter(ScreenInfo screenInfo, WebRequest webRequest) { 
		this.screenInfo = screenInfo; 
		this.webRequest = webRequest; 
	}	
	
	/*
	 * Methods - public
	 */
	
	public ScreenAdapter initModel(Model model) {
		model
			.addAttribute("module", screenInfo.getModule())
			.addAttribute("screenCode", screenInfo.getScreenCode())
			.addAttribute("screenTitle", screenInfo.getScreenTitle())
			.addAttribute("menuTitle", screenInfo.getMenuTitle())	
			.addAttribute("menuHead", screenInfo.getMenuHead())
			.addAttribute("menuLink", screenInfo.getMenuLink())
			;
		return this;
	}

	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormatter = new SimpleDateFormat("dd.MM.yyyy");
		dateFormatter.setLenient(false);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormatter, true));		
	}
	
	public ScreenAdapter buildForList(Model model) {
		IDataFilter originalFilter = getFilter();
		IDataFilter filter = (IDataFilter) DataUtils.cloneFilter(originalFilter);
		if (this.filterProcessor != null) { filterProcessor.accept(filter); }
		Sorter sorter = getSorter();
		DataQuery qry = new DataQuery().setFilter(filter).setSorter(sorter);
		int recordCount = dao.readRecordCount(qry);
		Pager pager = getPager(recordCount);
		RowBounds rb = new RowBounds(pager.getRecordNoMin(), pager.getPageSize());
		List<IDataRecord> recordList = dao.readList(qry, rb);
		if (this.recordProcessor != null) {
			for (IDataRecord record : recordList) {
				recordProcessor.accept(record);
			}
		}
		model
			.addAttribute("recordList", recordList)
			.addAttribute("filter", originalFilter)
			.addAttribute("pager", pager)
			.addAttribute("sorter", sorter)
			.addAttribute("ss", LIST);
		
		return this;
	}

	@SuppressWarnings("unchecked")
	public <T extends DataRecordID> T buildForViewable(Model model, ScreenStatus ss) {
		IDaoID daoId = (IDaoID) dao;
		Integer id = Integer.parseInt(webRequest.getParameter("id"));
		T record = (T) daoId.read(id);

		String ls = webRequest.getParameter("ls");
		ls = (ls != null) ? "ls" : "";   
		
		model
			.addAttribute("record", record)
			.addAttribute("ls", ls)
			.addAttribute("ss", ss);
		
		return record;
	}
	
	public void buildForAdd(Model model, IDataRecord record) {
        model
        	.addAttribute("record", record)
        	.addAttribute("ss", ADD);		
	}	
	
	public void buildForSave(Model model, IDataRecord record, ScreenStatus ss) {
        model
        	.addAttribute("record", record)
        	.addAttribute("ss", ss)
        	.addAttribute("ls", "ls");	
	}	
	
	/*
	 * Methods - utility 
	 */
	
	public IDataFilter getFilter() {
		if (this.filterClass == null) { return null; }
		IDataFilter filter = (IDataFilter) ObjectFactory.getInstance(filterClass);
		WebRequestDataBinder binder = new WebRequestDataBinder(filter, "filter");
		SimpleDateFormat dateFormat = new SimpleDateFormat("dd.MM.yyyy");
		dateFormat.setLenient(true);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, false));
		binder.bind(webRequest);
		return filter;
	}
	
	public Sorter getSorter() {
		String sorterField = webRequest.getParameter("sorterField");
		String sorterDirection = webRequest.getParameter("sorterDirection");
		if (sorterField == null || sorterField.isEmpty()) { return null; }
		if (sorterDirection == null || sorterDirection.isEmpty()) { return null; }
		Sorter sorter = new Sorter(sorterField, sorterDirection);
		return sorter;
	}
	
	public Pager getPager(int recordCount) {
		String pageNoString = webRequest.getParameter("pageNo");
		String pageSizeString = webRequest.getParameter("pageSize");
		Integer pageNo = (pageNoString == null ? 1 : Integer.parseInt(pageNoString));
		Integer pageSize = (pageSizeString == null ? 12 : Integer.parseInt(pageSizeString));
		Pager pager = new Pager().setRecordCount(recordCount).setPageSize(pageSize).setPageNo(pageNo).build();
		return pager;
	}

	@SuppressWarnings("unchecked")
	public <T extends IDataRecord> T getRecord(Class<T> cls) {
		if (cls == null) { return null; }
		T record = (T) ObjectFactory.getInstance(cls);
		WebRequestDataBinder binder = new WebRequestDataBinder(record, "record");
		SimpleDateFormat dateFormat = new SimpleDateFormat("dd.MM.yyyy");
		dateFormat.setLenient(true);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, false));
		binder.bind(webRequest);
		return record;
	}	
	
	/*
	 * getters & setters
	 */
	
	public ScreenAdapter setWebRequest(WebRequest webRequest) { this.webRequest = webRequest; return this; }
	public ScreenAdapter setDao(IDao dao) { this.dao = dao; return this; }
	public ScreenAdapter setFilterClass(Class<? extends IDataFilter> filterClass) { this.filterClass = filterClass; return this; }
	public ScreenAdapter setFilterProcessor(Consumer<IDataFilter> filterProcessor) { this.filterProcessor = filterProcessor; return this; }
	public ScreenAdapter setRecordProcessor(Consumer<IDataRecord> recordProcessor) { this.recordProcessor = recordProcessor; return this; }
	public ScreenAdapter setScreenInfo(ScreenInfo screenInfo) { this.screenInfo = screenInfo; return this; }

	
	
	
	
}