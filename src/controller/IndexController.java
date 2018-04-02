package controller;

import java.util.HashMap;
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
		// 카테고리 별로 나눠서 recipe_info 테이블에서 right=1인 데이터만 뽑아온다.
		List<Map<String,Object>> all = rListService.getAllInfo();
		
		List list = rListService.getAllCate(all);
		
		System.out.println(list);
		
		model.addAttribute("cateChk",list);
		model.addAttribute("all", all);
		model.addAttribute("body", "/WEB-INF/view/indexBody.jsp");
		return "index";
		
	}

	@RequestMapping("/")
	public String b(Model model) {
		// 카테고리 별로 나눠서 recipe_info 테이블에서 right=1인 데이터만 뽑아온다.
		List<Map<String,Object>> all = rListService.getAllInfo();
		
		List list = rListService.getAllCate(all);
		
		System.out.println(list);
		
		model.addAttribute("cateChk",list);
		model.addAttribute("all", all);
		model.addAttribute("body", "/WEB-INF/view/indexBody.jsp");
		return "index";
	}
}
