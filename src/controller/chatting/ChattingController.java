package controller.chatting;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import service.chatting.ChattingService;

@Controller
public class ChattingController {

	@Autowired
	ChattingService chattingService;

	// 채팅창이동
	@RequestMapping("/chatting")
	public String ChattingHandle(Model model, HttpSession session) {
		if (session.getAttribute("logon") != null) {
			model.addAttribute("body", "/WEB-INF/view/chatting.jsp");
			model.addAttribute("member", chattingService.OnlineUserList((String) session.getAttribute("logon")));
			return "index";
		} else {
			model.addAttribute("sessionError", "로그인 후 이용하시기 바랍니다.");
			return "redirect:/login";
		}
	}

	// 오픈채팅 내용반환
	@RequestMapping(path = "/openchat", method = RequestMethod.GET, produces = "application/json;charset=utf-8")
	@ResponseBody
	public String openChatHandle() {
		List list = chattingService.listOpenChat();
		return new Gson().toJson(list);
	}

	// 오픈채팅 보낸메시지 저장
	@RequestMapping(path = "/sendopenchat", method = RequestMethod.GET, produces = "application/json;charset=utf-8")
	@ResponseBody
	public String sendOpenChatHandle(@RequestParam String msg, HttpSession session) throws IOException {
		boolean b = chattingService.sendOpenChat((String) session.getAttribute("logon"), msg);
		return new Gson().toJson(b);
	}
}
