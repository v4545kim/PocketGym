package exercise.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import vo.Exercise;

@Controller
public class ExerciseDetailController {
	
	@GetMapping("/detail.ex")
	private String  doGet(Model model, @RequestParam("ex") Exercise ex){
		
		return "exDetail";
	}
	
	@PostMapping("detail.ex/post")
	private String  doPost(Model model){
		return "";
	}
}
