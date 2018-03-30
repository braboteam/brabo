package controller.recipeAuth;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import service.recipeAuth.RecipeAuthService;

@Controller
@RequestMapping("/admin")
public class RecipeAuthController {
	@Autowired
	RecipeAuthService rAuthService;

	
	@RequestMapping(path="/recipeAuth",method=RequestMethod.GET)
	public String authGetHandle(HttpSession session,Model model) {
		String id = (String)session.getAttribute("logon");
		boolean chk = false;
		
		if(id != null)
			chk = rAuthService.checkAdmin(id);
		
		if(chk) {
			// 관리자인 경우 
			List<Map> list = rAuthService.getAllRecipe();
			model.addAttribute("print", list);
		} else {
			// 관리자 아닌 경우 
			
		}
		
		model.addAttribute("body", "/WEB-INF/view/admin.jsp");
		
		return "index";
	}
	
	@RequestMapping(path="/recipeAuth",method=RequestMethod.POST)
	public String recipeAuthHandle(@RequestParam String no) {
		boolean rst = rAuthService.authReciep(no);
		
		return "";
	}
}
