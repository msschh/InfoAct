package ro.lexit.web.controller.filmInd;

import static ro.lexit.common.dataValues.ScreenStatus.ADD;
import static ro.lexit.common.dataValues.ScreenStatus.EDIT;
import static ro.lexit.common.dataValues.ScreenStatus.VIEW;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.WebRequest;

import ro.lexit.app.dao.filmInd.DaoActor;
import ro.lexit.app.dao.filmInd.DaoFavorit;
import ro.lexit.app.dao.filmInd.DaoFilm;
import ro.lexit.app.dao.filmInd.DaoRecenzie;
import ro.lexit.app.service.filmInd.ServiceFilm;
import ro.lexit.app.validator.filmInd.ValidatorFilm;
import ro.lexit.common.dataFilters.filmInd.FActor;
import ro.lexit.common.dataFilters.filmInd.FFilm;
import ro.lexit.common.dataFilters.filmInd.FRecenzie;
import ro.lexit.common.dataRecords.base.Document;
import ro.lexit.common.dataRecords.filmInd.Film;
import ro.lexit.common.dataValues.ScreenInfo;
import ro.lexit.common.utils.DataQuery;
import ro.lexit.web.core.ScreenAdapter;
import ro.lexit.web.core.SecurityUtils;
import ro.lexit.web.util.base.UtilDocument;

@Controller
@RequestMapping("/film")
public class ControllerFilm {

	private ScreenInfo screen = new ScreenInfo()
		.setModule("filmInd")
		.setScreenCode("film")
		.setScreenTitle("Filme")
		.setViewname("filmInd/film")
		.setMenuTitle("app")
		.setMenuLink("filme")
		.setMenuHead("filmInd");
	
	@Autowired private DaoFilm dao;
	@Autowired private DaoActor daoActor;
	@Autowired private DaoFavorit daoFavorit;
	@Autowired private DaoRecenzie daoRecenzie;

	@Autowired private UtilDocument utilDocument;
	@Autowired private SecurityUtils securityUtils;
	@Autowired private ValidatorFilm validator;
	@Autowired private ServiceFilm serviceFilm;

	@InitBinder 
	public void customizeBinding (WebDataBinder binder) { new ScreenAdapter().initBinder(binder); }
	
	/*
	 * Methods - GET
	 */
	
	@RequestMapping("/list")
	private String list(WebRequest webRequest, Model model) {
		new ScreenAdapter(screen, webRequest)
        	.setDao(dao)
			.setFilterClass(FFilm.class)
    		.initModel(model)
			.buildForList(model);
        addForList(model);		
		return screen.getViewname();
	}
	
	@RequestMapping(value = "/view", method = RequestMethod.GET)
	private String view(WebRequest webRequest, Model model) {
		Film film = new ScreenAdapter(screen, webRequest)
			.setDao(dao)
			.initModel(model)
			.buildForViewable(model, VIEW);
		addForView(model, film);
		Integer fav = null;
		if (securityUtils.isAuthenticated()) {
			fav = daoFavorit.read(securityUtils.getCurrentUser().getId(), film.getId());
		}
		if (fav != null) { film.setFavorit(true); }
			else { film.setFavorit(false); }
		return screen.getViewname();
	}
	
	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	private String edit(WebRequest webRequest, Model model) {
		securityUtils.authorize("film", "write");
		Film film = new ScreenAdapter(screen, webRequest)
			.setDao(dao)
			.initModel(model)
			.buildForViewable(model, EDIT);
		addForEdit(model, film);
		return screen.getViewname();
	}
	
	@RequestMapping(value = "/add", method = RequestMethod.GET)
    private String add(Model model) {
		securityUtils.authorize("film", "write");
		new ScreenAdapter(screen)
			.initModel(model)
			.buildForAdd(model, new Film());
		return screen.getViewname();
	}
	
	/*
	 * Methods - POST 
	 */	
	
	@RequestMapping(value = "/create", method = RequestMethod.POST)
	private String create(@ModelAttribute("record") Film film, BindingResult result, Model model) {
		securityUtils.authorize("film", "write");
		validator.validate(film, result);	
		if (result.hasErrors()) {
			new ScreenAdapter(screen)
				.initModel(model)
				.buildForSave(model, film, ADD);
			return screen.getViewname();
		}        
		serviceFilm.create(film);
		return "redirect:view?id=" + film.getId() + "&ls=1";
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	private String update(@ModelAttribute("record") Film film, BindingResult result, Model model) {
		securityUtils.authorize("film", "write");
		validator.validate(film, result);
		if (result.hasErrors()) {
			new ScreenAdapter(screen)
				.initModel(model)
				.buildForSave(model, film, EDIT);
			return screen.getViewname();
		}		
		dao.update(film);
		return "redirect:view?id=" + film.getId() + "&ls=1";
    }
	
	@RequestMapping("/delete")
	private String delete(@RequestParam("id") Integer id) {
		securityUtils.authorize("film", "write");
		serviceFilm.delete(id);
        return "redirect:list";
    }
	
	/*
	 * Methods - private
	 */

	private void addForList(Model model) {
		
	}
    
	private void addForView(Model model, Film record) {
    	Document document = record.getDocument();
		utilDocument.addForView(model, document);
		model
			.addAttribute("actori", daoActor.readList(new DataQuery().setFilter(new FActor().setFilm(record))))
			.addAttribute("recenzii", daoRecenzie.readList(new DataQuery().setFilter(new FRecenzie().setFilm(record))))
		;
	}
    
	private void addForEdit(Model model, Film record) {
    	Document document = record.getDocument();
		utilDocument.addForView(model, document);
		model
			.addAttribute("actori", daoActor.readList(new DataQuery().setFilter(new FActor().setFilm(record))))
			.addAttribute("listActori", daoActor.readList())
		;
	}	

}