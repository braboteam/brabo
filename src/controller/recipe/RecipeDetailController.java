package controller.recipe;

import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import service.recipe.RecipeDetailService;
import service.recipe.RecipeListService;
import service.recipe.RecipeReplyService;

@Controller
@RequestMapping("/recipe")
public class RecipeDetailController {
	@Autowired
	RecipeDetailService rDetailService;
	@Autowired
	RecipeReplyService rReplyService;
	
	
	@RequestMapping(path="/list/{no}",method=RequestMethod.GET)
	public String detailGethandle(@PathVariable String no,HttpSession session,Model model ) {
		
		System.out.println("recipeDetail 페이지 접근");
		Map info = rDetailService.getInfo(no);
		List<Map> detail = rDetailService.getDetail(no);
		String id = (String)info.get("ID");
		Map profile = rDetailService.getProfile(id);
		
		String items = (String)info.get("ITEMS");
		String[] itemAr = items.split("#");
			info.put("ITEMS", itemAr);
			
		// 댓글 출력 위한 작업.
		List<Map<String,Object>> reply = rReplyService.getReply(no);	
			
		model.addAttribute("profile", profile);
		model.addAttribute("info", info);
		model.addAttribute("detail", detail);
		model.addAttribute("reply",reply);
		model.addAttribute("rate",rReplyService.getAvg(no));
		model.addAttribute("body", "/WEB-INF/view/recipeDetail.jsp");
		
		return "index";
	}
	
	
}
