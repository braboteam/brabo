package controller.scrap;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import service.scrap.ScrapService;

@Controller
@RequestMapping("/scrapGet")
public class ScrapController {
	@Autowired
	Gson gson;
	@Autowired
	ScrapService scrapService;
	
	@RequestMapping(path="/recipe",produces="application/json;charset=utf-8",method=RequestMethod.GET)
	@ResponseBody
	public String scrapHandle(@RequestParam String no,HttpSession session) {
		Map<String,String> map = new HashMap<>();
		
		System.out.println("param : "+ no);
		
		String id = (String)session.getAttribute("logon");
		boolean rst = false;
		if(id != null) {
			boolean chk = scrapService.scrapCheck(no,id);

			try {
				if(chk)
					rst = scrapService.scrapRecipe(no,id);
				else
					map.put("rst", "double");
			} catch(Exception e) {
				e.printStackTrace();
			}
			
			if(rst)
				map.put("rst", "yy");
		} else {
			map.put("rst", "login");
		}
	
		return gson.toJson(map);
	}
}
