package board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import dao.BoardDao;

@Controller
public class BoardDeleteController {
	
	ModelAndView mav = null;
	@Autowired
	@Qualifier("bdao")
	private BoardDao dao ;
	
	
	@GetMapping("/brdelete.br")
	private ModelAndView  doGet()
	{ 
		System.out.println("여기는???");
		mav = new ModelAndView();
		
		mav.setViewName("boardList");
		
		return this.mav;
	}
	
	@PostMapping("/brdelete.br")
	private String  doPost(Model model){
		return "";
	}
}
