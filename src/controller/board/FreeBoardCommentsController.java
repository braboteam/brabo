package controller.board;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import service.board.BoardService;

@Controller
public class FreeBoardCommentsController {

	@Autowired
	BoardService boardService;

	@RequestMapping("/addcomments")
	public String addCommentsHandle(@RequestParam Map map, HttpSession session, Model model) {
		System.out.println("addController!");
		String board_id = (String) map.get("board_id");
		if (session.getAttribute("logon") != null) {
			boolean b = boardService.insertComments(map, (String) session.getAttribute("logon"));
			if (b) {
				model.addAttribute("msg", "댓글등록이 등록되었습니다.");
				return "redirect:/boarddetail?pk=" + board_id;
			} else {
				model.addAttribute("insertFail", "댓글등록에 실패하였습니다.");
				return "redirect:/boarddetail?pk=" + board_id;
			}
		} else {
			model.addAttribute("sessionError", "로그인 후 이용하시기 바랍니다.");
			return "redirect:/login";
		}
	}
}
