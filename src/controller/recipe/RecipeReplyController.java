package controller.recipe;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import service.recipe.RecipeDetailService;
import service.recipe.RecipeReplyService;

@Controller
@RequestMapping("/recipe")
public class RecipeReplyController {
	@Autowired
	Gson gson;
	@Autowired
	RecipeReplyService rReplyService;
	@Autowired
	RecipeDetailService rDetailService;

	
	@RequestMapping(path="/replyInput",produces="application/json;charset=utf-8")
	@ResponseBody
	public String recipeInputHandle(@RequestParam Map<String,String> param,HttpSession session) {
		// recipe_reply 테이블에 댓글 등록  
		// 아이디(댓글 작성자), 댓글내용, recipe_info 기본키 필요.
		String id = (String)session.getAttribute("logon");
		Map<String,String> map = new HashMap<>();
			
		if(id == null) {
			map.put("rst", "login");
		} else {
			if(param.get("rate") == null) {
				map.put("rst", "rate");
			} else if(param.get("content").equals("")) {
				map.put("rst", "content");
			} else {
				rReplyService.inputReply(id,param);
				map.put("rst", "yy");
			}
		}
		
		return gson.toJson(map);
	}
	
	@RequestMapping(path="/replyGet",produces="application/json;charset=utf-8")
	@ResponseBody
	public String recipeGetHandle(@RequestParam String ino,HttpSession session) {
		// recipe_reply 테이블 등록 성공 후, ajax로 해당 페이지 전체댓글 가져오는 과정.
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		String id = (String)session.getAttribute("logon");
		
		try {
			list = rReplyService.getReplyAjax(ino,id);
				
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return gson.toJson(list);
	}
	
	//댓글 삭제 처리용 컨트롤러 
	@RequestMapping("/replyDel")
	public String replyDelHandle(@RequestParam String rno,Model model) {
		
		// rno로 recipe_info 의 pk 값 탐색.
		String no = rReplyService.getNo(rno);
		// 댓글 삭제
		boolean rst = rReplyService.delReply(rno);
		
		// 이 아래부터 댓글 삭제 후 리턴 시, 페이지 출력 위한 데이터 셋팅 작업들
		Map info = rDetailService.getInfo(no);
		List<Map> detail = rDetailService.getDetail(no);
		
		String id = (String)info.get("ID");
		Map profile = rDetailService.getProfile(id);
		
		String items = (String)info.get("ITEMS");
		String[] itemAr = items.split("#");
			info.put("ITEMS", itemAr);
		
		// 요리 완성된 사진들 담아주기
		List<Map> fphoto = rDetailService.getFinal(no);	
		// 댓글 출력 위한 작업.
		List<Map<String,Object>> reply = rReplyService.getReply(no);	
		
		model.addAttribute("profile", profile);
		model.addAttribute("info", info);
		model.addAttribute("detail", detail);
		model.addAttribute("fphoto", fphoto);
		model.addAttribute("reply",reply);
		model.addAttribute("rate",rReplyService.getAvg(no));
		model.addAttribute("body", "/WEB-INF/view/recipeDetail.jsp");
		
		return "index";
	}
	
	
	
}
