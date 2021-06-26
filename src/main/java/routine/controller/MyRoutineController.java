package routine.controller;

import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import dao.MemberDao;
import dao.RoutineDao;
import vo.Exercise;
import vo.Member;

@Controller
public class MyRoutineController {
	
	
	@Autowired
	@Qualifier("rdao")
	private RoutineDao rdao;
	
	
	
	@GetMapping("/myroutine.ro")
	private String  doGet(Model model, HttpSession session){
		Member member = (Member) session.getAttribute("loginfo");
		String id = member.getId();
		List<Exercise> lists = rdao.myRoutine(id);
		model.addAttribute("lists", lists);
		for (Exercise exercise : lists) {
			System.out.println(exercise);
		}
		return "myRoutine";
	}
	
	@PostMapping("/myroutine.ro")
	private String  doPost(Model model){
		return "";
	}
}
