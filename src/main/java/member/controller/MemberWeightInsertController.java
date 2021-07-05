package member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import dao.MemberDao;
import vo.Member;
import vo.MyWeight;

@Controller
public class MemberWeightInsertController {
	
	@Autowired
	@Qualifier("mdao")
	private MemberDao mdao;
	
	@ModelAttribute("member")
	public Member mymember() {
		return new Member();
	}
	
	@GetMapping("/myweightinsert.me")
	private String doGet(Model model){
		System.out.println("몸무게 입력 폼으로 이동");
		return "/weightInsert";
	}
	
	@PostMapping("/myweightinsert.me")
	public ModelAndView doPost(
			@RequestParam(value = "regdate", required = true) String regdate,
			@RequestParam(value = "weight", required = true) int weight,
			@RequestParam(value = "id", required = true) String id) {
		
		ModelAndView mav = new ModelAndView();
		
		MyWeight myweight = new MyWeight();
		
		myweight.setMem_id(id);
		myweight.setRegdate(regdate);
		myweight.setWeight(weight);
		
		int cnt = -1;
		
		cnt = mdao.insertMyWeight(myweight);
		
		mav.setViewName("redirect:/main.ma");
		
		return mav;
	}
}