package controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import service.recipe.RecipeListService;

@Controller
public class IndexController {
	@Autowired
	RecipeListService rListService;
	
	
	@RequestMapping("/index")
	public String a(Model model) {
		model.addAttribute("body", "/WEB-INF/view/indexBody.jsp");
		return "index";
	}

	@RequestMapping("/")
	public String b(Model model) {
		List<Map<String,Object>> list = rListService.getAllInfo();
		for(Map m : list ) {
			
		}
		
		
		
		model.addAttribute("list",list);
		model.addAttribute("body", "/WEB-INF/view/indexBody.jsp");
		return "index";
	}
}
