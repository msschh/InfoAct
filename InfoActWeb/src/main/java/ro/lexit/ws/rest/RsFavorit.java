package ro.lexit.ws.rest;

import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.Context;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;

import ro.lexit.app.dao.filmInd.DaoFavorit;
import ro.lexit.ws.core.SecurityUtilsWs;

@Consumes(MediaType.APPLICATION_JSON_VALUE + ";charset=utf-8")
@Produces(MediaType.APPLICATION_JSON_VALUE + ";charset=utf-8")
public class RsFavorit {

	@Autowired private DaoFavorit dao;
	@Context private HttpServletRequest request;
	@Autowired private SecurityUtilsWs securityUtils;

	@PUT 
	@Path("/favorit") 	
	public void create(@QueryParam("idFilm") Integer idFilm) {
		dao.create(securityUtils.getCurrentUser(request).getId(), idFilm);
	}
	
	@DELETE 
	@Path("/favorit") 	
	public void delete(@QueryParam("idFilm") Integer idFilm) {
		dao.delete(securityUtils.getCurrentUser(request).getId(), idFilm);
	}
}