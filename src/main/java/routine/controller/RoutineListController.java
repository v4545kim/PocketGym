package routine.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class RoutineListController {
	
	@GetMapping("/list.ro")
	private String  doGet(Model model){
		return "roList";
	}
	
	@PostMapping("/list.ro")
	private String  doPost(Model model){
		return "";
	}
}
