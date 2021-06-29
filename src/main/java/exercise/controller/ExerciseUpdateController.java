package exercise.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import dao.ExerciseDao;
import vo.Exercise;

@Controller
public class ExerciseUpdateController {
	
	@Autowired
	@Qualifier("edao")
	ExerciseDao edao;
	
	@ModelAttribute("bean")
	public Exercise exercise() {
		return new Exercise();
	}
	
	@GetMapping("/update.ex")
	private String  doGet(Model model, @RequestParam("ex_id") String ex_id){
		Exercise bean = edao.exerciseDetail(ex_id);
		model.addAttribute("bean", bean);
		return "exUpdateForm";
	}
	
	@PostMapping("/update.ex")
	private String  doPost(Model model, @ModelAttribute("bean") Exercise exercise){		
		int cnt = edao.updateExercise(exercise);
		int ex_id = exercise.getEx_id();
		return "redirect:/detail.ex?ex_id="+ex_id;
	}
}
