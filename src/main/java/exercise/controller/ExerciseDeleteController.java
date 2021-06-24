package exercise.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class ExerciseDeleteController {
	
	@GetMapping("delete.ex/get")
	private String  doGet(Model model){
		return "";
	}
	
	@PostMapping("delete.ex/post")
	private String  doPost(Model model){
		return "";
	}
}
