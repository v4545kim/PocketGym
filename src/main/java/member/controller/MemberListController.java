package member.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import dao.MemberDao;
import utility.Paging;
import vo.Member;

@Controller
public class MemberListController {
	
	private ModelAndView mav = null;
	
	@Autowired
	@Qualifier("mdao")
	private MemberDao mdao;
	
	
	public MemberListController() {
		this.mav = new ModelAndView();
	}
	
	
	
	@GetMapping("/list.me")
	private ModelAndView  doGet(
			@RequestParam(value="pageNumber", required=false) String pageNumber,
			@RequestParam(value="pageSize", required=false) String pageSize,
			HttpServletRequest request)
	{
		int totalCount = this.mdao.SelectTotalCount();
		System.out.println(this.getClass() + "totalCount : " + totalCount);
		
		
		String myrul = request.getContextPath() + "/list.me";
		
		Paging pageInfo = new Paging(pageNumber, pageSize, totalCount, myrul, null, null);
		
		List<Member> lists = mdao.SelectDataList(pageInfo.getOffset(), pageInfo.getLimit());
		System.out.println("member size" + lists.size());
		
//		for(Member liss : lists)
//		{
//			System.out.println("ro_id : " + liss.getRo_id());
//		}
		
		
		this.mav.addObject("lists", lists);
		this.mav.addObject("pagingHtml", pageInfo.getPagingHtml());
		this.mav.addObject("pagingStatus", pageInfo.getPagingStatus());
		this.mav.setViewName("memberList");
	
		return this.mav;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	@PostMapping("/list.me")
	private String  doPost(Model model){
		return "";
	}
	
	
	
	
}
