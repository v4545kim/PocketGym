package member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import dao.MemberDao;
import vo.Member;



@Controller
public class MemberDeleteController {
	
	private ModelAndView mav = null;
	
	
	
	@Autowired
	@Qualifier("mdao")
	private MemberDao mdao ;
	
	
	public MemberDeleteController() {
		this.mav = new ModelAndView();
	}
	
	
	
	
	@GetMapping("/delete.me")
	private ModelAndView  doGet(
			@RequestParam(value = "id", required = true) String id,
			HttpSession session)
	{
		System.out.println("여기는 잘 옵니다.");
		
		System.out.println("id : " + id);
		
		int cnt  = -99999;
		cnt =  mdao.deleteMember(id);
		
		System.out.println("탈퇴 완료");
		
		this.mav.setViewName("redirect:/login.me");
		return this.mav ;
	}
	
	
	
	
	
	
	
	@PostMapping("/delete.me")
	private String  doPost(	)
	{
		
		return "";
	}
}
