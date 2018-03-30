package controller.scrap;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import service.scrap.ScrapService;

@Controller
@RequestMapping("/scrap")
public class ScrapController {
	@Autowired
	Gson gson;
	@Autowired
	ScrapService scrapService;
	
	@RequestMapping(path="/get",produces="application/json;charset=utf-8")
	@ResponseBody
	public String scrapHandle(@RequestParam String no,HttpSession session) {
		Map<String,String> map = new HashMap<>();
		
		String id = (String)session.getAttribute("logon");
		boolean rst = false;
		if(id != null) {
			try {
				rst = scrapService.scrapRecipe(no,id);
			} catch(Exception e) {
				e.printStackTrace();
			}
			if(rst)
				map.put("rst", "yy");
			else
				map.put("rst", "double");
		} else {
			map.put("rst", "login");
		}
	
		return gson.toJson(map);
	}
}
