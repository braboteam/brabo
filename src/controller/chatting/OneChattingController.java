package controller.chatting;

import java.io.IOException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.mongodb.MongoClient;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;

import service.chatting.ChattingService;

@Controller
public class OneChattingController {

	@Autowired
	ChattingService chattingService;

	// 몽고에메시지저장
	@RequestMapping(path = "/sendonechat", method = RequestMethod.GET, produces = "application/json;charset=utf-8")
	@ResponseBody
	public String sendOneChatHandle(HttpSession session, @RequestParam String friend, @RequestParam String msg)
			throws IOException {
		boolean b = chattingService.sendOneChat((String) session.getAttribute("logon"), friend, msg);
		return new Gson().toJson(b);
	}

	// 몽고채팅 내용반환
	@RequestMapping(path = "/onechat", method = RequestMethod.GET, produces = "application/json;charset=utf-8")
	@ResponseBody
	public String openChatHandle(HttpSession session, @RequestParam String friend) {
		List list = chattingService.listOneChat((String) session.getAttribute("logon"), friend);
		return new Gson().toJson(list);
	}

}
