package controller.recipeAuth;

import java.util.ArrayList;
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
	public String authGetHandle(HttpSession session,Model model,@RequestParam(defaultValue="1") int p) {
		String id = (String)session.getAttribute("logon");
		boolean chk = false;
		List<Map> list = new ArrayList();
		
		if(id != null)
			chk = rAuthService.checkAdmin(id);
	
		if(chk) {
			// 관리자인 경우 
			list = rAuthService.getAllRecipe();
			
			// 페이징 출력 위한 작업..
			int row = 13;
			int totalCnt = rAuthService.getAllList();
			if(totalCnt % row == 0)
				totalCnt = totalCnt/row;
			else
				totalCnt = totalCnt/row + 1;
			
			int t = row;
			int begin = (p-1)*t;
			int end = p*t;
			if(end > list.size()) 
				end = list.size();
			
			model.addAttribute("page", p);
			model.addAttribute("totalCnt",totalCnt);
			model.addAttribute("recipe", list.subList(begin, end));
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
