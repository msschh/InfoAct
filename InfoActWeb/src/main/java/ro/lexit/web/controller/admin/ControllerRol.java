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

import ro.lexit.app.dao.admin.DaoDrept;
import ro.lexit.app.dao.admin.DaoRol;
import ro.lexit.app.validator.admin.ValidatorRol;
import ro.lexit.common.dataFilters.admin.FDrept;
import ro.lexit.common.dataFilters.admin.FRol;
import ro.lexit.common.dataRecords.admin.Drept;
import ro.lexit.common.dataRecords.admin.Rol;
import ro.lexit.common.dataValues.DreptCurent;
import ro.lexit.common.dataValues.ScreenInfo;
import ro.lexit.common.utils.DataQuery;
import ro.lexit.common.utils.IDataRecord;
import ro.lexit.web.core.ScreenAdapter;
import ro.lexit.web.core.SecurityUtils;
import ro.lexit.web.exceptions.EroareAutorizare;

@Controller
@RequestMapping("/rol")
public class ControllerRol {
	private ScreenInfo screen = new ScreenInfo()
		.setModule("administrare")
		.setScreenCode("rol")
		.setScreenTitle("Roluri")
		.setViewname("admin/rol")
		.setMenuTitle("admin")
		.setMenuLink("rol")
		.setMenuHead("administrare");
	
	@Autowired private DaoRol dao;
	@Autowired private DaoDrept daoDrept;
	
	@Autowired private ValidatorRol validator;
	@Autowired private SecurityUtils securityUtils;
	
	@InitBinder 
	public void customizeBinding (WebDataBinder binder) { new ScreenAdapter().initBinder(binder); }
		
	@RequestMapping("/list")
	private String list(WebRequest webRequest, Model model) {
		securityUtils.authorize("rol", "read");
		ScreenAdapter adapter = new ScreenAdapter(screen, webRequest).setDao(dao).setFilterClass(FRol.class);
		adapter.initModel(model).buildForList(model);
		return screen.getViewname();
	}

	
	@RequestMapping(value="/view", method=RequestMethod.GET)
	private String view(WebRequest webRequest, Model model) {
		securityUtils.authorize("rol", "read");
		ScreenAdapter adapter = new ScreenAdapter(screen, webRequest).setDao(dao);
		Rol rol = adapter.initModel(model).buildForViewable(model, VIEW);
		List<IDataRecord> listDrept = daoDrept.readList();
		FDrept filter = new FDrept().setRol(rol);
		List<IDataRecord> listDrepturiRol = daoDrept.readList(new DataQuery().setFilter(filter));
		List<DreptCurent> listDreptCurent = new ArrayList<>();
		for(IDataRecord drept : listDrept) {
			DreptCurent dreptCurent = new DreptCurent();
			dreptCurent.setDrept((Drept) drept);
			boolean apears = false;
			for(IDataRecord drepturiRol : listDrepturiRol) {
				apears = false;
				if(((Drept) drepturiRol).getId().equals(dreptCurent.getDrept().getId())) {
					apears = true;
					break;
				}
			}
			if(apears) {
				dreptCurent.setAllowed(true);
			}
			else {
				dreptCurent.setAllowed(false);
			}
			listDreptCurent.add(dreptCurent);
		}
		model.addAttribute("listDreptCurent", listDreptCurent);
		return screen.getViewname();
	}	

	@RequestMapping(value="/add", method=RequestMethod.GET)
	private String add(Model model) throws EroareAutorizare {
		securityUtils.authorize("rol", "write");
		new ScreenAdapter(screen).initModel(model);
		List<IDataRecord> listDrept = daoDrept.readList();
		List<DreptCurent> listDreptCurent = new ArrayList<>();
		for(IDataRecord drept : listDrept) {
			DreptCurent dreptCurent = new DreptCurent();
			dreptCurent.setDrept((Drept) drept);
			dreptCurent.setAllowed(false);
			listDreptCurent.add(dreptCurent);
		}
		model
			.addAttribute("record", new Rol())
			.addAttribute("listDreptCurent", listDreptCurent)
			.addAttribute("ss", ADD);
		return screen.getViewname();
	}

