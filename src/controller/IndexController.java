package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {

	@RequestMapping("/index")
	public String a() {
		System.out.println("컨트롤러 작동");
		return "index";
	}
}
