package product.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import dao.CartDao;
import vo.Member;

@Controller
public class ProductCartController {
	
	@Autowired
	@Qualifier("cdao")
	CartDao dao;
	
	@GetMapping("prcart.pr/get")
	private String  doGet(Model model){
		return "";
	}
	
	@PostMapping("prcart.pr/post")
	private ModelAndView  doPost(
			@RequestParam(value = "pr_id", required = true) int pr_id,
			@RequestParam(value = "price", required = true) int price,
			@RequestParam(value = "count", required = true) int count,
			HttpSession session){
		ModelAndView mav = new ModelAndView();
		Member loginfo = (Member)session.getAttribute("loginfo");
		
		if(loginfo == null) {
			String message = "로그인이 필요합니다.";
			
			mav.addObject("errmsg", message);
			mav.setViewName("redirect:/prdetail.pr");
		} else {
			if (stock) {
				
			} else {

			}
		}
		
		
		return null;
	}
}
