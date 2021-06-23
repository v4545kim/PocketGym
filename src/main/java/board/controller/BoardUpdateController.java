package board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class BoardUpdateController {
	
	@GetMapping("brupdate.br/get")
	private String  doGet(Model model){
		return "";
	}
	
	@PostMapping("brupdate.br/post")
	private String  doPost(Model model){
		return "";
	}
}
