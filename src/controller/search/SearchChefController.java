package controller.search;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import service.search.SearchChefService;

@Controller
public class SearchChefController {

	@Autowired
	SearchChefService searchchefService;

	@RequestMapping("/cheflist")
	public String searchChefHandle(Model model, HttpSession session) {
		model.addAttribute("member", searchchefService.searchChef((String) session.getAttribute("logon")));
		model.addAttribute("body", "/WEB-INF/view/searchChef.jsp");
		return "index";
	}

	@RequestMapping(path = "/chefsearch", method = RequestMethod.GET, produces = "application/json;charset=utf-8")
	@ResponseBody
	public String searchHandle() {
		return "";
	}

}
