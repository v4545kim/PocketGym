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
	
	// my 장바구니 버튼을 클릭하거나 상품 상세 페이지에서 장바구니 버튼을 클릭할 때
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
				session.setAttribute("msg", "장바구니가 비어있습니다.");
				
				mav.setViewName("redirect:/prlist.pr");
			} else {
				// 초기에 장바구니가 비어있을 때 세션에 저장한 'msg'가 장바구니에 상품을 추가해도 계속 남아 있어 session.removeAttribute를 사용하여 지워준다. 
				session.removeAttribute("msg");
				
				mav.addObject("cartlists", cartlists);
				
				mav.setViewName("prCart");
			}
		}
		return mav;
	}
}
