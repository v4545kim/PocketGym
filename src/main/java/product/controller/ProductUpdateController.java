package product.controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dao.ProductsDao;
import vo.Member;
import vo.Product;

@Controller
public class ProductUpdateController {
	ModelAndView mav = null;
	
	@ModelAttribute("product")
	public Product product() {
		return new Product();
	}
	
	@Autowired
	@Qualifier("pdao")
	private ProductsDao pdao;
	
	public ProductUpdateController() {
		this.mav = new ModelAndView();
	}	
	
	// 관리자가 상품 상세 페이지에서 수정 버튼을 클릭할 때
	@GetMapping("/update.pr")
	private ModelAndView doGet(
			@RequestParam(value = "pr_id", required = true) int pr_id){
		
		// 수정할 상품의 정보를 가져온다.
		Product bean = pdao.selectDataByPk(pr_id);
		
		this.mav.addObject("bean", bean);
		this.mav.setViewName("prUpdateForm");
		
		return this.mav;
	}
	
	// 수정하기 폼에서 수정하기 버튼을 클릭할 때
	@PostMapping("/update.pr")
	private ModelAndView doPost(
			@ModelAttribute("product") @Valid Product bean,
			BindingResult asdf,
			HttpServletRequest request,
			HttpSession session){
		
		Member loginfo = (Member)session.getAttribute("loginfo");
		
		if(loginfo == null) {
			mav.setViewName("redirect:/login.me");
		} else if(! loginfo.getId().equals("admin")) {
			mav.setViewName("redirect:/main.ma");
		} else {
			if (asdf.hasErrors()) {
				System.out.println("유효성 검사에 문제가 있음");
				System.out.println(asdf);
				mav.addObject("bean", bean);
				mav.setViewName("prUpdateForm");
			} else {
				System.out.println("유효성 검사에 문제가 없음");
				
				MultipartFile multi = bean.getAbcd() ;
				
				String uploadPath = "/upload";
				
				String realPath = request.getRealPath(uploadPath);
				System.out.println(realPath);
				
				try {
					File destination = utility.Utility.getUploadedFileInfo(multi, realPath);
					
					multi.transferTo(destination);
					
					bean.setImage(destination.getName());
					this.pdao.updateData(bean);
					
					mav.setViewName("redirect:/prlist.pr");
					
				}
				
				catch (Exception e) {
					e.printStackTrace();
					mav.setViewName("redirect:/prlist.pr");
				}
			}
		
		}
		return this.mav;
	}
}
