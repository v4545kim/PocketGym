package board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import dao.BoardDao;
import vo.Board;
import vo.Reply;

@Controller
public class BoardDetailController {
	
	@Autowired
	@Qualifier("bdao")
	private BoardDao dao ;
	
	@GetMapping("/brdetail.br")
	private String doGet(Model model,
			@RequestParam(value = "bo_id", required = true ) int bo_id,
			@RequestParam(value = "mem_id", required = true ) String mem_id){
		
		//후기내용 가져오기
		Board bean = dao.selectById(bo_id);
		model.addAttribute("bean",bean);
		
		
		//게시글을 좋아요한 아이디리스트 가져오기
		List<Board> member = dao.likeList(bo_id, mem_id);
		//좋아요 추가와 좋아요 취소 처리를 위한 변수 생성
		int valid = -99999;
		for(Board mem : member) {
			System.out.println("회원 아이디 있는사람은 : " + mem.getMem_id());
			if(mem.getMem_id().equals(mem_id))
			{
				valid = 0;
			}
		}
		
		System.out.println("회원아이디 : " + mem_id);
		System.out.println("valid : " + valid);
		
		model.addAttribute("valid", valid);
		
		
		//댓글리스트를 가져오기
		List<Reply> lists = dao.replyList(bo_id);
		//댓글 유무 파악을 위한 변수 생성
		int cnt = -99999;
		if(lists.size() == 0) {
			cnt = 0;
		}
		model.addAttribute("cnt", cnt);
		model.addAttribute("lists", lists);
		
		//좋아요갯수 가져오기
		int like = dao.countLike(bo_id);
		model.addAttribute("like", like);
		System.out.println("좋아요 갯수 : "+ like);
		
		//조회수 가져오기
		int readhits = dao.countReadHit(bo_id);
		model.addAttribute("readhits",readhits);
		
		return "boardDetail";
	}
	
}
