package member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class MemberLogoutController {
	
	@GetMapping("/logout.me")
	private String doGet(HttpSession session,
			Model model){
		session.invalidate();
		System.out.println("로그아웃 됨");
		
		return "redirect:/main.ma";
	}
	
	
}
