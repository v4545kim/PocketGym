package diet.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class MyDietUpdateController {
	
	@GetMapping("mydietupdate.di/get")
	private String  doGet(Model model){
		return "";
	}
	
	@PostMapping("mydietupdate.di/post")
	private String  doPost(Model model){
		return "";
	}
}
