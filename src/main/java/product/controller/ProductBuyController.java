package product.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import dao.CartDao;
import dao.MemberDao;
import dao.ProductsDao;
import vo.Cart;
import vo.Member;
import vo.Order;
import vo.Product;

@Controller
public class ProductBuyController {
	private ModelAndView mav = null;
	
	@Autowired
	@Qualifier("cdao")
	private CartDao cdao;
	
	@Autowired
	@Qualifier("mdao")
	private MemberDao mdao;
	
	@Autowired
	@Qualifier("pdao")
	private ProductsDao pdao;
	
	public ProductBuyController() {
		this.mav = new ModelAndView();
	}
	
	@GetMapping("prbuy.pr")
	private ModelAndView doGet(
			@RequestParam(value = "mem_id", required = true) String mem_id){
		
		// order.jsp에 나오는 사용자의 정보를 가져오기 위한 메소드
		Member mem_info = mdao.selectForOrder(mem_id);
		
		List<Cart> cartlists = cdao.selectCartList(mem_id);
		
		int total_price = 0 ;
		
		for (Cart cart : cartlists) {
			total_price += cart.getTotal_price();
		}
		
		this.mav.addObject("total_price",total_price);
		this.mav.addObject("mem_info", mem_info);
		this.mav.addObject("cartlists", cartlists);
		this.mav.setViewName("order");
		
		return this.mav;
	}
	
	@GetMapping("prbuy2.pr")
	private ModelAndView directBuyDoGet(
			@RequestParam(value = "mem_id", required = true) String mem_id,
			@RequestParam(value = "pr_id", required = true) int pr_id,
			@RequestParam(value = "count", required = true) int count){
		
		// order.jsp에 나오는 사용자의 정보를 가져오기 위한 메소드
		Member mem_info = mdao.selectForOrder(mem_id);
		
		Product product = pdao.selectDataByPk(pr_id);
		
		int price = product.getPrice();
		
		int total_price = price * count;
		
		Order order = new Order();
		order.setCount(count);
		order.setTotal_price(total_price);
		
		this.mav.addObject("order", order);
		this.mav.addObject("product", product);
		this.mav.addObject("mem_info", mem_info);
		this.mav.setViewName("orderDirect");
		
		return this.mav;
	}
	
	@PostMapping("prbuy.pr")
	private ModelAndView doPost(
			@RequestParam(value = "address1", required = true) String orderaddress1,
			@RequestParam(value = "address2", required = true) String orderaddress2,
			@RequestParam(value = "pay", required = true) int pay,
			HttpSession session){
		
		Order order = null;
		
		String address1 = orderaddress1;
		String address2 = orderaddress2;
		
		Member loginfo = (Member)session.getAttribute("loginfo");
		String mem_id = loginfo.getId();
		int point = loginfo.getPoint();
		
		if (point < pay) {
			this.mav.setViewName("redirect:/prcartlist.pr");
			
		} else {
		
			int pr_id=0;
			int cart_id=0;
			int count=0;
			int total_price=0;
			
			
			List<Cart> cartlists = cdao.selectCartList(mem_id);
			
			for (Cart cart : cartlists) {
				int cnt = -99999;
				pr_id = cart.getPr_id();
				count = cart.getCount();
				total_price = cart.getTotal_price();
				
				// 결제 완료된 리스트들을 담아준다.
				cnt = pdao.insertOrder(address1, address2, mem_id, pr_id, count, total_price);
				
				cart_id = cart.getCart_id();
				
				// 결제한 후 장바구니에 있는 리스트들은 삭제 해준다.
				cnt = cdao.deleteCart(cart_id);
				
				// 결제한 후 상품 재고를 업데이트 해준다. 
				cnt = pdao.updateStock(pr_id, count);
				
				order = new Order();
				order.setMem_id(mem_id);
				order.setTotal_price(total_price);
				
				// 결제한 후 사용자의 포인트에서 총 금액을 차감 해준다.
				cnt = mdao.changePoint(order);
		}
		
		this.mav.setViewName("orderResult");
		}
		
		return this.mav;
	}
	
	@PostMapping("prbuy2.pr")
	private ModelAndView directBuyDoPost(
			@RequestParam(value = "address1", required = true) String orderaddress1,
			@RequestParam(value = "address2", required = true) String orderaddress2,
			@RequestParam(value = "pr_id", required = true) int orderpr_id,
			@RequestParam(value = "count", required = true) int ordercount,
			@RequestParam(value = "total_price", required = true) int ordertotal_price,
			HttpSession session){
		
		Order order = null;
		
		String address1 = orderaddress1;
		String address2 = orderaddress2;
		int pr_id = orderpr_id;
		int count = ordercount;
		int total_price = ordertotal_price;
		
		Member loginfo = (Member)session.getAttribute("loginfo");
		String mem_id = loginfo.getId();
		
		int cnt = -1;
		
		// 결제 완료된 리스트들을 담아준다.
		cnt = pdao.insertOrder(address1, address2, mem_id, pr_id, count, total_price);
		
		// 결제한 후 상품 재고를 업데이트 해준다. 
		cnt = pdao.updateStock(pr_id, count);
		
		order = new Order();
		order.setMem_id(mem_id);
		order.setTotal_price(total_price);
		
		// 결제한 후 사용자의 포인트에서 총 금액을 차감 해준다.
		cnt = mdao.changePoint(order);
		
		this.mav.setViewName("orderDirectResult");
		
		return this.mav;
	}
}
