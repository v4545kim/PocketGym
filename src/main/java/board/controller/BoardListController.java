package board.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import dao.BoardDao;
import utility.FlowParameters;
import utility.Paging2;
import vo.Board;

@Controller
public class BoardListController {
	
	@Autowired
	@Qualifier("bdao")
	private BoardDao dao ;
	
	@GetMapping("/brlist.br")
	private String doGet(
			HttpServletRequest request,
			@RequestParam(value = "pageNumber", required = false) String pageNumber, 
			@RequestParam(value = "pageSize", required = false) String pageSize,
			@RequestParam(value = "mode", required = false) String mode,
			@RequestParam(value = "keyword", required = false) String keyword, Model model
			)
	{
		
		// 페이징과 필드 검색을 위한 파라미터를 우선 챙깁니다.
		FlowParameters parameters 
			= new FlowParameters(pageNumber, pageSize, mode, keyword);
		
		// 파라미터 확인을 위한 출력
		System.out.println(this.getClass() + " : " + parameters.toString());
		
		int totalCount = dao.SelectTotalCount(
				parameters.getMode(), 
				parameters.getKeyword());
	
		System.out.println("totalCount : " + totalCount );
		
		
		String contextpath = request.getContextPath() + "/"; 
		String myurl = contextpath + "/brlist.br" ;
		 
		System.out.println("myrul : "+myurl);
		
		Paging2 pageInfo 
			= new Paging2(
					parameters.getPageNumber(), 
					parameters.getPageSize(), 
					totalCount,
					myurl,
					parameters.getMode(), 
					parameters.getKeyword());
		
		List<Board> lists = dao.selectAll(
				pageInfo.getOffset(),
				pageInfo.getLimit(),
				parameters.getMode(), 
				parameters.getKeyword()) ;
				// "%" 문자열은 like 연산자 때문에 넣었습니다.
//		for(Board bor : lists)
//		{
//			System.out.println("bo_id : " + bor.getBo_id());
//		}
		
		// 바인딩해야 할 목록들
		model.addAttribute("lists", lists); // 게시물 목록
		
		// 페이징 관련 항목들
		model.addAttribute("pagingHtml", pageInfo.getPagingHtml());
		model.addAttribute("pagingStatus", pageInfo.getPagingStatus());
		
		// 검색 필드의 상태 값 저장을 위한 항목들  
		model.addAttribute("mode", parameters.getMode());
		model.addAttribute("keyword", parameters.getKeyword());
		
		for(int i=0; i<lists.size(); i++) {
			System.out.println("잘넘어가는지 확인"+lists.get(i).getTitle());
		};
		
		return "boardList" ;
				
	}
	
}

