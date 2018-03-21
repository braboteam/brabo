package controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {

	@RequestMapping("/index")
	public String a(Model model) {
		model.addAttribute("body", "/WEB-INF/view/indexBody.jsp");
		return "index";
	}
}
