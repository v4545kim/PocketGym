package board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import dao.BoardDao;
import vo.Board;
import vo.Reply;

@Controller
public class BoardDetailController {
	
	@Autowired
	@Qualifier("bdao")
	private BoardDao dao ;
	
	@GetMapping("/brdetail.br")
	private String doGet(Model model,
			@RequestParam(value = "bo_id", required = false ) int bo_id){
		
		//후기내용 가져오기
		Board bean = dao.selectById(bo_id);
		model.addAttribute("bean",bean);
		
		//댓글리스트를 가져오기
		Reply lists = dao.replyList(bo_id);
		model.addAttribute("lists", lists);
		
		return "boardDetail";
	}
	
}
