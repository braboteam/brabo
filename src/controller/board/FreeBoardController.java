package controller.board;

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
	public String freeBoardHandle(Model model) {
		System.out.println("자유게시판 컨트롤러");
		model.addAttribute("body", "/WEB-INF/view/freeBoard.jsp");
		model.addAttribute("board", boardService.selectBoard());
		return "index";
	}
}
