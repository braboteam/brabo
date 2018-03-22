package controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/test")
public class TestController {

	@RequestMapping(method = RequestMethod.GET)
	public String a() {
		return "test";
	}

	@RequestMapping(method = RequestMethod.POST)
	public String b(@RequestParam Map map) {
		System.out.println(map);
		return "test";
	}
}
