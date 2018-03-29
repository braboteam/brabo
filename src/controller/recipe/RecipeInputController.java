package controller.recipe;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import service.recipe.RecipeInputService;

@Controller
@RequestMapping("/recipe")
public class RecipeInputController {
	@Autowired
	RecipeInputService recipeService;
	

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
			@RequestParam(name="dphoto") MultipartFile[] dphoto,@RequestParam MultipartFile[] fphoto,HttpSession session, Model model) {
		
		System.out.println(param);
		String id = (String)session.getAttribute("logon");

		// recipe_info 에 집어넣기 - info 맵에 필요한 정보 담아서 service에 전달.
		Map<String,Object> info = new HashMap<>();
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
				if(i == 0 || i % 2 == 0) {
					if(i == param.get("item").size()-2)
						input += param.get("item").get(i) +"#" +param.get("item").get(i+1);
					else 	
						input += param.get("item").get(i) +"#" +param.get("item").get(i+1)+"#";
				}	
			}
			info.put("items", input);
		// file rename.. recipe_info 테이블 pk 가져오기 위해 여기서 만든다....	
		String rename = UUID.randomUUID().toString().substring(0, 12)+".jpg";
			info.put("iphoto", rename);
		
		boolean infoRst = false;
		boolean detailRst = false;
		boolean finalRst = false;
			try {
				infoRst = recipeService.inputInfo(info,iphoto);
				if(infoRst) {
					// recipe_detail에 집어넣기 - 아래서 rst 가 true 인 경우.. detail 맵 만들어서 전달.	
					Map<String,Object> detail = new HashMap<>();
					detail.put("ino", recipeService.getInfoNo(rename));
					detail.put("step", param.get("step"));
					detail.put("recipe", param.get("recipe"));
					
					detailRst = recipeService.inputDetail(id,detail,dphoto);
					if(detailRst)
						finalRst = recipeService.inputFinal(id,recipeService.getInfoNo(rename),fphoto);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}	
			
			if(infoRst && detailRst) {
				
			}
			
			System.out.println(finalRst);
			
			model.addAttribute("body", "/WEB-INF/view/recipeList.jsp");
			return "index";
	}
			
	
	
}
