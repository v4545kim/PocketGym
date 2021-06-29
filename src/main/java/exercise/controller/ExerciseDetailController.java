package exercise.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import dao.ExerciseDao;
import vo.Exercise;

@Controller
public class ExerciseDetailController {
	
	@Autowired
	@Qualifier("edao")
	private ExerciseDao edao;
	
	@GetMapping("/detail.ex")
	private String doGet(Model model, @RequestParam String ex_id){
		Exercise ex = edao.exerciseDetail(ex_id);
		model.addAttribute("ex", ex);
		return "exDetail";
	}
	
	@PostMapping("/detail.ex")
	private String  doPost(Model model){
		return "";
	}
}
