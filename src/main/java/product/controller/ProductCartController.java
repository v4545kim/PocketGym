package product.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import dao.CartDao;
import dao.ProductsDao;
import vo.Cart;
import vo.Member;

@Controller
public class ProductCartController {
	
	@Autowired
	@Qualifier("cdao")
	CartDao cdao;
	
	@Autowired
	@Qualifier("pdao")
	ProductsDao pdao;
	
	@PostMapping("/prcart.pr")
	private ModelAndView  doPost(
			@ModelAttribute Cart cart ,
			HttpSession session){
		ModelAndView mav = new ModelAndView();
		Member loginfo = (Member)session.getAttribute("loginfo");
		
		int pr_id = cart.getPr_id();
		int count = cart.getCount();
		
		int stock = pdao.selectStockByPk(pr_id);
		int price = pdao.selectPriceByPk(pr_id);
		
		if(loginfo == null) {
			System.out.println("미로그인");
			
			mav.setViewName("redirect:/login.me");
		} else {
			if (stock < count) {
				System.out.println("재고가 부족합니다.");
				
				mav.setViewName("redirect:/prlist.pr");
			} else if(count == 0) {
				System.out.println("수량이 0입니다.");
				
				mav.addObject("pr_id", pr_id);
				mav.setViewName("redirect:/prdetail.pr");
			} else {
				int total_price = price * count;
				
				cart.setTotal_price(total_price);
				
				int cnt = -1;
				cnt = cdao.insertCart(cart);
				
				mav.setViewName("redirect:/prcartlist.pr");
			}
		}
		return mav;
	}
}
