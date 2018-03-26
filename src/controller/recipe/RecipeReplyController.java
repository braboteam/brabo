package controller.recipe;

import java.util.HashMap;
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
	RecipeReplyService rRelyService;
	
	
	@RequestMapping(path="/replyInput",produces="application/json;charset=utf-8")
	@ResponseBody
	public String recipeInputHandle(@RequestParam Map<String,String> param,HttpSession session) {
		// 아이디(댓글 작성자), 댓글내용, recipe_info 기본키 필요.
		String id = (String)session.getAttribute("logon");
		boolean rst = rRelyService.inputReply(id,param);
		Map<String,Boolean> map = new HashMap<>();
		
		if(rst) 
			map.put("rst", true);
		 else 
			map.put("rst", false);

		return gson.toJson(map);
	}
	
}
