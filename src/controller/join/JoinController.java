package controller.join;

import java.io.IOException;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import service.join.JoinService;

@Controller
@RequestMapping("/join")
public class JoinController {
	@Autowired
	JoinService joinservice;

	@RequestMapping(method = RequestMethod.GET)
	public String joinGetHandle(Model model) {
		model.addAttribute("body", "/WEB-INF/view/addjoin.jsp");
		return "index";
	}

	@RequestMapping(method = RequestMethod.POST)
	public String joinPostHandle(Model model, @RequestParam Map<String, String> param, @RequestParam MultipartFile profile){
		
		try{ 
			boolean rst = joinservice.addNewJoin(param, profile);
			if (rst) {
			model.addAttribute("body", "/WEB-INF/view/indexBody.jsp");
			model.addAttribute("join", "회원가입에 성공하셨습니다. 로그인 하시기 바랍니다.");
			return "index";
		}throw new Exception();
		}catch(Exception e) {
		model.addAttribute("err", "계정생성에서 문제가 있었습니다!");
		return "addjoin";
		}
	}
}
