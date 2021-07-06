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
public class MemberFindInfoController{
	private ModelAndView mav = null ;
	
	@Autowired
	@Qualifier("mdao")
	private MemberDao dao ;
	
	
	@GetMapping("/findinfo.me")
	public ModelAndView doGet(){
		mav = new ModelAndView();
		
		mav.setViewName("findInfo");
		
		return this.mav ;
	}
	
	@PostMapping("/findid.me")
	public ModelAndView doFindIdPost(
			@RequestParam(value = "name", required = true) String name,
			@RequestParam(value = "birth", required = true) String birth){
		mav = new ModelAndView();
		
		// 아이디 찾기 폼에서 값이 하나라도 안 넘어온 경우
		if(name == "" || birth == "") {
			
			// 기존에 "errmsg"에 값이 저장되어 있을 수도 있어 null로 바꾼다.
			this.mav.addObject("errmsg", null);
			this.mav.setViewName("findInfo");
		} else {
			
			// 해당 name 과 birth를 사용하는 사용자가 없는 경우
			String id = dao.findId(name, birth);
			
			if(id == null) {
				System.out.println("아이디가 존재하지 않습니다.");
				
				this.mav.addObject("errmsg", "입력하신 정보가 일치하지 않습니다.");
				this.mav.setViewName("findInfo");
			} else {
				
				this.mav.addObject("msg", "사용자님의 아이디는 [" + id + "] 입니다.");
				this.mav.setViewName("findInfo");
			}
		}
		return this.mav ;
	}
	
	@PostMapping("/findpw.me")
	public ModelAndView doFindPasswordPost(
			@RequestParam(value = "id", required = true) String id,
			@RequestParam(value = "email", required = true) String email){
		mav = new ModelAndView();
		
		// 비밀번호 찾기 폼에서 값이 하나라도 안 넘어온 경우
		if(id == "" || email == "") {
			
			// 기존에 "errmsg"에 값이 저장되어 있을 수도 있어 null로 바꾼다.
			this.mav.addObject("errmsg", null);
			this.mav.setViewName("findInfo");
		} else {
			
			// 비밀번호 찾기는 초기 비밀번호로 바꾼 후 알려준다.
			
			String password = null;
			
			// id 와 email 값을 이용하여 비밀번호를 찾는 메소드
			password = dao.findPassword(id, email);
			
			// 해당 id 와 email을 사용하는 사용자가 없는 경우
			if (password == null) {
				System.out.println("비밀번호가 존재하지 않습니다.");
				
				this.mav.addObject("errmsg", "입력하신 정보가 일치하지 않습니다.");
				this.mav.setViewName("findInfo");
			} else {
				
				// 기존 비밀번호를 1234로 바꾸어 준다.
				int cnt = -1;
				cnt = dao.changePassword(id);
				
				// 초기 바뀐 비밀번호를 반환해주는 메소드
				password = dao.returnPassword(id);
				
				mav.addObject("password", password);
				
				this.mav.addObject("msg", "초기 비밀번호 [1234]로 변경 되었습니다.");
				this.mav.setViewName("findInfo");
			}
		}
		return this.mav ;
	}
}
