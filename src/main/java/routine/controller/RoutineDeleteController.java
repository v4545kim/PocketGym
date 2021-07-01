package routine.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import dao.RoutineDao;

@Controller
public class RoutineDeleteController {

	@Autowired
	@Qualifier("rdao")
	RoutineDao rdao;
	
	@GetMapping("/delete.ro")
	private String  doGet(Model model, @RequestParam String ro_id){
		rdao.deleteRoutine(ro_id);
		return "redirect:/list.ro";
	}

}
