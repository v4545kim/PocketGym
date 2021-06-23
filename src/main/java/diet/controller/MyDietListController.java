package diet.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class MyDietListController {
	
	@GetMapping("mydietlist.di/get")
	private String  doGet(Model model){
		return "";
	}
	
	@PostMapping("mydietlist.di/post")
	private String  doPost(Model model){
		return "";
	}
}
