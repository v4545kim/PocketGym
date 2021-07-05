package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import vo.Order;
import vo.Product;

@Component("pdao")
public class ProductsDao {
	private final String NAMESPACE = "mapProduct.";
	
	@Autowired
	SqlSessionTemplate abcd;
	
	// 상품 정보를 가져오기 위한 메소드 
	public Product selectDataByPk(int pr_id) {
		return this.abcd.selectOne(NAMESPACE + "selectDataByPk", pr_id) ;
	}
	
	// 상품의 현재 가격을 가져오기 위한 메소드
	public int selectPriceByPk(int pr_id) {
		return this.abcd.selectOne(NAMESPACE + "selectPriceByPk", pr_id);
	}
	
	// 상품의 현재 재고를 가져오기 위한 메소드
	public int selectStockByPk(int pr_id) {
		return this.abcd.selectOne(NAMESPACE + "selectStockByPk", pr_id);
	}
	
	// 결제 완료된 리스트들을 데이터베이스(orders) 테이블에 넣어주는 메소드
	public int insertOrder(String address1, String address2, String mem_id, int pr_id, int count, int total_price) {
		Order order = new Order();
		order.setAddress1(address1);
		order.setAddress2(address2);
		order.setCount(count);
		order.setMem_id(mem_id);
		order.setPr_id(pr_id);
		order.setTotal_price(total_price);
		
		return this.abcd.insert(NAMESPACE + "insertOrder", order);
	}

	// 사용자가 상품을 구매한 수량(count)만큼 상품의 재고를 최신화하기 위한 메소드
	public int updateStock(int pr_id, int count) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("pr_id", pr_id);
		map.put("count", count);
		
		return this.abcd.update(NAMESPACE + "updateStock", map);
	}
	
	// 주어진 mode와 keyword에 따른 상품의 총개수를 구하기 위한 메소드
	public int selectTotalCount(String mode, String keyword) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("mode", mode);
		map.put("keyword", "%" + keyword + "%");
		
		return this.abcd.selectOne(NAMESPACE + "selectTotalCount", map);
	}

	// 주어진 mode와 keyword에 따른 상품의 정보를 가져오기 위한 메소드 
	public List<Product> selectAll(int offset, int limit, String mode, String keyword) {
		RowBounds rowBounds = new RowBounds(offset, limit);
		Map<String, String> map = new HashMap<String, String>();
		map.put("mode", mode);
		map.put("keyword", "%" + keyword + "%");
		
		return this.abcd.selectList(NAMESPACE + "selectAll", map, rowBounds);
	}

	// 관리자 상태일 때 상품 등록을 할 수 있게 도와주는 메소드
	public int insertData(Product bean) {
		return this.abcd.insert(NAMESPACE + "insertData", bean);
	}

	// 관리자 상태일 때 상품 수정을 할 수 있게 도와주는 메소드
	public int updateData(Product bean) {
		return this.abcd.update(NAMESPACE + "updateData", bean);
		
	}
	// 관리자 상태일 때 상품 삭제를 할 수 있게 도와주는 메소드
	public int deleteData(int pr_id) {
		return this.abcd.delete(NAMESPACE + "deleteData", pr_id);
	}
}
