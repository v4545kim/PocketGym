package member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import dao.MemberDao;
import vo.Member;

@Controller
public class MemberLoginController {
	@Autowired
	@Qualifier("mdao")
	private MemberDao dao;
	
	@GetMapping("/login.me")
	private String  doGet(Model model){
		System.out.println("go to login.jsp");
		return "meLogin";
	}
	
	@PostMapping("/login.me")
	private String  doPost(
			@RequestParam(value = "id", required = true) String id,
			@RequestParam(value = "password", required = true) String password,
			HttpSession session, Model model){
		
			Member bean = this.dao.selectData(id, password);
				if(bean == null) {
					String message = "아이디와 비밀번호가 일치하지 않습니다.";
					model.addAttribute("message",message);
					return "meLogin";
				}else {
					session.setAttribute("loginfo", bean);
					return "redirect:/main.ma";
				}
	}
}
