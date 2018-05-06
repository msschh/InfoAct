package ro.lexit.web.controller.admin;

import static ro.lexit.common.dataValues.ScreenStatus.*;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

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

import ro.lexit.app.dao.admin.DaoRol;
import ro.lexit.app.dao.admin.DaoUtilizator;
import ro.lexit.app.service.admin.ServiceUtilizator;
import ro.lexit.app.validator.admin.ValidatorUtilizator;
import ro.lexit.common.dataFilters.admin.FRol;
import ro.lexit.common.dataFilters.admin.FUtilizator;
import ro.lexit.common.dataRecords.admin.Rol;
import ro.lexit.common.dataRecords.admin.Utilizator;
import ro.lexit.common.dataValues.RolCurent;
import ro.lexit.common.dataValues.ScreenInfo;
import ro.lexit.common.encryption.EncryptionUtils;
import ro.lexit.common.utils.DataQuery;
import ro.lexit.common.utils.IDataRecord;
import ro.lexit.web.core.ScreenAdapter;
import ro.lexit.web.core.SecurityUtils;
import ro.lexit.web.exceptions.EroareAutorizare;

@Controller
@RequestMapping("/utilizator")
public class ControllerUtilizator {
	private ScreenInfo screen = new ScreenInfo()
		.setModule("administrare")
		.setScreenCode("utilizator")
		.setScreenTitle("Utilizatori")
		.setViewname("admin/utilizator")
		.setMenuTitle("admin")
		.setMenuLink("utilizator")
		.setMenuHead("administrare");
	
	@Autowired private DaoUtilizator dao;
	@Autowired private DaoRol daoRol;
	@Autowired private ValidatorUtilizator validator;
	@Autowired private ServiceUtilizator service;
	@Autowired private SecurityUtils securityUtils;
	
	@InitBinder 
	public void customizeBinding (WebDataBinder binder) { new ScreenAdapter().initBinder(binder); }
	
	@RequestMapping("/list")
	private String list(WebRequest webRequest, Model model) {
		securityUtils.authorize("utilizator", "read");
		new ScreenAdapter(screen, webRequest)
			.setDao(dao)
			.setFilterClass(FUtilizator.class)
			.initModel(model)
			.buildForList(model);
		addForList(model);
		return screen.getViewname();
	}
	
    @RequestMapping(value="/view", method=RequestMethod.GET)
    private String view(WebRequest webRequest, Model model) {
		securityUtils.authorize("utilizator", "read");
    	ScreenAdapter adapter = new ScreenAdapter(screen, webRequest).setDao(dao);
    	Utilizator utilizator = adapter.initModel(model).buildForViewable(model, VIEW);
    	List<IDataRecord> listRol = daoRol.readList();
    	FRol filter = new FRol().setUtilizator(utilizator);
    	List<IDataRecord> listRoluriUtilizator = daoRol.readList(new DataQuery().setFilter(filter));
		List<RolCurent> listRolCurent = new ArrayList<>();
		for(IDataRecord rol : listRol) {
			RolCurent rolCurent = new RolCurent();
			rolCurent.setRol((Rol) rol);
			boolean apears = false;
			for(IDataRecord roluriUtilizator : listRoluriUtilizator) {
				apears = false;
				if(((Rol) roluriUtilizator).getId().equals(rolCurent.getRol().getId())) {
					apears = true;
					break;
				}
			}
			if(apears) {
				rolCurent.setAllowed(true);
			}
			else {
				rolCurent.setAllowed(false);
			}
			listRolCurent.add(rolCurent);
		}
		model.addAttribute("listRolCurent", listRolCurent);
		return screen.getViewname();
    }
    
	@RequestMapping(value="/edit", method=RequestMethod.GET)
	private String edit(WebRequest webRequest, Model model) throws EroareAutorizare {
		securityUtils.authorize("utilizator", "write");
		ScreenAdapter adapter = new ScreenAdapter(screen, webRequest).setDao(dao);
		Utilizator utilizator = adapter.initModel(model).buildForViewable(model, EDIT);
		List<IDataRecord> listRol = daoRol.readList();
    	FRol filter = new FRol().setUtilizator(utilizator);
    	List<IDataRecord> listRoluriUtilizator = daoRol.readList(new DataQuery().setFilter(filter));
		List<RolCurent> listRolCurent = new ArrayList<>();
		for(IDataRecord rol : listRol) {
			RolCurent rolCurent = new RolCurent();
			rolCurent.setRol((Rol) rol);
			boolean apears = false;
			for(IDataRecord roluriUtilizator : listRoluriUtilizator) {
				apears = false;
				if(((Rol) roluriUtilizator).getId().equals(rolCurent.getRol().getId())) {
					apears = true;
					break;
				}
			}
			if(apears) {
				rolCurent.setAllowed(true);
			}
			else {
				rolCurent.setAllowed(false);
			}
			listRolCurent.add(rolCurent);
		}
		model
			.addAttribute("listRolCurent", listRolCurent);
		return screen.getViewname();
	}
	
