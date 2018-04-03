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
	public String loginGetHandle(Model model) {
		model.addAttribute("body", "/WEB-INF/view/login.jsp");
		return "index";
	}

	public String loginGetHandle(@RequestParam(required = false) String sessionError, Model model) {
		model.addAttribute("sessionError", sessionError);
		return "login";
	}

	@RequestMapping(path = "/login", method = RequestMethod.POST)
	public String loginPostHandle(@RequestParam Map<String, String> param, HttpSession session, Model model) {

		Map rst = loginoutservice.loginByIdAndPass(param);
		if (rst != null) {
			session.setAttribute("logon", rst.get("ID"));
			session.setAttribute("memberRight", rst.get("RIGHT"));
			model.addAttribute("body", "/WEB-INF/view/indexBody.jsp");
			model.addAttribute("success", rst.get("ID") + "님 환영합니다.");
			return "index";
		} else {
			model.addAttribute("err", "로그인 과정에서 문제가 발생했습니다.");
			model.addAttribute("body", "/WEB-INF/view/login.jsp");
			return "index";
		}
	}

	@RequestMapping(path = "/logout", method = RequestMethod.GET)
	public String logoutPostHandle(HttpSession session, Model model) {

		session.removeAttribute("logon");
		session.removeAttribute("memberRight");
		model.addAttribute("body", "/WEB-INF/view/indexBody.jsp");
		model.addAttribute("logout", "로그아웃 되었습니다.");
		return "index";
	}
}