	@RequestMapping(value="/edit", method=RequestMethod.GET)
	private String edit(WebRequest webRequest, Model model) throws EroareAutorizare {
		securityUtils.authorize("rol", "write");
		ScreenAdapter adapter = new ScreenAdapter(screen, webRequest).setDao(dao);
		Rol rol = adapter.initModel(model).buildForViewable(model, EDIT);
		List<IDataRecord> listDrept = daoDrept.readList();
		FDrept filter = new FDrept().setRol(rol);
		List<IDataRecord> listDrepturiRol = daoDrept.readList(new DataQuery().setFilter(filter));
		List<DreptCurent> listDreptCurent = new ArrayList<>();
		for(IDataRecord drept : listDrept) {
			DreptCurent dreptCurent = new DreptCurent();
			dreptCurent.setDrept((Drept) drept);
			boolean apears = false;
			for(IDataRecord drepturiRol : listDrepturiRol) {
				apears = false;
				if(((Drept) drepturiRol).getId().equals(dreptCurent.getDrept().getId())) {
					apears = true;
					break;
				}
			}
			if(apears) {
				dreptCurent.setAllowed(true);
			}
			else {
				dreptCurent.setAllowed(false);
			}
			listDreptCurent.add(dreptCurent);
		}
		model.addAttribute("listDreptCurent", listDreptCurent);
		return screen.getViewname();
	}
	
	@RequestMapping(value="/create", method=RequestMethod.POST)
	private String create(@ModelAttribute("record") Rol rol, BindingResult result, Model model, HttpServletRequest request) {
		validator.validate(rol, result);
		if (result.hasErrors()) {
			new ScreenAdapter(screen).initModel(model);
			List<IDataRecord> listDrept = daoDrept.readList();
			List<DreptCurent> listDreptCurent = new ArrayList<>();
			for(IDataRecord drept : listDrept) {
				DreptCurent dreptCurent = new DreptCurent();
				dreptCurent.setDrept((Drept) drept);
				dreptCurent.setAllowed(false);
				listDreptCurent.add(dreptCurent);
			}
			model
				.addAttribute("record", rol)
				.addAttribute("ss", ADD)
				.addAttribute("listDreptCurent", listDreptCurent)
				.addAttribute("ls", "ls");
			return screen.getViewname();
		}
		dao.create(rol);
		String[] drepturi = request.getParameterValues("drepturiAlese");
		if(drepturi != null) {
			for(int i = 0; i < drepturi.length; ++i) {
				dao.createDrepturi(rol.getId(), Integer.parseInt(drepturi[i]));
			}
		}
		return "redirect:view?id=" + rol.getId() + "&ls=1";
	}		

	@RequestMapping(value="/update", method=RequestMethod.POST)
	private String update(@ModelAttribute("record") Rol rol, BindingResult result, Model model, HttpServletRequest request) {
		validator.validate(rol, result);
		if (result.hasErrors()) {
			new ScreenAdapter(screen).initModel(model);
			List<IDataRecord> listDrept = daoDrept.readList();
			FDrept filter = new FDrept().setRol(rol);
			List<IDataRecord> listDrepturiRol = daoDrept.readList(new DataQuery().setFilter(filter));
			List<DreptCurent> listDreptCurent = new ArrayList<>();
			for(IDataRecord drept : listDrept) {
				DreptCurent dreptCurent = new DreptCurent();
				dreptCurent.setDrept((Drept) drept);
				boolean apears = false;
				for(IDataRecord drepturiRol : listDrepturiRol) {
					apears = false;
					if(((Drept) drepturiRol).getId().equals(dreptCurent.getDrept().getId())) {
						apears = true;
						break;
					}
				}
				if(apears) {
					dreptCurent.setAllowed(true);
				}
				else {
					dreptCurent.setAllowed(false);
				}
				listDreptCurent.add(dreptCurent);
			}
			model
				.addAttribute("record", rol)
				.addAttribute("ss", EDIT)
				.addAttribute("listDreptCurent", listDreptCurent)
				.addAttribute("ls", "ls");
			return screen.getViewname();
        }
		dao.deleteDrepturi(rol.getId());
		String[] drepturi = request.getParameterValues("drepturiAlese");
		if(drepturi != null) {
			for(int i = 0; i < drepturi.length; ++i) {
				dao.createDrepturi(rol.getId(), Integer.parseInt(drepturi[i]));
			}
		}
		dao.update(rol);
		return "redirect:view?id=" + rol.getId() + "&ls=1";
	}

	@RequestMapping("/delete")
	private String delete(@RequestParam("id") Integer id) {
		securityUtils.authorize("rol", "write");
		dao.delete(id);
		return "redirect: list";
	}		
}
