package routine.controller;

import java.net.http.HttpRequest;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.HandlerMapping;

import dao.MemberDao;
import dao.RoutineDao;
import vo.Exercise;
import vo.Member;
import vo.MyRoutineCheck;

@Controller
public class MyRoutineController {
	
	
	@Autowired
	@Qualifier("rdao")
	private RoutineDao rdao;
	
	
	
	@RequestMapping(value = {"/myroutine.ro", "/insertroutine.ro"})
	private String  doGet(Model model, HttpSession session, HttpServletRequest request, @RequestParam(value="regdate", required=false) String regdate, @RequestParam(value="ex_id", required = false) String ex_id){
		Member member = (Member) session.getAttribute("loginfo");
		String id = member.getId();
		String requestUrl = request.getServletPath();
		if(requestUrl.equals("/myroutine.ro")) {
			List<Exercise> lists = rdao.myRoutine(id);
			List<MyRoutineCheck> lists2 = rdao.myRoutineCheck(id);
			model.addAttribute("lists", lists);
			model.addAttribute("lists2", lists2);
			return "myRoutine";
		}else {
			rdao.routineCheck(id, ex_id, regdate);
			return "myRoutine";
		}
		
	}

}
