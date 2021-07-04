package board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import dao.BoardDao;

@Controller
public class BoardReplyInsertController {
	
	@Autowired
	@Qualifier("bdao")
	private BoardDao dao ;
	
	
	//댓글추가 여기서 리다이렉트
	@PostMapping("/reinsert.br")
	private String  doPost(Model model,
			@RequestParam(value = "bo_id", required = true) int bo_id,
			@RequestParam(value = "mem_id",required = true) String mem_id,
			@RequestParam(value = "context",required = true) String context
			 ){
		
		System.out.println("bo_id : " + bo_id);
		System.out.println("mem_id : " + mem_id);
		System.out.println("context : " + context);
		
		int cnt = dao.insertReply(bo_id, mem_id, context);
		
		model.addAttribute("bo_id", bo_id);
		model.addAttribute("mem_id", mem_id);
		return "redirect:/brdetail.br";
	}
}
