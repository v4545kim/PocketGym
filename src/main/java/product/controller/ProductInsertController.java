package product.controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dao.ProductsDao;
import vo.Product;

@Controller
public class ProductInsertController {
	ModelAndView mav = null;
	
	@ModelAttribute("product")
	public Product product() {
		return new Product();
	}
	
	@Autowired
	@Qualifier("pdao")
	private ProductsDao pdao;
	
	public ProductInsertController() {
		this.mav = new ModelAndView();
	}
	
	@GetMapping("/insert.pr")
	private ModelAndView doGet(){
		
		this.mav.setViewName("prInsertForm");
		
		return this.mav;
	}
	
	@PostMapping("/insert.pr")
	private ModelAndView doPost(
			@ModelAttribute("product") Product bean,
			HttpServletRequest request){
		
		MultipartFile multi = bean.getAbcd() ;
		
		String uploadPath = "/upload";
		
		System.out.println("pr_name : " + bean.getPr_name());
		System.out.println("category : " + bean.getCategory());
		System.out.println("context : " + bean.getContext());
		System.out.println("price : " + bean.getPrice());
		System.out.println("stock : " + bean.getStock());
		System.out.println("image : " + bean.getAbcd());
		
		String realPath = request.getRealPath(uploadPath);
		System.out.println(realPath);
		
		try {
			File destination = utility.Utility.getUploadedFileInfo(multi, realPath);
			
			multi.transferTo(destination);
			
			bean.setImage(destination.getName());
			this.pdao.insertData(bean);
			
			mav.setViewName("redirect:/prlist.pr");
			
		}catch (IllegalStateException e) {
			e.printStackTrace();
			mav.setViewName("");
		}
		
		catch (Exception e) {
			e.printStackTrace();
			mav.setViewName("redirect:/prlist.pr");
		}
		
		return this.mav;
	}
}
