package product.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import dao.ProductsDao;
import utility.FlowParameters;
import utility.Paging2;
import vo.Product;

@Controller
public class ProductListController {
	
	@Autowired
	@Qualifier("pdao")
	private ProductsDao pdao;
	
	@GetMapping("/prlist.pr")
	private ModelAndView doGet(
			HttpServletRequest request,
			@RequestParam(value = "pageNumber", required = false) String pageNumber, 
			@RequestParam(value = "pageSize", required = false) String pageSize,
			@RequestParam(value = "mode", required = false) String mode,
			@RequestParam(value = "keyword", required = false) String keyword){
		
		ModelAndView mav = new ModelAndView();
		
		// 페이징과 필드 검색을 위한 파라미터를 우선 챙깁니다.
		FlowParameters parameters
		 = new FlowParameters(pageNumber, pageSize, mode, keyword);
		
		// 파라미터 확인을 위한 출력
		System.out.println(this.getClass() + " : " + parameters.toString());
		
		int totalCount = pdao.SelectTotalCount(
				parameters.getMode(), 
				parameters.getKeyword());
	
		System.out.println("totalCount : " + totalCount );
		
		
		String contextpath = request.getContextPath() + "/";
		String myurl = contextpath + "/prlist.pr";
		 
		System.out.println("myrul : "+myurl);
		
		Paging2 pageInfo
		= new Paging2(
				parameters.getPageNumber(),
				parameters.getPageSize(),
				totalCount,
				myurl,
				parameters.getMode(),
				parameters.getKeyword());
		
		List<Product> lists = pdao.selectAll(
				pageInfo.getOffset(),
				pageInfo.getLimit(),
				parameters.getMode(),
				parameters.getKeyword());
		
		mav.addObject("lists", lists);
		
		for (Product product : lists) {
			System.out.println(product.getPr_name());
		}
		
		mav.addObject("pagingHtml", pageInfo.getPagingHtml());
		mav.addObject("pagingStatus", pageInfo.getPagingStatus());
		
		mav.addObject("mode", parameters.getMode());
		mav.addObject("keyword", parameters.getKeyword());
		
		mav.setViewName("prList");
		
		return mav;
	}
}
