package member.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import dao.MemberDao;
import vo.Member;

@Controller
public class MemberInsertController {
	
	@Autowired
	@Qualifier("mdao")
	private MemberDao mdao;
	
	@ModelAttribute("member")
	public Member mymember() {
		return new Member();
	}
	
	@GetMapping("/insert.me")
	private String doGet(Model model){
		System.out.println("회원가입 창으로 이동");
		return "/meInsertForm";
	}
	
	@PostMapping("/insert.me")
	public ModelAndView doPost(
			@ModelAttribute("member") @Valid Member xxx, BindingResult asdf) {
		
		ModelAndView mav = new ModelAndView();
		
		if (asdf.hasErrors()) {
			System.out.println("유효성 검사에 문제가 있음");
			System.out.println(xxx.toString());
			System.out.println(asdf.toString());
			mav.addObject("bean",xxx);
			mav.setViewName("meInsertForm");
			
		} else {
			System.out.println("유효성 검사에 문제가 없음");
			int cnt = -1;
			cnt = mdao.insertData(xxx);
			
			mav.setViewName("redirect:/main.ma");
		}
		return mav;
	}
}