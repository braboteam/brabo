package controller.board;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import service.board.BoardService;

@Controller
public class FreeBoardCommentsController {

	@Autowired
	BoardService boardService;

	@RequestMapping("/addcomments")
	public String addCommentsHandle(@RequestParam Map map, HttpSession session, Map m) {
		boolean b = boardService.insertComments(map, (String) session.getAttribute("logon"));
		if (b) {
			return "redirect:/boarddetail";
		} else {
			m.put("body", "/WEB-INF/view/freeBoardDetail.jsp");
			m.put("insertFail", "댓글등록에 실패하였습니다.");
			return "index";
		}
	}
}
