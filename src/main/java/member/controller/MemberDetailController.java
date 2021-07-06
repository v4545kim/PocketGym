package member.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import dao.MemberDao;
import dao.RoutineDao;
import vo.Member;
import vo.Routine;

@Controller
public class MemberDetailController {
	
	@Autowired
	@Qualifier("mdao")
	private MemberDao mdao;
	
	@Autowired
	@Qualifier("rdao")
	RoutineDao rdao;
	
	@GetMapping("/detail.me")
	private String  doGet(Model model, HttpSession session){
		Member member = (Member) session.getAttribute("loginfo");
		String id = member.getId();
		Member bean = mdao.selectById(id);
		Double myWeight = mdao.selectMyWeight(id);
		System.out.println(myWeight);
		
		int valid = 0;
		String ro_name = "미지정";
		if(bean.getRo_id() == 0)
		{
			valid = 1;
		}
		else
		{
			List<Routine> list = rdao.selectRoList();
			for(Routine routine : list)
			{
				if(routine.getRo_id() == bean.getRo_id())
				{
					ro_name = routine.getRo_name();
				}
			}
		}
		
		model.addAttribute("valid", valid);
		model.addAttribute("ro_name", ro_name);
		model.addAttribute("bean", bean);
		model.addAttribute("myWeight", myWeight);
		return "meDetail";
	}

}
