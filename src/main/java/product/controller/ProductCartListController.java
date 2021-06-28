package product.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import dao.CartDao;
import dao.ProductsDao;
import vo.Cart;
import vo.Member;

@Controller
public class ProductCartListController {
	
	@Autowired
	@Qualifier("cdao")
	private CartDao cdao;
	
	@Autowired
	@Qualifier("pdao")
	private ProductsDao pdao;
	
	@GetMapping("/prcartlist.pr")
	private ModelAndView doGet(
			HttpSession session){
		ModelAndView mav = new ModelAndView();
		
		Member loginfo = (Member)session.getAttribute("loginfo");
		
		
		if(loginfo == null) {
			mav.setViewName("redirect:/login.me");
		} else {
			String mem_id = loginfo.getId();
			List<Cart> cartlists = cdao.selectCartList(mem_id);
			
			if(cartlists.size() == 0) {
				mav.setViewName("redirect:/prlist.pr");
			} else {
				mav.addObject("cartlists", cartlists);
				
				mav.setViewName("prCart");
			}
		}
		return mav;
	}
}
