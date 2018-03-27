package controller.board;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import service.board.BoardService;

@Controller
public class FreeBoardController {

	@Autowired
	BoardService boardService;

	@RequestMapping("/freeboard")
	public String freeBoardHandle(Model model, HttpSession session) {
		model.addAttribute("body", "/WEB-INF/view/freeBoard.jsp");
		model.addAttribute("board", boardService.selectBoard((String) session.getAttribute("logon")));
		return "index";
	}
}
