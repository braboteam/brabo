package controller.board;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

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

	@RequestMapping("/onlyfollowboard")
	public String freeBoardFollowHandle(Model model, HttpSession session) {
		if (session.getAttribute("logon") != null) {
			model.addAttribute("body", "/WEB-INF/view/onlyFollowBoard.jsp");
			model.addAttribute("board", boardService.selectFollowBoard((String) session.getAttribute("logon")));
			return "index";
		} else {
			model.addAttribute("sessionError", "로그인 후 이용하시기 바랍니다.");
			return "redirect:/login";
		}
	}

	@RequestMapping(path = "/freeboard/{friend}")
	public String freeBoardAjaxHandle(@PathVariable String friend, HttpSession session, Model model) {
		Map map = followService.memberInfo((String) session.getAttribute("logon"), friend);
		model.addAttribute("member", map);
		model.addAttribute("board", boardService.selectBoard2((String) session.getAttribute("logon"), friend));
		model.addAttribute("body", "/WEB-INF/view/followBoard.jsp");
		return "index";
	}

	@RequestMapping(path = "deleteboard", method = RequestMethod.GET, produces = "application/json;charset=utf-8")
	@ResponseBody
	public String deleteBoardHandle(@RequestParam String board_id) {
		boolean b = boardService.deleteBoard(board_id);
		return new Gson().toJson(b);
	}
}
