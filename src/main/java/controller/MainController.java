package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import dao.RoutineDao;
import vo.Routine;

@Controller
public class MainController {
	
	@Autowired
	@Qualifier("rdao")
	RoutineDao rdao;
	
	@GetMapping("/main.ma")
	private String  doGet(Model model) {
		List<Routine> roList = rdao.selectRoList();
		model.addAttribute("roList", roList);
		System.out.println("go to main");
		return "main";
	}
}
