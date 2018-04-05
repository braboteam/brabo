package controller.admin;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import service.admin.RecipeAuthService;

@Controller
@RequestMapping("/admin")
public class RecipeAuthController {
	@Autowired
	RecipeAuthService rAuthService;
	@Autowired
	Gson gson;

	
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
			int row = 15;
			int totalCnt = rAuthService.getAllList();
			if(totalCnt % row == 0)
				totalCnt = totalCnt/row;
			else
				totalCnt = totalCnt/row + 1;
			
			int begin = (p-1)*row;
			int end = p*row;
			if(end > list.size()) 
				end = list.size();
			
			model.addAttribute("page", p);
			model.addAttribute("totalCnt",totalCnt);
			model.addAttribute("recipe", list.subList(begin, end));
		} 
		
		model.addAttribute("body", "/WEB-INF/view/admin.jsp");
		
		return "index";
	}
	
	// 관리자 페이지에서 레시피 승인 변경 처리 받기..
	@RequestMapping(path="/recipeAuth",method=RequestMethod.POST,produces="application/json;charset=utf-8")
	@ResponseBody
	public String recipeAuthHandle(@RequestParam String no,HttpServletResponse resp,HttpSession session,HttpServletRequest req) {
		boolean rst = rAuthService.authReciep(no);
		Map<String,Boolean> map = new HashMap<>();
			map.put("rst", rst);
		// 변경된 레시피 권한 값이 0 인지 1인지 확인하는 과정
		if(rst) {
			boolean chk = rAuthService.checkRight(no);
			System.out.println("chkAuth "+ chk);
			if(chk) {
				// 맵을 만들어서 key: 작성자, value: 해당 게시물 no 
				// 이 맵을 application에 저장한 뒤, 해당 작성자가 로그인 할 시 체크해서 
				// 자기 이름으로 된 맵의 키값이 있으면 쿠키를 전송하게끔 한다.
				ServletContext ctx =	 req.getServletContext();
				Map<String,String> m = (Map<String, String>) ctx.getAttribute("recipeAuth");
					m.put(rAuthService.getWriter(no), no);
					ctx.setAttribute("recipeAuth", m);
			}
		}
		return gson.toJson(map);
	}
	
	
	
	
	
	
	
}
