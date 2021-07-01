package routine.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import dao.ExerciseDao;
import dao.RoutineDao;
import vo.Exercise;
import vo.Routine;

@Controller
public class RoutineInsertController {
	
	
	@Autowired
	@Qualifier("rdao")
	RoutineDao rdao;
	
	@Autowired
	@Qualifier("edao")
	ExerciseDao edao;
	
	@ModelAttribute("bean")
	public Routine routine() {
		return new Routine();
	}
	
	@ModelAttribute("ex")
	public List<Exercise> ex_list(){
		List<Exercise> list = edao.selectExList();		
		return list;
	}
	
	@GetMapping("/insert.ro")
	private String  doGet(Model model){
		return "roInsertForm";
	}
	
	@PostMapping("/insert.ro")
	private String  doPost(Model model, @ModelAttribute("bean") Routine routine){
		String ro_name = routine.getRo_name();
		List<String> list = routine.getEx_id();
		int cnt = rdao.insertRoutine(routine);
		
		String ro_id = rdao.getRoutineId(ro_name);
		
		for (String ex_id : list) {
			int cnt2 = rdao.insertExandRoutine(ro_id, ex_id);
		}
		return "redirect:/list.ro";
	}
}
