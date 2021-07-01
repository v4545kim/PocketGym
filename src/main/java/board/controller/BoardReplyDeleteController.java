package board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import dao.BoardDao;

@Controller
public class BoardReplyDeleteController {
	@Autowired
	@Qualifier("bdao")
	private BoardDao dao ;
	
	
	@GetMapping("/redelete.br")
	private String  doGet(Model model,
			@RequestParam(value = "re_id", required = true) int re_id,
			@RequestParam(value = "bo_id", required = true) int bo_id
			){
		int cnt = -9999;
		cnt = dao.deleteReply(re_id);
		//댓글 삭제 후 해당 게시글의 남은 댓글의 확인을 위한 아이디 값
		model.addAttribute("bo_id", bo_id);
		return "redirect:/brdetail.br";
	}
	
}
