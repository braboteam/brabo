package controller.board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import service.board.BoardService;

@Controller
public class FreeBoardDetailController {

	@Autowired
	BoardService boardService;

	@RequestMapping("/boarddetail")
	public String boardDetailHandle(@RequestParam String pk, Model model) {
		model.addAttribute("board", boardService.selectDetail(pk));
		model.addAttribute("body", "/WEB-INF/view/freeBoardDetail.jsp");
		return "index";
	}

}
