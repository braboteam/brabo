package controller.board;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FreeBoardController {

	@RequestMapping("/freeboard")
	public String freeBoardHandle(Model model) {
		System.out.println("자유게시판 컨트롤러");
		model.addAttribute("body", "/WEB-INF/view/freeBoard.jsp");
		return "index";
	}
}
