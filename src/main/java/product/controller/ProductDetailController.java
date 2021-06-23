package product.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class ProductDetailController {
	
	@GetMapping("prlist.pr/get")
	private String  doGet(Model model){
		return "";
	}
	
	@PostMapping("prlist.pr/post")
	private String  doPost(Model model){
		return "";
	}
}
