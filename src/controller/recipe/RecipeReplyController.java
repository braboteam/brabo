package controller.recipe;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import service.recipe.RecipeReplyService;

@Controller
@RequestMapping("/recipe")
public class RecipeReplyController {
	@Autowired
	Gson gson;
	@Autowired
	RecipeReplyService rReplyService;

	
	@RequestMapping(path="/replyInput",produces="application/json;charset=utf-8")
	@ResponseBody
	public String recipeInputHandle(@RequestParam Map<String,String> param,HttpSession session) {
		// recipe_reply 테이블에 댓글 등록  
		// 아이디(댓글 작성자), 댓글내용, recipe_info 기본키 필요.
		String id = (String)session.getAttribute("logon");
		Map<String,String> map = new HashMap<>();
		
		if(param.size() == 3) {
			if(param.get("content").equals(""))
				map.put("rst", "content");
			else {
				rReplyService.inputReply(id,param);
				map.put("rst", "yy");
			}
		} else {
			if(id == null) 
				map.put("rst", "login");
			else if(param.get("rate") == null)
				map.put("rst", "rate");
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
			list = rReplyService.getReply(ino);
				list.add(rReplyService.getAvg(ino));
				list.add(rReplyService.getProfile(id));
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return gson.toJson(list);
	}
	
	
	
	
}
