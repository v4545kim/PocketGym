package product.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class ProductCartController {
	
	@GetMapping("prcart.pr/get")
	private String  doGet(Model model){
		return "";
	}
	
	@PostMapping("prcart.pr/post")
	private String  doPost(Model model){
		return "";
	}
}