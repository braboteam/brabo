package controller.recipe;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import service.recipe.RecipeListService;

@Controller
@RequestMapping("/recipe")
public class RecipeListController {
	@Autowired
	RecipeListService rListService;
	
	@RequestMapping("/list")
	public String listHandle(@RequestParam Map<String,String> param,Model model) {
		System.out.println("recipeListController 접근..");
		List<Map<String,Object>> rInfo = rListService.getAllInfo();
		
		int startPage = (param.get("startPage") != null? Integer.valueOf(param.get("startPage")) : 1);
		int visiblePage = (param.get("visiblePage") != null? Integer.valueOf(param.get("visiblePage")) : 10);
		
		int totalCnt = rListService.getAllList();
		
		model.addAttribute("startPage",startPage);
		model.addAttribute("visiblePage", visiblePage);
		model.addAttribute("totalPage",param.get("totalPage"));
		model.addAttribute("list",rInfo);
		model.addAttribute("body", "/WEB-INF/view/recipeList.jsp");
		
		return "index";
	}
	
}
