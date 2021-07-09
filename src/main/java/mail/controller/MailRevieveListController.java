package mail.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import dao.MailDao;
import utility.Paging3;
import vo.Mail;
import vo.Member;


@Controller
public class MailRevieveListController 
{ //    받은 메일함 리스트
	
	private ModelAndView mav = null ;
	
	@Autowired
	@Qualifier("mldao")
	private MailDao mldao;

	
	@GetMapping("/maillist.ml")
	private ModelAndView  doGet(
			@RequestParam(value="pageNumber", required=false) String pageNumber,
			@RequestParam(value="pageSize", required=false) String pageSize,
			HttpSession session, HttpServletRequest request)
	{
		mav = new ModelAndView();
		
		Member member = (Member) session.getAttribute("loginfo");
		String id = member.getId();
		
		
		//페이징 처리
		int totalCount = this.mldao.ReceiveTotalCount(id);
		System.out.println(this.getClass() + "totalCount : " + totalCount);
		
		String myrul = request.getContextPath() + "/maillist.ml";
		
		Paging3 pageInfo = new Paging3(pageNumber, pageSize, totalCount, myrul, null, null);
		
		//내 받은 메일 리스트를 가져온다.
		List<Mail> lists = mldao.MyReceiveMailList(id, pageInfo.getOffset(), pageInfo.getLimit());
		
		
		// 읽지않은 메일 개수 표시
		int unread = 0;
		for(Mail mal : lists)
		{
			if(mal.getReadcheck() == 0)
			{
				unread++;
			}
		}
		
		this.mav.addObject("unread", unread);
		this.mav.addObject("id", id);
		this.mav.addObject("lists", lists);
		this.mav.addObject("pagingHtml", pageInfo.getPagingHtml());
		this.mav.addObject("pagingStatus", pageInfo.getPagingStatus());
		this.mav.setViewName("mailList");
		
		return this.mav;
	}
	
	
}
