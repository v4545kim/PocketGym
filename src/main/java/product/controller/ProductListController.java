package product.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class ProductListController {
	
	@GetMapping("/prlist.pr")
	private String  doGet(Model model){
		return "prList";
	}
	
	@PostMapping("/prlist.pr")
	private String  doPost(Model model){
		return "";
	}
}
