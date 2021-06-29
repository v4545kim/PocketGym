package diet.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import dao.DietDao;

@Controller
public class MyDietDeleteController {
	
	private ModelAndView mav = null ;
	
	@Autowired
	@Qualifier("ddao")
	private DietDao ddao;
	
	
	
	// mav 새로 객체 생성
	public MyDietDeleteController() {
		this.mav = new ModelAndView();
	}
	
	
	@GetMapping("/mydietdelete.di")
	private ModelAndView  doGet(
			@RequestParam(value = "diet_id", required = true) int diet_id,
			@RequestParam(value = "mem_id", required = true) String id,
			@RequestParam(value = "day", required = true) String day,
			@RequestParam(value = "month", required = true) String month,
			@RequestParam(value = "year", required = true) String year)
	{
		mav = new ModelAndView();
		
		int cnt = -999999 ;
		cnt = ddao.deleteDiet(diet_id);
		

		
		
		mav.addObject("year",year);
		mav.addObject("month",month);
		mav.addObject("day",day);
		mav.addObject("id",id);
		
		
		this.mav.setViewName("redirect:/mydietdetail.di");
		
		
		return this.mav;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	@PostMapping("mydietdelete.di/post")
	private String  doPost(Model model){
		return "";
	}
}
