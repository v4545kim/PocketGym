package member.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import dao.MemberDao;
import dao.RoutineDao;
import vo.Routine;

@Controller
public class MemberRoutineGiveController {
	
	private ModelAndView mav = null;
	
	@Autowired
	@Qualifier("mdao")
	private MemberDao mdao;
	
	
	@Autowired
	@Qualifier("rdao")
	RoutineDao rdao;
	
	
	public MemberRoutineGiveController() 
	{
		this.mav = new ModelAndView();
	}
	
	
	
	
	
	
	
	
	
	
	
	@GetMapping("/rogive.me")
	private ModelAndView  doGet(
			@RequestParam(value="mem_id", required=true) String id,
			@RequestParam(value="nickname", required=true) String nickname)
	{
		// 루틴 목록들을 담습니다.
		List<Routine> lists = rdao.selectRoList();
		
		// 루틴 목록들을 가지고 갑니다.
		this.mav.addObject("lists", lists);
		this.mav.addObject("id", id);
		this.mav.addObject("nickname", nickname);
		
		
		this.mav.setViewName("routineGive");
		return this.mav;
	}


	
	
	

	
	
	
	
	
	
	@PostMapping("/rogive.me")
	private ModelAndView  doPost(HttpServletRequest request)
	{
		int ro_id = Integer.parseInt(request.getParameter("language")); 
		String id = request.getParameter("id");
		
		System.out.println("ro_id : " + ro_id);
		System.out.println("id : " + id);
		
		int cnt = mdao.giveRoutine(ro_id, id);
		
		
		this.mav.setViewName("redirect:/list.me");
		
		
		
		return this.mav;
	}
}
