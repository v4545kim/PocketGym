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

import dao.MemberDao;
import vo.Member;

@Controller
public class MemberInsertController {
	
	@Autowired
	@Qualifier("mdao")
	private MemberDao mdao;
	
	@GetMapping("/insert.me")
	private String doGet(Model model){
		return "/meInsertForm";
	}
	
	@PostMapping("/insert.me")
	private String doPost(
			@ModelAttribute("member") @Valid Member bean, Model model, BindingResult result){
		
		String gotopage = "";
		
		if (result.hasErrors()) {
			System.out.println("유효성 검사에 문제 있음");
			System.out.println(bean.toString());
			System.out.println(result.toString());
			
			
		} else {
			System.out.println("유효성 검사에 문제 없음");
			
			int cnt = -1;
			cnt = mdao.insertData(bean);
			
			gotopage = "redirect:/main.ma";
		}
		
		return gotopage;
	}
}
