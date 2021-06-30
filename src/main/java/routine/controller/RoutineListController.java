package routine.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import dao.RoutineDao;
import vo.Routine;

@Controller
public class RoutineListController {
	
	@Autowired
	@Qualifier("rdao")
	RoutineDao rdao;
	
	@GetMapping("/list.ro")
	private String  doGet(Model model){
		List<Routine> list = rdao.selectRoList();
		model.addAttribute("list", list);
		return "roList";
	}
	
	@PostMapping("/list.ro")
	private String  doPost(Model model){
		return "";
	}
}
