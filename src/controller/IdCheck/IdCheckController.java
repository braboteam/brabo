package controller.IdCheck;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import service.IdCheck.IdCheckService;
import service.loginout.LoginoutService;

@Controller
public class IdCheckController {

	@Autowired
	IdCheckService idcheckservice;

	@Autowired
	LoginoutService loginoutservice;

	@RequestMapping(path = "/idcheck", method = RequestMethod.GET)
	public String loginGetHandle(Model model) {
		model.addAttribute("body", "/WEB-INF/view/addjoin.jsp");
		return "addjoin";
	}

	@RequestMapping(path = "/idcheck", method = RequestMethod.POST)
	@ResponseBody
	public String checkSignup(@RequestParam Map<String, String> param, Model model)
			throws IllegalStateException, IOException {
		Map rst = new HashMap<>();
		rst.put("id", param.get("id"));
		model.addAttribute("body", "/WEB-INF/view/addjoin.jsp");
		Map rowcount = idcheckservice.idcheck(rst);
		if (rowcount == null) {
			return "null";
		} else {
			return rowcount.toString();
		}
	}
}
