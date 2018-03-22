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
	public String joinGetHandle() {
		return "addjoin";
	}

	@RequestMapping(method = RequestMethod.POST)
	public String joinPostHandle(Model model, @RequestParam Map<String, String> param, @RequestParam MultipartFile profile)
			throws IllegalStateException, IOException {
		
		boolean rst = joinservice.addNewJoin(param, profile);
		if (rst) {
			model.addAttribute("body", "addjoin");
			return "redirect:/index";
		}
		return "addjoin";
	}
}
