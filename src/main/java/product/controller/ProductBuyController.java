package product.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import dao.CartDao;
import vo.Cart;

@Controller
public class ProductBuyController {
	
	@Autowired
	@Qualifier("cdao")
	private CartDao cdao;
	
	@GetMapping("prbuy.pr/get")
	private ModelAndView doGet(
			@RequestParam(value = "mem_id", required = true) String mem_id){
		
		ModelAndView mav = new ModelAndView();
		
		List<Cart> cart = cdao.selectCartList(mem_id);
		
		return mav;
	}
	
	@PostMapping("prbuy.pr/post")
	private String  doPost(Model model){
		return "";
	}
}
