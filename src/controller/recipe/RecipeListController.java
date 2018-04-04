package controller.recipe;

import java.util.ArrayList;
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
	public String listHandle(Model model,@RequestParam(defaultValue="1")int p,@RequestParam(defaultValue="all") String s,
			@RequestParam(defaultValue="ignore") String r,@RequestParam(defaultValue="not") String c) {
		System.out.println("recipeListController 접근..");
		List<Map<String,Object>> rInfo = new ArrayList();
		
		System.out.println(s);
		System.out.println(c);
		
		if (s.equals("all")) {
			if(r.equals("ignore")) {
				if(c.equals("not")) {
					// 아무 조건없이 모든 데이터 가져오기
					rInfo = rListService.getAllInfo();
				}	
			}
		}	
		else if(s.equals("cate")){
			if(r.equals("ignore")) {
				// 카테고리로 데이터 가져오기
				rInfo = rListService.getAllInfoByCate(s);
			}
			if(c.equals("not")) {
				// 레시피페이지 처음 접근하거나,
				// show all 눌렀을 때 작동.
				rInfo = rListService.getAllInfo();
			}	
			if(!c.equals("not")) {
				// 카테고리에서 텍스트로 검색.
				rInfo = rListService.getAllInfoByCate(c);
			}
			if(r.equals("rate") && c.equals("not")) {
				// 평점순으로 데이터 가져오기
				rInfo = rListService.getAllInfoByRate(s);
			}
		} else if(s.equals("cnt")) {
			if(!c.equals("not")) {
				// 카테고리+제목에서 텍스트로 검색.
				rInfo = rListService.getAllInfoByCateAndTitle(c);
			}
			if(c.equals("not")) {
				// select tag에서 카테고리+제목인 상태에서 show all 눌렀을 때 작동
				rInfo = rListService.getAllInfo();
			}
			if(r.equals("rate") && c.equals("not")) {
				// 평점순으로 데이터 가져오기
				rInfo = rListService.getAllInfoByRate(s);
			}
		} else {
			// 인덱스 페이지에서 더보기 눌러서 넘어올때 작동.
			rInfo = rListService.getAllInfoByCate(s);
		}
			
		
		// 한 페이지당 출력될 행수
		int row = 9;
		
		// 전체 페이지 수 출력용...
		int totalCnt = rInfo.size();
		if(totalCnt % row == 0)
			totalCnt = totalCnt/row;
		else
			totalCnt = totalCnt/row + 1;
		
		// subList을 할 때, end에서 데이터가 없으면 터질 수 있으므로, 이 점 생각해서 세팅한다.
		// 파라미터 p값을  view에서 어떤식으로 넘겨받아야 할지?? 하단 페이징처리된 버튼 클릭시 넘겨 받을 수 있게 링크 걸어두면 될듯? 
		
		int begin = (p-1)*row;
		int end = p*row;
		if(end > rInfo.size()) 
			end = rInfo.size();
		
		model.addAttribute("page", p);
		model.addAttribute("totalCnt",totalCnt);
		model.addAttribute("list",rInfo.subList(begin, end));
		model.addAttribute("body", "/WEB-INF/view/recipeList.jsp");
		
		return "index";
	}
	
}
