package member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class MemberUpdateController {
	
	@GetMapping("update.me/get")
	private String  doGet(Model model){
		return "";
	}
	
	@PostMapping("update.me/post")
	private String  doPost(Model model){
		return "";
	}
}
