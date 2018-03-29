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
	public String joinPostHandle(Model model, @RequestParam Map<String, String> param, 
			@RequestParam MultipartFile profile) {
		   
			System.out.println(param.size());
			boolean rst = false;
			
			try {
					rst = joinservice.addNewJoin(param, profile);
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
			
			if (rst) {
			model.addAttribute("body", "/WEB-INF/view/indexBody.jsp");
			model.addAttribute("join", "회원가입에 성공하셨습니다. 로그인 하시기 바랍니다.");
			}else{
				model.addAttribute("body", "/WEB-INF/view/addjoin.jsp");
				model.addAttribute("err", "회원가입에 실패하셨습니다. 다시 작성하시기 바랍니다.");
			}
			return "index";
	}
}