package controller.recipe;

import java.util.*;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import service.recipe.RecipeService;

@Controller
@RequestMapping("/recipe")
public class RecipeController {
	@Autowired
	RecipeService recipeService;
	
	
	@RequestMapping(path="/list",method=RequestMethod.GET)
	public String listGetHandle() {
		
		return "";
	}
	
	// 레시피 등록폼 접근
	@RequestMapping(path="/input",method=RequestMethod.GET)
	public String inputGetHandle() {
		
		return"recipeInput";
	}
	
	// 레시피 등록
	@RequestMapping(path="/input",method=RequestMethod.POST)
	public String inputPostHandle(@RequestParam Map<String,Object> param, @RequestParam(name="iphoto") MultipartFile iphoto,
			@RequestParam(name="dphoto") MultipartFile[] dphoto,HttpSession session) {
		
		System.out.println(param.toString());
		String id = (String)session.getAttribute("logon");

		// recipe_info 에 집어넣기 - info 맵에 필요한 정보 담아서 service에 전달.
		Map info = new HashMap<>();
			info.put("id", id);
			info.put("title", param.get("title"));
			info.put("info", param.get("info"));
			info.put("cate", param.get("cate"));
			info.put("portion", param.get("portion"));
			info.put("time", param.get("time"));
			
		
		boolean rst = recipeService.inputRecipe(param,dphoto);
		
		return "list";
	}
	
	
}
