package diet.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class MyDietDetailController {
	
	@GetMapping("mydietdetail.di/get")
	private String  doGet(Model model){
		return "myDietDetail";
	}
	
	@PostMapping("mydietdetail.di/post")
	private String  doPost(Model model){
		return "";
	}
}
