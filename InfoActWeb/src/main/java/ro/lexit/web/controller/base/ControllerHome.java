package ro.lexit.web.controller.base;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import ro.lexit.common.dataRecords.admin.Utilizator;
import ro.lexit.common.dataValues.ScreenStatus;
import ro.lexit.web.core.SecurityUtils;

@Controller
public class ControllerHome {

    private final String viewname = "base/home";
    private final String screenTitle = "InfoAct";

    @Autowired private SecurityUtils securityUtils;

    @RequestMapping("/home")
    public String goHome(Model model) {
        boolean isAuthenticated = securityUtils.isAuthenticated();
        model
            .addAttribute("ss", ScreenStatus.VIEW)
            .addAttribute("isAuth", isAuthenticated)
            .addAttribute("screenTitle", screenTitle)
            .addAttribute("menuTitle", "myAccount")
            .addAttribute("menuLink", "home")
            .addAttribute("menuHead", "contulMeu");

        if (isAuthenticated) {
            Utilizator utilizator = securityUtils.getCurrentUser();
            String myName = utilizator.getNume();
            model
            	.addAttribute("myName", myName);
        }

        return "redirect:atasament/add";
    }

    @RequestMapping("/error/404")
    private String showEroare404(Model model) {
        return "err/error404";
    }

    @RequestMapping("/underConstruction")
    private String underCstr(Model model) {
    	return "err/underConstruction";
    }
}