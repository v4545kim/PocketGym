package routine.controller;

import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import dao.RoutineDao;
import vo.Exercise;

@Controller
public class RoutineDetailController {
	
	@Autowired
	@Qualifier("rdao")
	RoutineDao rdao;
	
	@GetMapping("/detail.ro")
	private String  doGet(Model model, @RequestParam String ro_id, @RequestParam String ro_name){
		List<Exercise> list = rdao.routineDetail(ro_id);
		for (Exercise exercise : list) {
			System.out.println("루틴 운동 : "+ exercise);
		}
		model.addAttribute("ro_id", ro_id);
		model.addAttribute("ro_name", ro_name);
		model.addAttribute("list", list);
		return "roDetail";
	}
	
}
