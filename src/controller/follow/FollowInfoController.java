package controller.follow;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import service.follow.FollowService;

@Controller
public class FollowInfoController {

	@Autowired
	FollowService followService;

	@RequestMapping("followinfo")
	public String followInfoHandle(Model model, @RequestParam String id, HttpSession session) {
		Map map = followService.memberInfo((String) session.getAttribute("logon"), id);
		model.addAttribute("member", map);
		model.addAttribute("body", "/WEB-INF/view/followInfo.jsp");
		return "index";
	}

	@RequestMapping(path = "follow", method = RequestMethod.GET, produces = "application/json;charset=utf-8")
	@ResponseBody
	public String followHandle(HttpSession session, @RequestParam String friend) {
		Map map = new HashMap<>();
		map.put("id", (String) session.getAttribute("logon"));
		map.put("friend", friend);
		if (followService.follow(map)) {
			return "true";
		} else {
			return "false";
		}
	}

	@RequestMapping(path = "followcancle", method = RequestMethod.GET, produces = "application/json;charset=utf-8")
	@ResponseBody
	public String followCancleHandle(HttpSession session, @RequestParam String friend) {
		Map map = new HashMap<>();
		map.put("id", (String) session.getAttribute("logon"));
		map.put("friend", friend);
		if (followService.followCancle(map)) {
			return "true";
		} else {
			return "false";
		}
	}
}
