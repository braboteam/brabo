package controller.chatting;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import service.chatting.ChattingService;

@Controller
public class ChattingController {

	@Autowired
	ChattingService chattingService;

	@RequestMapping("/chatting")
	public String ChattingHandle(Model model, HttpSession session) {
		model.addAttribute("body", "/WEB-INF/view/chatting.jsp");
		model.addAttribute("member", chattingService.OnlineUserList((String) session.getAttribute("logon")));
		return "index";
	}
}
