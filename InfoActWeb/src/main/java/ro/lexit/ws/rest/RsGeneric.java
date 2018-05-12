package ro.lexit.ws.rest;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Context;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;

import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;

import ro.lexit.app.core.intf.IDao;
import ro.lexit.app.core.intf.IDaoFactory;
import ro.lexit.app.core.intf.IDaoID;
import ro.lexit.common.utils.DataRecordID;
import ro.lexit.common.utils.IDataRecord;
import ro.lexit.common.utils.LexicalFactory;
import ro.lexit.ws.core.SecurityUtilsWs;

@Consumes(MediaType.APPLICATION_JSON_VALUE + ";charset=utf-8")
@Produces(MediaType.APPLICATION_JSON_VALUE + ";charset=utf-8")
public class RsGeneric {
	
	private DateFormat dateFormat = new SimpleDateFormat("dd.MM.yyyy");
	private ObjectMapper jsonMapper = new ObjectMapper().setDateFormat(dateFormat);
	private LexicalFactory recordFactory = new LexicalFactory()
			.addPackage("ro.lexit.common.dataRecords.admin")
			.addPackage("ro.lexit.common.dataRecords.base")
			.addPackage("ro.lexit.common.dataRecords.filmInd");	
	
	@Autowired IDaoFactory daoFactory;
	@Context HttpServletRequest request;
	@Autowired SecurityUtilsWs securityUtils;
	
	@GET 
	@Path("/{entityCode}/list")
	public List<IDataRecord> readList(@PathParam("entityCode") String entityCode) {
		securityUtils.authorize(request, entityCode, "read");
		IDao dao = daoFactory.getInstance(entityCode);
		List<IDataRecord> recordList = dao.readList();
		return recordList;
	}
	
	@GET 
	@Path("/{entityCode}/{id}")
	public IDataRecord read(@PathParam("entityCode") String entityCode, @PathParam("id") Integer id) {
		securityUtils.authorize(request, entityCode, "read");
		IDaoID dao = (IDaoID) daoFactory.getInstance(entityCode);
		IDataRecord record = dao.read(id);
		return record;
	}
	
	@PUT 
	@Path("/{entityCode}") 	
	public Integer create(@PathParam("entityCode") String entityCode, String json) {
		securityUtils.authorize(request, entityCode, "write");
		IDataRecord record = getRecord(entityCode, json);
		IDaoID dao = (IDaoID) daoFactory.getInstance(entityCode);
		dao.create(record);
		if (DataRecordID.class.isAssignableFrom(record.getClass())) {
			return ((DataRecordID) record).getId(); 
		}
		return null;
	}
	
	@POST 
	@Path("/{entityCode}/{id}") 
	public void update(@PathParam("entityCode") String entityCode, @PathParam("id") Integer id, String json) {
		securityUtils.authorize(request, entityCode, "write");
		IDataRecord record = getRecord(entityCode, json);
		IDaoID dao = (IDaoID) daoFactory.getInstance(entityCode);
		dao.update(record); 
	}
	
	@DELETE 
	@Path("/{entityCode}/{id}") 
	public void delete(@PathParam("entityCode") String entityCode, @PathParam("id") Integer id) {
		securityUtils.authorize(request, entityCode, "write"); 
		IDaoID dao = (IDaoID) daoFactory.getInstance(entityCode);
		dao.delete(id); 
	}
	
	/*
	 * Private methods
	 */
	
	private IDataRecord getRecord(String entityCode, String json) {
		jsonMapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
		try {
			String className = StringUtils.capitalize(entityCode);
			Class<?> cls = recordFactory.getType(className);
			IDataRecord record = (IDataRecord) jsonMapper.readValue(json, cls);
			return record;
		} catch (IOException e) {
			e.printStackTrace();
			return null;
		}
	}	
}
