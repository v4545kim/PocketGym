package routine.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class RoutineListController {
	
	@GetMapping("list.ro/get")
	private String  doGet(Model model){
		return "";
	}
	
	@PostMapping("list.ro/post")
	private String  doPost(Model model){
		return "";
	}
}
