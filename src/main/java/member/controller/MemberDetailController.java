package member.controller;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import dao.MemberDao;
import vo.Member;

@Controller
public class MemberDetailController {
	
	@Autowired
	@Qualifier("mdao")
	private MemberDao mdao;

	
	@GetMapping("/detail.me")
	private String  doGet(Model model, HttpSession session){
		Member member = (Member) session.getAttribute("loginfo");
		String id = member.getId();
		Member bean = mdao.selectById(id);
		Double myWeight = mdao.selectMyWeight(id);
		System.out.println(myWeight);
		model.addAttribute("bean", bean);
		model.addAttribute("myWeight", myWeight);
		return "meDetail";
	}

}
