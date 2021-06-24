package member.controller;

import org.springframework.beans.factory.annotation.Autowired;


import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import dao.MemberDao;
import vo.Member;

@Controller
public class MemberNicknamecheckController{
	private final String command = "/nicknamecheck.me" ; 
	private ModelAndView mav = null ;
	
	@Autowired
	@Qualifier("mdao")
	private MemberDao dao ;
	
	
	@GetMapping(command)
	public ModelAndView doGet(
			@RequestParam(value = "nickname", required = true) String nickname){
		
		mav = new ModelAndView();
		
		Member bean = dao.selectByPkNickname(nickname) ;
		
		if ( bean != null ) { // 존재하는 경우
			if(bean.getNickname().equalsIgnoreCase("관리자")) { // 관리자인  경우
				mav.addObject("message", "<font color='red'><b>사용 불가능</b></font>한 닉네임입니다.<br><font color='blue'><b>관리자</b></font>를 위한 닉네임입니다.") ;
				mav.addObject("isCheck", false) ;
			}else {
				mav.addObject("message", nickname + "은(는) 이미 <font color='red'><b>사용중</b></font>인 닉네임입니다.") ;
				mav.addObject("isCheck", false) ;	
			}
		}else{ // 존재하지 않는 회원
			mav.addObject("message", nickname + "은(는) <font color='blue'><b>사용 가능</b></font>한 닉네임입니다.") ;
			mav.addObject("isCheck", true) ;
		}
		
		this.mav.setViewName("idCheck");
		return this.mav ;
	}
}
