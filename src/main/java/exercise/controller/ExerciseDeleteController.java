package exercise.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import dao.ExerciseDao;

@Controller
public class ExerciseDeleteController {
	
	@Autowired
	@Qualifier("edao")
	ExerciseDao edao;
	
	@GetMapping("/delete.ex")
	private String  doGet(Model model, @RequestParam("ex_id") int ex_id){
		int cnt = edao.deleteExercise(ex_id);
		return "redirect:/list.ex";
	}
	
}
