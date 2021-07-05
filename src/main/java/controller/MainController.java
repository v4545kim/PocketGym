package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import dao.ExerciseDao;
import dao.RoutineDao;
import vo.Exercise;
import vo.Routine;

@Controller
public class MainController {
	
	@Autowired
	@Qualifier("rdao")
	RoutineDao rdao;
	
	@Autowired
	@Qualifier("edao")
	ExerciseDao edao;
	
	@GetMapping("/main.ma")
	private String  doGet(Model model) {
		//루틴 가져오기
		List<Routine> roList = rdao.selectRoList();
		model.addAttribute("roList", roList);
		
		//운동 가져오기
		List<Exercise> exList = edao.selectExList();
		model.addAttribute("exList", exList);
		
		System.out.println("go to main");
		return "main";
	}
}
