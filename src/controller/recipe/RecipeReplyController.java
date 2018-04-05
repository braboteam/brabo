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
			// 로그인 안한 경우 로그인 요청 
			map.put("rst", "login");
		} else {
			if(param.get("rate") == null) {
				// 평점 입력 안한 경우 평점 입력 요청 
				map.put("rst", "rate");
			} else if(param.get("content").equals("")) {
				// 내용 입력 안한 경우 내용입력 요청 
				map.put("rst", "content");
			} else {
				rReplyService.inputReply(id,param);
				// 댓글 입력 성공
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
	@RequestMapping(path="/replyDel",produces="application/json;charset=utf-8")
	@ResponseBody
	public String replyDelHandle(@RequestParam String rno,Model model,HttpSession session) {
		String id = (String)session.getAttribute("logon");
		boolean rst = false;
		
		if(id!=null) {
			// 작성자와 지우려는 사람이 동일인인지 체크 - true일때 지운다. 
			if(id.equals(rReplyService.chkId(rno)))
				rst = rReplyService.delReply(rno);
		}
			
		Map<String,Boolean> map = new HashMap<>();
			map.put("rst", rst);
		
		return gson.toJson(map);
	}
	
	
	
}
