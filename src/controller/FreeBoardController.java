package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FreeBoardController {

	@RequestMapping("/freeboard")
	public String freeBoardHandle() {
		System.out.println("자유게시판 컨트롤러");
		return "freeboard";
	}
}
