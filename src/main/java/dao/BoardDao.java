package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import vo.Board;
import vo.Reply;

@Component("bdao")
public class BoardDao {
	private final String namespace = "mapBoard." ;
	
	@Autowired
	SqlSessionTemplate abcd;
	
	public BoardDao() {
	}
	
	//해당모드에 충족하는 항목들의 갯수 구하기 - by성철
	public int SelectTotalCount(String mode, String keyword) {
		// 해당 모드와 키워드를 이용하여 조건에 맞는 데이터의 건수를 구해줍니다.
		Map<String, String> map = new HashMap<String, String>() ;
		map.put("mode", mode) ;
		map.put("keyword", "%" + keyword + "%") ;		
		return this.abcd.selectOne(namespace + "SelectTotalCount", map);	
	}
	// 페이징처리 및 필드검색을 위한 상품 목록 구하기
	public List<Board> selectAll(int offset, int limit, String mode, String keyword) {
		// 랭킹을 이용하여 해당 페이지의 데이터를 컬렉션으로 반환합니다.
		
		System.out.println("리스트 담기는것 테스트");
		System.out.println("offset : "+ offset + "limit : "+ limit +"mode : "+ mode +"keyword : "+ keyword);
		RowBounds rowBounds = new RowBounds(offset, limit);
		Map<String, String> map = new HashMap<String, String>() ;
		map.put("mode", mode) ;
		map.put("keyword", "%" + keyword + "%") ;	
		return this.abcd.selectList(namespace + "selectAll", map, rowBounds);
	}
	
	//해당하는 하나의 게시글을 확인하기 & 거기에 있는 리뷰가져오기
	public Board selectById(int bo_id) {
		return this.abcd.selectOne(namespace + "selectById", bo_id);
	}
	public Reply replyList(int bo_id) {
		return this.abcd.selectOne("mapReply." + "replyList", bo_id);
	}
	
	//답글 추가하기 
	public int insertReply(int bo_id, String mem_id, String context) {
		Reply bean = new Reply();
		bean.setBo_id(bo_id);
		bean.setMem_id(mem_id);
		bean.setContext(context);
		
		
		System.out.println(this.getClass() + " : 댓글을 등록합니다." ); 
		return this.abcd.insert(namespace + "insertReply", bean);
	
	}
	
	//게시글 추가하기
	public int insertBoard(Board bean) {
		System.out.println(this.getClass() + " : 게시물을 등록합니다." ); 
		return this.abcd.insert(namespace + "insertBoard", bean);
	}

	public int updateBoard(Board bean) {
		// TODO Auto-generated method stub
		System.out.println(bean.toString());
		return this.abcd.update(namespace + "updateBoard", bean);
	}

	public int deleteBoard(int bo_id) {
		return this.abcd.delete(namespace + "deleteBoard", bo_id);
	}
	
	

}
