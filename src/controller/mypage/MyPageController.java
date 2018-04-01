package controller.mypage;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import service.board.BoardService;
import service.mypage.MyPageService;

@Controller
public class MyPageController {

	@Autowired
	MyPageService mypageService;

	@Autowired
	BoardService boardService;

	@RequestMapping("/mypage")
	public String myPageHandle(HttpSession session, Model model) {
		Map map = mypageService.MyInfo((String) session.getAttribute("logon"));
		model.addAttribute("member", map);
		model.addAttribute("body", "/WEB-INF/view/myPage.jsp");
		return "index";
	}

	@RequestMapping("/mycooktalk")
	public String myCookTalkHandle(HttpSession session, Model model) {
		Map map = mypageService.MyInfo((String) session.getAttribute("logon"));
		model.addAttribute("member", map);
		model.addAttribute("body", "/WEB-INF/view/myCooktalk.jsp");
		model.addAttribute("board", boardService.selectBoard2((String) session.getAttribute("logon"),
				(String) session.getAttribute("logon")));

		return "index";
	}
}
