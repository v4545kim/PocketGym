package board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import dao.BoardDao;
import dao.MemberDao;

@Controller
public class BoardLikeDeleteController {
	
	@Autowired
	@Qualifier("bdao")
	private BoardDao dao ;
	
	@Autowired
	@Qualifier("mdao")
	private MemberDao mdao ;
	
	@GetMapping("/likedelete.br")
	private String  doGet(Model model,
			@RequestParam(value = "bo_id", required = true) int bo_id,
			@RequestParam(value = "mem_id",required = true) String mem_id,
			@RequestParam(value = "bomem_id",required = true) String bomem_id
			){
		
		int cnt = -9999;
		cnt = dao.deleteLike(bo_id, mem_id);
		model.addAttribute("bo_id", bo_id);
		model.addAttribute("mem_id",mem_id);
		
		//좋아요 취소시 10 포인트 감소
		if(cnt == 1) {
			int point = mdao.deletePoint(bomem_id);
		}
		
		return "redirect:/brdetail.br";
	}
	
	
}
