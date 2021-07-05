package product.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import dao.ProductsDao;
import vo.Product;

@Controller
public class ProductDetailController {
	
	@Autowired
	@Qualifier("pdao")
	private ProductsDao dao;
	
	// 상품 리스트 페이지에서 상품의 사진이나 제목을 클릭할 때
	@GetMapping("/prdetail.pr")
	private ModelAndView  doGet(
			@RequestParam(value = "pr_id", required = true) int pr_id){
		ModelAndView mav = new ModelAndView();
		
		Product bean = dao.selectDataByPk(pr_id);
		
		
		if(bean != null) {
			mav.addObject("bean", bean);
			mav.setViewName("prDetail");
		} else {
			mav.setViewName("redirect:/prlist.pr");
		}
		
		return mav;
	}
}
