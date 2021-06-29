package exercise.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import dao.ExerciseDao;
import vo.Exercise;

@Controller
public class ExerciseInsertController {
	
	@Autowired
	@Qualifier("edao")
	ExerciseDao edao;
	
	@ModelAttribute("bean")
	public Exercise exercise() {
		return new Exercise();
	}
	
	@GetMapping("/insert.ex")
	private String  doGet(Model model){
		return "exInsertForm";
	}
	
	@PostMapping("/insert.ex")
	private String  doPost(Model model, @ModelAttribute("ex") Exercise exercise){
		int cnt = edao.insertExercise(exercise);
		return "redirect:/list.ex";
	}
}
