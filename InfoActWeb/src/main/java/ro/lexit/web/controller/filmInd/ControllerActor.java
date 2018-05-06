package ro.lexit.web.controller.filmInd;

import static ro.lexit.common.dataValues.ScreenStatus.*;

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
import ro.lexit.app.dao.filmInd.DaoFilm;
import ro.lexit.app.service.filmInd.ServiceActor;
import ro.lexit.app.validator.filmInd.ValidatorActor;
import ro.lexit.common.dataFilters.filmInd.FActor;
import ro.lexit.common.dataFilters.filmInd.FFilm;
import ro.lexit.common.dataRecords.base.Document;
import ro.lexit.common.dataRecords.filmInd.Actor;
import ro.lexit.common.dataValues.ScreenInfo;
import ro.lexit.common.utils.DataQuery;
import ro.lexit.web.core.ScreenAdapter;
import ro.lexit.web.core.SecurityUtils;
import ro.lexit.web.util.base.UtilDocument;

@Controller
@RequestMapping("/actor")
public class ControllerActor {

	private ScreenInfo screen = new ScreenInfo()
		.setModule("filmInd")
		.setScreenCode("actor")
		.setScreenTitle("Actori")
		.setViewname("filmInd/actor")
		.setMenuTitle("app")
		.setMenuLink("actori")
		.setMenuHead("filmInd");
	
	@Autowired private DaoActor dao;
	@Autowired private DaoFilm daoFilm;

	@Autowired private UtilDocument utilDocument;
	@Autowired private SecurityUtils securityUtils;
	@Autowired private ValidatorActor validator;
	@Autowired private ServiceActor serviceActor;

	@InitBinder 
	public void customizeBinding (WebDataBinder binder) { new ScreenAdapter().initBinder(binder); }
	
	/*
	 * Methods - GET
	 */
	
	@RequestMapping("/list")
	private String list(WebRequest webRequest, Model model) {
		new ScreenAdapter(screen, webRequest)
        	.setDao(dao)
			.setFilterClass(FActor.class)
    		.initModel(model)
			.buildForList(model);
        addForList(model);		
		return screen.getViewname();
	}
	
	@RequestMapping(value = "/view", method = RequestMethod.GET)
	private String view(WebRequest webRequest, Model model) {
		Actor actor = new ScreenAdapter(screen, webRequest)
			.setDao(dao)
			.initModel(model)
			.buildForViewable(model, VIEW);
		addForView(model, actor);
		return screen.getViewname();
	}
	
	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	private String edit(WebRequest webRequest, Model model) {
		securityUtils.authorize("actor", "write");
		Actor actor = new ScreenAdapter(screen, webRequest)
			.setDao(dao)
			.initModel(model)
			.buildForViewable(model, EDIT);
		addForEdit(model, actor);
		return screen.getViewname();
	}
	
	@RequestMapping(value = "/add", method = RequestMethod.GET)
    private String add(Model model) {
		securityUtils.authorize("actor", "write");
		new ScreenAdapter(screen)
			.initModel(model)
			.buildForAdd(model, new Actor());
		return screen.getViewname();
	}
	
	/*
	 * Methods - POST 
	 */	
	
	@RequestMapping(value = "/create", method = RequestMethod.POST)
	private String create(@ModelAttribute("record") Actor actor, BindingResult result, Model model) {
		securityUtils.authorize("actor", "write");
		validator.validate(actor, result);	
		if (result.hasErrors()) {
			new ScreenAdapter(screen)
				.initModel(model)
				.buildForSave(model, actor, ADD);
			return screen.getViewname();
		}        
		serviceActor.create(actor);
		return "redirect:view?id=" + actor.getId() + "&ls=1";
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	private String update(@ModelAttribute("record") Actor actor, BindingResult result, Model model) {
		securityUtils.authorize("actor", "write");
		validator.validate(actor, result);
		if (result.hasErrors()) {
			new ScreenAdapter(screen)
				.initModel(model)
				.buildForSave(model, actor, EDIT);
			return screen.getViewname();
		}		
		dao.update(actor);
		return "redirect:view?id=" + actor.getId() + "&ls=1";
    }
	
	@RequestMapping("/delete")
	private String delete(@RequestParam("id") Integer id) {
		securityUtils.authorize("actor", "write");
		serviceActor.delete(id);
        return "redirect:list";
    }
	
	/*
	 * Methods - private
	 */

	private void addForList(Model model) {
		
	}
    
	private void addForView(Model model, Actor record) {
    	Document document = record.getDocument();
		utilDocument.addForView(model, document);
		model
			.addAttribute("filme", daoFilm.readList(new DataQuery(new FFilm().setActor(record))))
		;
	}
    
	private void addForEdit(Model model, Actor record) {
    	Document document = record.getDocument();
		utilDocument.addForView(model, document);
		model
			.addAttribute("filme", daoFilm.readList(new DataQuery(new FFilm().setActor(record))))
			.addAttribute("listFilme", daoFilm.readList())
		;
	}	

}