package exercise.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
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
	private String  doPost(Model model, @ModelAttribute("bean") @Valid Exercise exercise, BindingResult asdf){
		
		if(asdf.hasErrors()) {
			System.out.println("유효성 검사 실패");
			model.addAttribute("exercise", exercise);
			return "exInsertForm";
		}else {	
			int cnt = edao.insertExercise(exercise);
			return "redirect:/list.ex";
		}

	}
}
