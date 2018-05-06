package ro.lexit.web.controller.filmInd;

import static ro.lexit.common.dataValues.ScreenStatus.LIST;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.WebRequest;

import ro.lexit.app.dao.filmInd.DaoFilm;
import ro.lexit.common.dataFilters.filmInd.FFilm;
import ro.lexit.common.dataRecords.admin.Utilizator;
import ro.lexit.common.dataValues.ScreenInfo;
import ro.lexit.common.utils.DataQuery;
import ro.lexit.common.utils.DataUtils;
import ro.lexit.common.utils.IDataRecord;
import ro.lexit.common.utils.Pager;
import ro.lexit.web.core.ScreenAdapter;
import ro.lexit.web.core.SecurityUtils;
import ro.lexit.web.exceptions.EroareAutorizare;

@Controller
@RequestMapping("/favorit")
public class ControllerFavorit {
	
	private ScreenInfo screen = new ScreenInfo()
			.setModule("filmInd")
			.setScreenCode("favorit")
			.setScreenTitle("Filme favorite")
			.setViewname("filmInd/favorit")
			.setMenuTitle("app")
			.setMenuLink("favorite")
			.setMenuHead("filmInd");
	
	@Autowired private DaoFilm dao;
	@Autowired private SecurityUtils securityUtils;
	
	@RequestMapping(value = "/list")
	private String list(@ModelAttribute("filter") FFilm originalFilter, WebRequest webRequest, Model model) throws EroareAutorizare {
		Utilizator user = securityUtils.getCurrentUser();
		if (user == null) {
			EroareAutorizare ex = new EroareAutorizare("favorite", "read");
			throw (ex);
		}
		ScreenAdapter screenAdapter = new ScreenAdapter(screen, webRequest)
			.initModel(model);
		FFilm filter = (FFilm) DataUtils.cloneFilter(originalFilter);
		filter.setUser(user);
		DataQuery qry = new DataQuery().setFilter(filter);
		int recordCount = dao.readRecordCount(qry);
		Pager pager = screenAdapter.getPager(recordCount);
		RowBounds rb = new RowBounds(pager.getRecordNoMin(), pager.getPageSize());
		List<IDataRecord> recordList = dao.readList(qry, rb);
		model
			.addAttribute("recordList", recordList)
			.addAttribute("filter", originalFilter)
			.addAttribute("pager", pager)
			.addAttribute("ss", LIST);
		return screen.getViewname();
	}
}