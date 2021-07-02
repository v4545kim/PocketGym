package product.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import dao.CartDao;

@Controller
public class ProductCartDeleteController {
	
	@Autowired
	@Qualifier("cdao")
	private CartDao cdao;
	
	@GetMapping("prcartdelete.pr")
	private ModelAndView doGet(
			@RequestParam(value = "cart_id", required = true) int cart_id){
		
		ModelAndView mav = new ModelAndView();
		
		int cnt = -1;
		cnt = cdao.deleteCart(cart_id);
		
		mav.setViewName("redirect:/prcartlist.pr");
		
		return mav;
	}
}
