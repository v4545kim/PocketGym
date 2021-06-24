package product.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class ProductInsertController {
	
	@GetMapping("/insert.pr")
	private String  doGet(Model model){
		return "prInsertForm";
	}
	
	@PostMapping("/insert.pr")
	private String  doPost(Model model){
		return "";
	}
}
