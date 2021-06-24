package exercise.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class ExerciseInsertController {
	
	@GetMapping("/insert.ex")
	private String  doGet(Model model){
		return "exInsertForm";
	}
	
	@PostMapping("/insert.ex")
	private String  doPost(Model model){
		return "";
	}
}
