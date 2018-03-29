package controller.follow;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import service.follow.FollowService;

@Controller
public class FollowInfoController {

	@Autowired
	FollowService followService;

	@RequestMapping("followinfo")
	public String followInfoHandle(Model model, @RequestParam String id) {
		Map map = followService.memberInfo(id);
		model.addAttribute("member", map);
		model.addAttribute("body", "/WEB-INF/view/followInfo.jsp");
		return "index";
	}
}
