package member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import dao.MemberDao;
import vo.Member;

@Controller
public class MemberUpdateController {
	
	@Autowired
	@Qualifier("mdao")
	private MemberDao mdao;
	
	@ModelAttribute("bean")
	public Member member() {
		return new Member();
	}
	
	@GetMapping("/update.me")
	private String  doGet(Model model, HttpSession session, @RequestParam(value = "myWeight", required = true) String myWeight){
		Member member = (Member) session.getAttribute("loginfo");
		model.addAttribute("member", member);
		model.addAttribute("myWeight", myWeight);
		
		return "meUpdateForm";
	}
	
	@PostMapping("/update.me")
	private String  doPost(Model model, @ModelAttribute("member") Member member){
		int cnt = mdao.updateMember(member);
		return "redirect:/main.ma";
	}
}
