package board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import dao.BoardDao;

@Controller
public class BoardDeleteController {
	
	ModelAndView mav = null;
	@Autowired
	@Qualifier("bdao")
	private BoardDao dao ;
	
	
	@GetMapping("/brdelete.br")
	private String doGet(
			@RequestParam(value = "bo_id", required = true) int bo_id
			){ 
		int cnt = -99999;
		cnt = dao.deleteBoard(bo_id);
		return "redirect:/brlist.br";
	}
	
}
