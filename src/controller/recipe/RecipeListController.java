package controller.recipe;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import service.recipe.RecipeListService;

@Controller
@RequestMapping("/recipe")
public class RecipeListController {
	@Autowired
	RecipeListService rListService;
	
	@RequestMapping("/list")
	public String listHandle(Model model) {
		System.out.println("recipeListController 접근..");
		List<Map<String,Object>> rInfo = rListService.getAllInfo();
		model.addAttribute("list",rInfo);
		model.addAttribute("body", "/WEB-INF/view/recipeList.jsp");
		
		return "index";
	}
	
}
