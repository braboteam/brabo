package controller.loginout;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import service.loginout.LoginoutService;

@Controller
public class LoginoutController {
	@Autowired
	LoginoutService loginoutservice;

	@RequestMapping(path = "/login", method = RequestMethod.GET)
	public String loginGetHandle() {
		return "login";
	}

	@RequestMapping(path = "/login", method = RequestMethod.POST)
	public String loginPostHandle(@RequestParam Map<String, String> param, HttpSession session, Model model) {

		Map rst = loginoutservice.loginByIdAndPass(param);
		if (rst != null) {
			session.setAttribute("logon", rst.get("ID"));
			model.addAttribute("body", "/WEB-INF/view/indexBody.jsp");
			model.addAttribute("success", "�α��ο� �����Ͽ����ϴ�.");
			return "index";
		} else {
			model.addAttribute("err", "�α��ο� �����ϼ̽��ϴ�.");
			model.addAttribute("body", "/WEB-INF/view/login.jsp");
			return "index";
		}
	}
}
