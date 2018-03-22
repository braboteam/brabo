package controller.recipe;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.MultiValueMap;
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
	public String inputGetHandle(Model model) {
		System.out.println("recipe 등록폼 접근");
		
		model.addAttribute("body","/WEB-INF/view/recipeInput.jsp");
		return"index";
	}
	
	// 레시피 등록
	@RequestMapping(path="/input",method=RequestMethod.POST)
	public String inputPostHandle(@RequestParam MultiValueMap<String, List> param, @RequestParam(name="iphoto") MultipartFile iphoto,
			@RequestParam(name="dphoto") MultipartFile[] dphoto,HttpSession session) {
		
		System.out.println(param);
		String id = (String)session.getAttribute("logon");

		// recipe_info 에 집어넣기 - info 맵에 필요한 정보 담아서 service에 전달.
		Map info = new HashMap<>();
			info.put("id", id);
			info.put("title", param.get("title").get(0));
			info.put("info", param.get("info").get(0));
			info.put("cate", param.get("cate").get(0));
			info.put("portion", param.get("portion").get(0));
			info.put("time", param.get("time").get(0));
		
		// list에서 뽑아서, #으로 구분자 넣어서 items 칼럼에 스트링으로 집어넣기.
		List items = param.get("item");
		String input = "";
			for(int i=0; i< param.get("item").size()-1; i++) {
				
				input += param.get("item").get(i) +"#" +param.get("item").get(i+1)+"#";
			}
			info.put("items", input);
			
		// recipe_detail에 집어넣기 - 아래서 rst 가 true 인 경우.. detail 맵 만들어서 전달.	
		Map detail = new HashMap<>();
			detail.put("step", param.get("step"));
			detail.put("recipe", param.get("recipe"));
			
		try {
			boolean rst = recipeService.inputInfo(info,iphoto);
			if(rst) {
				recipeService.inputDetail(id,detail,dphoto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}	
		
		
		return "list";
	}
	
	
}
