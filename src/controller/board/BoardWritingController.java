package controller.board;

import java.io.File;
import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import service.board.BoardService;

@Controller
@RequestMapping("boardwriting")
public class BoardWritingController {

	@Autowired
	ServletContext application;

	@Autowired
	BoardService boardService;

	// 글쓰기폼이동
	@RequestMapping(method = RequestMethod.GET)
	public String boardWritingGetHandle(Model model) {
		model.addAttribute("body", "/WEB-INF/view/boardWriteForm.jsp");
		return "index";
	}

	// 글 등록
	@RequestMapping(method = RequestMethod.POST)
	public String boardWritingPostHandle(Model model, @RequestParam Map map, @RequestParam MultipartFile[] image)
			throws IllegalStateException, IOException {
		String path = application.getRealPath("/board"); // 서버경로
		boolean r = boardService.insertBoard(map, path, image);
		// 성공
		if (r) {
			System.out.println("성공");
		}
		// 실패
		else {
			System.out.println("실패");
		}
		model.addAttribute("body", "/WEB-INF/view/freeBoard.jsp");
		return "index";
	}
}
