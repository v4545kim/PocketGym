package board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class BoardReplyUpdateController {
	
	@GetMapping("/reupdate.br")
	private String  doGet(Model model){
		return "";
	}
	
	@PostMapping("/reupdate.br")
	private String  doPost(Model model){
		return "";
	}
}