package exercise.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import dao.ExerciseDao;
import vo.Exercise;

@Controller
public class ExerciseListController {
	
	@Autowired
	@Qualifier("edao")
	ExerciseDao edao;
	
	@GetMapping("/list.ex")
	private String  doGet(Model model){
		List<Exercise> list = edao.selectExList();
		model.addAttribute("list", list);
		return "exList";
	}
	
	@PostMapping("/list.ex")
	private String  doPost(Model model){
		return "";
	}
}
