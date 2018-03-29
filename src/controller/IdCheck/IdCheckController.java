package controller.IdCheck;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import service.IdCheck.IdCheckService;
import service.loginout.LoginoutService;

@Controller
public class IdCheckController {

	@Autowired
	IdCheckService idcheckservice;

	@Autowired
	LoginoutService loginoutservice;
	
	@Autowired
	Gson gson;

	@RequestMapping(path = "/idcheck", method = RequestMethod.GET)
	public String loginGetHandle(Model model) {
		model.addAttribute("body", "/WEB-INF/view/addjoin.jsp");
		return "addjoin";
	}

	@RequestMapping(path = "/idcheck", method = RequestMethod.POST, produces="applicaion/json;charset=utf-8")
	@ResponseBody
	public String checkSignup(@RequestParam Map<String, String> param, Model model)
			throws IllegalStateException, IOException {
		Map rst = new HashMap<>();
		rst.put("id", param.get("id"));
		model.addAttribute("body", "/WEB-INF/view/addjoin.jsp");
		Map rowcount = idcheckservice.idcheck(rst);
		
		
		return gson.toJson(rowcount);
	}
}
