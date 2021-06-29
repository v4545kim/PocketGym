package board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import dao.BoardDao;

@Controller
public class BoardUpdateController {
	
	@Autowired
	@Qualifier("bdao")
	private BoardDao dao ;
	
	@GetMapping("/brupdate.br")
	private String  doGet(Model model){
		return "boardUpdateForm";
	}
	
	@PostMapping("/brupdate.br")
	private String  doPost(Model model){
		return "redirect:/brdetail.br";
	}
}