	@RequestMapping(value="/add", method=RequestMethod.GET)
	private String add(Model model) throws EroareAutorizare {
		securityUtils.authorize("utilizator", "write");
		new ScreenAdapter(screen).initModel(model);
		List<IDataRecord> listRol = daoRol.readList();
		List<RolCurent> listRolCurent = new ArrayList<>();
		for(IDataRecord rol : listRol) {
			RolCurent rolCurent = new RolCurent();
			rolCurent.setRol((Rol) rol);
			rolCurent.setAllowed(false);
			listRolCurent.add(rolCurent);
		}
		model
			.addAttribute("record", new Utilizator())
			.addAttribute("listRolCurent", listRolCurent)
			.addAttribute("ss", ADD);
		return screen.getViewname();
    }
    
	@RequestMapping(value="/create", method=RequestMethod.POST)
    private String create(@ModelAttribute("record") Utilizator utilizator, BindingResult result, Model model, HttpServletRequest request) {
   		validator.validate(utilizator, result);
	    if(result.hasErrors()) {
	    	new ScreenAdapter(screen).initModel(model);
			List<IDataRecord> listRol = daoRol.readList();
			List<RolCurent> listRolCurent = new ArrayList<>();
			for(IDataRecord rol : listRol) {
				RolCurent rolCurent = new RolCurent();
				rolCurent.setRol((Rol) rol);
				rolCurent.setAllowed(false);
				listRolCurent.add(rolCurent);
			}
			model
				.addAttribute("listRolCurent", listRolCurent)
				.addAttribute("record", utilizator)
				.addAttribute("ss", ADD)
				.addAttribute("ls", "ls");
			return screen.getViewname();
	    }
	    String passEnc = EncryptionUtils.encrypt(utilizator.getParola());
	    utilizator.setParola(passEnc);
	    service.create(utilizator);
	    dao.createRoluri(utilizator.getId(), 3);
	    
		String[] roluri = request.getParameterValues("roluriAlese");
		if(roluri != null) {
			for(int i = 0; i < roluri.length; ++i) {
				dao.createRoluri(utilizator.getId(), Integer.parseInt(roluri[i]));
			}
		}
	    return "redirect: view?id=" + utilizator.getId() + "&ls=1";
    }
   
    @RequestMapping(value="/update", method=RequestMethod.POST)
    private String update(@ModelAttribute("record") Utilizator utilizator, BindingResult result, Model model, HttpServletRequest request) {
    	validator.validate(utilizator, result);
	    if(result.hasErrors()) {
	    	new ScreenAdapter(screen).initModel(model);
	    	List<IDataRecord> listRol = daoRol.readList();
	    	FRol filter = new FRol().setUtilizator(utilizator);
	    	List<IDataRecord> listRoluriUtilizator = daoRol.readList(new DataQuery().setFilter(filter));
			List<RolCurent> listRolCurent = new ArrayList<>();
			for(IDataRecord rol : listRol) {
				RolCurent rolCurent = new RolCurent();
				rolCurent.setRol((Rol) rol);
				boolean apears = false;
				for(IDataRecord roluriUtilizator : listRoluriUtilizator) {
					apears = false;
					if(((Rol) roluriUtilizator).getId().equals(rolCurent.getRol().getId())) {
						apears = true;
						break;
					}
				}
				if(apears) {
					rolCurent.setAllowed(true);
				}
				else {
					rolCurent.setAllowed(false);
				}
				listRolCurent.add(rolCurent);
			}
			model
				.addAttribute("listRolCurent", listRolCurent)
				.addAttribute("record", utilizator)
		    	.addAttribute("ss", EDIT)
		    	.addAttribute("ls", "ls");
			return screen.getViewname();
	    }
	    dao.deleteRoluri(utilizator.getId());
		String[] roluri = request.getParameterValues("roluriAlese");
		if(roluri != null) {
			for(int i = 0; i < roluri.length; ++i) {
				dao.createRoluri(utilizator.getId(), Integer.parseInt(roluri[i]));
			}
		}
	    dao.update(utilizator);
	    return "redirect: view?id=" + utilizator.getId() + "&ls=1";
    }
   
    @RequestMapping("/delete")
    private String delete(@RequestParam("id") Integer id) {
		securityUtils.authorize("utilizator", "write");
		service.delete(id);
	    return "redirect: list";
    }

	/*
	 * Methods - private
	 */

	private void addForList(Model model) {
		model
			.addAttribute("listRol", daoRol.readList());
	}
}
