package ro.lexit.web.controller.base;


import java.io.IOException;
import java.util.Date;
import java.util.UUID;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import ro.lexit.app.dao.base.DaoAtasament;
import ro.lexit.app.service.base.ServiceAtasament;
import ro.lexit.app.service.filmInd.ServiceRecunoastereFaciala;
import ro.lexit.common.dataRecords.base.Atasament;
import ro.lexit.common.dataValues.ScreenInfo;
import ro.lexit.common.dataValues.ScreenStatus;
import ro.lexit.web.core.ScreenAdapter;
import ro.lexit.web.core.SecurityUtils;
import ro.lexit.web.core.WebUtils;

@Controller
@RequestMapping("/atasament")
public class ControllerAtasament {
	
	private ScreenInfo screen = new ScreenInfo()
		.setModule("base")
		.setScreenCode("atasament")
		.setScreenTitle("Atașamente")
		.setViewname("base/atasament")
		.setMenuTitle("app")
		.setMenuHead("general")
		.setMenuLink("atasament");
	
	@Autowired private DaoAtasament dao;
	@Autowired private WebUtils webUtils;
	@Autowired private SecurityUtils securityUtils;
	@Autowired private ServiceAtasament serviceAtasament;
	@Autowired private ServiceRecunoastereFaciala serviceRecunoastereFaciala;
	
	@InitBinder 
	public void customizeBinding (WebDataBinder binder) { new ScreenAdapter().initBinder(binder); }

	/*
	 * Methods - GET
	 */

	@RequestMapping(value="/add", method=RequestMethod.GET)
	private String add(Model model) throws Exception {
		new ScreenAdapter(screen)
			.initModel(model)
			.buildForAdd(model, new Atasament());
		return screen.getViewname();
	}

	/*
	 * Methods - POST
	 */
	
	@RequestMapping(value="/create", method=RequestMethod.POST)
	private String create(@RequestParam("filecontent") CommonsMultipartFile filecontent, 
					@ModelAttribute("record") Atasament atasament, Model model) throws IOException {

		atasament.setUrl(UUID.randomUUID().toString() + "." + atasament.getTipFisier());
		webUtils.uploadFile(filecontent, serviceAtasament.getFilepathTest(atasament));
		model
			.addAttribute("urlImgInitiala", atasament.getUrl())
			.addAttribute("actorPrezis", serviceRecunoastereFaciala.recunoasteActor(atasament.getUrl()))
			.addAttribute("ss", ScreenStatus.VIEW);
		return screen.getViewname();
	}	

	@RequestMapping(value="/attach", method=RequestMethod.POST)
	private String attach(
		@RequestParam("filecontent") CommonsMultipartFile filecontent
		, @ModelAttribute("atasament") Atasament atasament
		, @RequestParam("screenCode") String screenCode
		, @RequestParam Integer parentRecordId
		) throws IOException {

		securityUtils.authorize("atasament", "write");
		atasament.setUrl(UUID.randomUUID().toString() + "." + atasament.getTipFisier());
		atasament.setCreatDe(securityUtils.getCurrentUser());
		atasament.setDtUpload(new Date());
		
		webUtils.uploadFile(filecontent, serviceAtasament.getFilepath(atasament));
		dao.create(atasament);
		
		String url = "redirect:/mvc/" + screenCode + "/view?ls=1&id=" + parentRecordId;
		return url;
	}

	@Transactional
	@RequestMapping("/delete")
	private String delete(@RequestParam("id") Integer id) throws IOException {
		securityUtils.authorize("atasament", "write");
		Atasament record = (Atasament) dao.read(id);
		String filepath = serviceAtasament.getFilepath(record);
		webUtils.deleteFile(filepath);
		dao.delete(id);
		return "redirect:list"; 
	}
}

