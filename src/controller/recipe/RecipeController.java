package controller.recipe;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/recipe")
public class RecipeController {

	
	
	@RequestMapping(path="/list",method=RequestMethod.GET)
	public String listGetHandle() {
		
		return "";
	}
	
	@RequestMapping(path="/input",method=RequestMethod.GET)
	public String inputGetHandle() {
		
		return"recipeInput";
	}
	
	@RequestMapping(path="/input",method=RequestMethod.POST)
	public String inputPostHandle() {
		
		return "";
	}
	
	
}
