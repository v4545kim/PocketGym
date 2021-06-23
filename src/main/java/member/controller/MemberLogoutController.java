package member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class MemberLogoutController {
	
	@GetMapping("logout.me/get")
	private String  doGet(Model model){
		return "";
	}
	
	@PostMapping("logout.me/post")
	private String  doPost(Model model){
		return "";
	}
}