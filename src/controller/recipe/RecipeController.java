package controller.recipe;

import java.util.*;

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
	
	@RequestMapping(path="/input",method=RequestMethod.GET)
	public String inputGetHandle() {
		
		return"recipeInput";
	}
	
	@RequestMapping(path="/input",method=RequestMethod.POST)
	public String inputPostHandle(@RequestParam Map<String,String> param,MultipartFile photo) {
		
		return "list";
	}
	
	
}
