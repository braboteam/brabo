package controller.board;

import javax.servlet.http.HttpSession;

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
	public String boardDetailHandle(@RequestParam String pk, HttpSession session, Model model) {
		model.addAttribute("board", boardService.selectDetail(pk, (String) session.getAttribute("logon"))); // 게시글 데이터
		// model.addAttribute("comments",boardService.selectComments()); // 댓글
		model.addAttribute("body", "/WEB-INF/view/freeBoardDetail.jsp");
		return "index";
	}

}
