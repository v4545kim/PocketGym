package board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import dao.BoardDao;

@Controller
public class BoardReplyUpdateController {
	
	@Autowired
	@Qualifier("bdao")
	private BoardDao dao ;
	
	@GetMapping("/reupdate.br")
	private String  doGet(Model model,
			@RequestParam(value = "bo_id", required = true) int bo_id,
			@RequestParam(value = "re_id", required = true) int re_id,
			@RequestParam(value = "mem_id", required = true) String mem_id,
			@RequestParam(value = "context", required = true) String context){
		
		model.addAttribute("bo_id", bo_id);
		model.addAttribute("re_id", re_id);
		model.addAttribute("mem_id", mem_id);
		model.addAttribute("context", context);
		return "replyUpdateForm";
	}
	
	@PostMapping("/reupdate.br")
	private String  doPost(Model model,
			@RequestParam(value = "bo_id", required = true) int bo_id,
			@RequestParam(value = "re_id", required = true) int re_id,
			@RequestParam(value = "mem_id", required = true) String mem_id,
			@RequestParam(value = "context", required = true) String context){
		
		int cnt = -999999 ;
		cnt = dao.updateReply(bo_id, re_id, mem_id, context);
		model.addAttribute("bo_id",bo_id);
		model.addAttribute("mem_id",mem_id);
		return "redirect:/brdetail.br";
	}
}
