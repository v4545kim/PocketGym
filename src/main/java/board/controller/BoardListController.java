package board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class BoardListController {
	
	@GetMapping("brlist.br/get")
	private String  doGet(Model model){
		return "";
	}
	
	@PostMapping("brlist.br/post")
	private String  doPost(Model model){
		return "";
	}
}
