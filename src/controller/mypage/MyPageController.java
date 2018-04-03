package controller.mypage;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

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

	@RequestMapping("/updatemember")
	public String updateMemberHandle(Model model, @RequestParam Map<String, String> param,
			@RequestParam MultipartFile img) throws IllegalStateException, IOException {
		if (mypageService.updateMember(param, img)) {
			model.addAttribute("msg", "회원정보를 수정하였습니다.");
			return "redirect:mypage";
		} else {
			model.addAttribute("msg", "회원정보 수정에 실패하였습니다.");
			return "redirect:mypage";
		}
	}

	@RequestMapping("/myrecipe")
	public String myRecipeHandle(HttpSession session, Model model) {
		Map map = mypageService.MyInfo((String) session.getAttribute("logon"));
		List<Map<String, Object>> list = mypageService.MyRecipe((String) session.getAttribute("logon"));

		model.addAttribute("member", map);
		model.addAttribute("body", "/WEB-INF/view/myRecipe.jsp");
		model.addAttribute("board", list);
		return "index";
	}

	@RequestMapping("/myscrap")
	public String myScrapHandle(HttpSession session, Model model) {
		Map map = mypageService.MyInfo((String) session.getAttribute("logon"));
		List<Map<String, Object>> list = mypageService.MyScrap((String) session.getAttribute("logon"));

		model.addAttribute("member", map);
		model.addAttribute("body", "/WEB-INF/view/myScrap.jsp");
		model.addAttribute("board", list);

		return "index";
	}

}
