package product.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import dao.ProductsDao;

@Controller
public class ProductDeleteController {
	
	@Autowired
	@Qualifier("pdao")
	private ProductsDao pdao;
	
	@GetMapping("delete.pr")
	private ModelAndView doGet(
			@RequestParam(value = "pr_id", required = true) int pr_id){
		
		ModelAndView mav = new ModelAndView();
		
		int cnt = -1;
		cnt = pdao.deleteData(pr_id);
		
		mav.setViewName("redirect:/prlist.pr");
		
		return mav;
	}
}
