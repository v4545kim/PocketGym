package member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class MemberLoginController {
	
	@GetMapping("login.me/get")
	private String  doGet(Model model){
		return "";
	}
	
	@PostMapping("login.me/post")
	private String  doPost(Model model){
		return "";
	}
}
