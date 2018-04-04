package controller.admin;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
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
	public String recipeAuthHandle(@RequestParam String no,HttpServletResponse resp,HttpSession session) {
		boolean rst = rAuthService.authReciep(no);
		Map<String,Boolean> map = new HashMap<>();
			map.put("rst", rst);
		// 변경된 레시피 권한 값이 0 인지 1인지 확인하는 과정
		if(rst) {
			boolean chk = rAuthService.checkRight(no);
			System.out.println("chkAuth "+ chk);
			if(chk) {
				// 해당 작성자에게만 알릴 수 있도록 쿠키 설정 - key: recipeAuth, value: 작성자의 id로 넣어서,
				// 작성자가 쿠키value 뽑았을 때 자기 id랑 같으면 메시지 출력, 다르면 쿠키 삭제.
				Cookie auth = new Cookie("recipeAuth", rAuthService.getWriter(no));
					auth.setPath("/");
					auth.setMaxAge(60*60*24);
				resp.addCookie(auth);	
			}
		}
		return gson.toJson(map);
	}
	
	
	
	
	
	
	
}
