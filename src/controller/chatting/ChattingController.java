package controller.chatting;

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
	public String ChattingHandle(Model model) {
		model.addAttribute("body", "/WEB-INF/view/chatting.jsp");
		chattingService.OnlineUserList();
		return "index";
	}
}
