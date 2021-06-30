package routine.controller;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import dao.RoutineDao;
import vo.Member;

@Controller
public class MyRoutineDeleteController {
	
	
	@Autowired
	@Qualifier("rdao")
	private RoutineDao rdao;
	
	
	
	@GetMapping("/myroutinedelete.ro")
	private String  doGet(Model model, HttpSession session, @RequestParam(value="regdate") String regdate, @RequestParam(value="ex_id") String ex_id){
		
		Member member = (Member) session.getAttribute("loginfo");
		String id = member.getId();
		int cnt = rdao.routineCheckDelete(id, regdate, ex_id);
				
		return "redirect:/myroutine.ro";
	}
}
