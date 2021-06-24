package member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class MemberPlanController {
	
	@GetMapping("/plan.me")
	private String  doGet(Model model){
		return "mePlan";
	}
	
	@PostMapping("/plan.me")
	private String  doPost(Model model){
		return "";
	}
}
