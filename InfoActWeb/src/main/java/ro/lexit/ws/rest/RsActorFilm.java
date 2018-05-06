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

import ro.lexit.app.dao.filmInd.DaoActorFilm;
import ro.lexit.ws.core.SecurityUtilsWs;

@Consumes(MediaType.APPLICATION_JSON_VALUE + ";charset=utf-8")
@Produces(MediaType.APPLICATION_JSON_VALUE + ";charset=utf-8")
public class RsActorFilm {

	@Autowired private DaoActorFilm dao;
	@Context private HttpServletRequest request;
	@Autowired private SecurityUtilsWs securityUtils;

	@PUT 
	@Path("/actorFilm") 	
	public void create(@QueryParam("idActor") Integer idActor, @QueryParam("idFilm") Integer idFilm, @QueryParam("personaj") String personaj) {
		securityUtils.authorize(request, "actor", "write");
		dao.create(idActor, idFilm, personaj);
	}
	
	@DELETE 
	@Path("/actorFilm") 	
	public void delete(@QueryParam("idActor") Integer idActor, @QueryParam("idFilm") Integer idFilm) {
		securityUtils.authorize(request, "actor", "write");
		dao.delete(idActor, idFilm);
	}
}
