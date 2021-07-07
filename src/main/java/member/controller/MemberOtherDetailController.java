package member.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import dao.MemberDao;
import dao.RoutineDao;
import vo.Member;
import vo.Routine;

@Controller
public class MemberOtherDetailController {
	
	@Autowired
	@Qualifier("mdao")
	private MemberDao mdao;
	
	@Autowired
	@Qualifier("rdao")
	RoutineDao rdao;

	
	@GetMapping("/otherdetail.me")
	private String  doGet(Model model, 
			@RequestParam(value = "mem_id", required = true) String id
			){
		Member bean = mdao.selectById(id);
		model.addAttribute("bean", bean);
		
		int valid =0;
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
		
		return "otherDetail";
	}

}
