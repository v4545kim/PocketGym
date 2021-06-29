package board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import dao.BoardDao;
import vo.Board;

@Controller
public class BoardDetailController {
	
	@Autowired
	@Qualifier("bdao")
	private BoardDao dao ;
	
	@GetMapping("/brdetail.br")
	private String doGet(Model model,
			@RequestParam(value = "id", required = false ) int bo_id){
		
		Board bean = dao.selectById(bo_id);
		
		model.addAttribute("bean",bean);
		return "boardDetail";
	}
	
}
