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
	public String listHandle(Model model,@RequestParam(defaultValue="1")int p) {
		System.out.println("recipeListController 접근..");
		List<Map<String,Object>> rInfo = rListService.getAllInfo();
		
		// 전체 페이지 수 출력용...
		int totalCnt = rListService.getAllList();
		if(totalCnt%9 == 0)
			totalCnt = totalCnt/9;
		else
			totalCnt = totalCnt/9 + 1;
		
		// 3 자리에 9 곱해주면 한 화면에 3행 3열씩 출력된다.
		// substring을 할 때, end에서 데이터가 없으면 터질 수 있으므로, 이 점 생각해서 세팅한다.
		// 파라미터 p값을  view에서 어떤식으로 넘겨받아야 할지?? 하단 페이징처리된 버튼 클릭시 넘겨 받을 수 있게 링크 걸어두면 될듯? 
		
		int t = 9;
		int begin = (p-1)*t;
		int end = p*t;
		if(end > rInfo.size()) 
			end = rInfo.size();
		
		model.addAttribute("page", p);
		model.addAttribute("totalCnt",totalCnt);
		model.addAttribute("list",rInfo.subList(begin, end));
		model.addAttribute("body", "/WEB-INF/view/recipeList.jsp");
		
		return "index";
	}
	
}
