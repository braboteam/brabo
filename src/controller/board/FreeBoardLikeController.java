package controller.board;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import service.board.BoardService;

@Controller
public class FreeBoardLikeController {

	@Autowired
	BoardService boardService;

	@RequestMapping(path = "/like", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String likeHandle(@RequestParam Map map, HttpSession session) {
		boolean b = boardService.insertLike((String) map.get("board_id"), (String) session.getAttribute("logon"));
		if (b) {
			return "true";
		} else {
			return "false";
		}
	}

	@RequestMapping(path = "/likecancel", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String likeCancelHandle(@RequestParam Map map, HttpSession session) {
		boolean b = boardService.deleteLike((String) map.get("board_id"), (String) session.getAttribute("logon"));
		if (b) {
			return "true";
		} else {
			return "false";
		}
	}
}
