package controller.board;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import service.board.BoardService;
import service.follow.FollowService;

@Controller
public class FreeBoardController {

	@Autowired
	BoardService boardService;

	@Autowired
	FollowService followService;

	@RequestMapping("/freeboard")
	public String freeBoardHandle(Model model, HttpSession session) {
		model.addAttribute("body", "/WEB-INF/view/freeBoard.jsp");
		model.addAttribute("board", boardService.selectBoard((String) session.getAttribute("logon")));
		return "index";
	}

	@RequestMapping(path = "/freeboard/{friend}")
	public String freeBoardAjaxHandle(@PathVariable String friend, HttpSession session, Model model) {
		Map map = followService.memberInfo((String) session.getAttribute("logon"), friend);
		model.addAttribute("member", map);
		model.addAttribute("board", boardService.selectBoard2((String) session.getAttribute("logon"), friend));
		model.addAttribute("body", "/WEB-INF/view/followBoard.jsp");
		return "index";
	}
}
