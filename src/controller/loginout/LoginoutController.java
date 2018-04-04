package controller.loginout;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.socket.WebSocketSession;

import service.loginout.LoginoutService;
import service.socket.SocketService;

@Controller
public class LoginoutController {
	@Autowired
	LoginoutService loginoutservice;

	@Autowired
	ServletContext application;

	@Autowired
	SocketService socketService;

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
	public String loginPostHandle(@RequestParam Map<String, String> param, HttpSession session, Model model)
			throws IOException {

		Map rst = loginoutservice.loginByIdAndPass(param);
		if (rst != null) {
			// 기존에 로그인 유저 있을 시 팅기기
			if (application.getAttribute((String) rst.get("ID")) != null) {
				socketService.sessionOutSendMsg((String) rst.get("ID"));
				((HttpSession) application.getAttribute((String) rst.get("ID"))).removeAttribute("logon");
				application.removeAttribute((String) rst.get("ID"));
			}
			session.setAttribute("logon", rst.get("ID"));
			session.setAttribute("memberRight", rst.get("RIGHT"));
			model.addAttribute("body", "/WEB-INF/view/indexBody.jsp");
			model.addAttribute("success", rst.get("ID") + "님 환영합니다.");
			// 중복로그인 방지
			application.setAttribute((String) rst.get("ID"), session);
			return "redirect:/index";
		} else {
			model.addAttribute("err1", "로그인 과정에서 문제가 발생했습니다.");
			model.addAttribute("body", "/WEB-INF/view/login.jsp");
			return "index";
		}
	}

	@RequestMapping(path = "/logout", method = RequestMethod.GET)
	public String logoutPostHandle(HttpSession session, Model model) throws IOException {
		application.removeAttribute((String) session.getAttribute("logon"));
		socketService.removeSocket((String) session.getAttribute("logon"));
		// 접속중인 사용자들에게 로그아웃 알림
		socketService.allSendMsg((String) session.getAttribute("logon"));
		session.removeAttribute("logon");
		session.removeAttribute("memberRight");
		model.addAttribute("body", "/WEB-INF/view/indexBody.jsp");
		model.addAttribute("logout", "로그아웃 되었습니다.");
		return "redirect:/index";
	}
}
