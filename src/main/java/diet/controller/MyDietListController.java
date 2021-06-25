package diet.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MyDietListController {
	
	private ModelAndView mav = null ;
	
	public MyDietListController() {
		this.mav = new ModelAndView();
	}
	
	@GetMapping("/mydietlist.di")
	private String  doGet(@RequestParam(value = "id", required = true) String id,
			HttpSession session){
		return "myDietList";
	}
	
	
	
	
	
	
}
