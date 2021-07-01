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
	
	public Product selectDataByPk(int pr_id) {
		return this.abcd.selectOne(NAMESPACE + "selectDataByPk", pr_id) ;
	}
	
	public int selectPriceByPk(int pr_id) {
		return this.abcd.selectOne(NAMESPACE + "selectPriceByPk", pr_id);
	}
	
	public int selectStockByPk(int pr_id) {
		return this.abcd.selectOne(NAMESPACE + "selectStockByPk", pr_id);
	}
	
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

	public int updateStock(int pr_id, int count) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("pr_id", pr_id);
		map.put("count", count);
		
		return this.abcd.update(NAMESPACE + "updateStock", map);
	}

	public int selectTotalCount(String mode, String keyword) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("mode", mode);
		map.put("keyword", "%" + keyword + "%");
		
		return this.abcd.selectOne(NAMESPACE + "selectTotalCount", map);
	}

	public List<Product> selectAll(int offset, int limit, String mode, String keyword) {
		RowBounds rowBounds = new RowBounds(offset, limit);
		Map<String, String> map = new HashMap<String, String>();
		map.put("mode", mode);
		map.put("keyword", "%" + keyword + "%");
		
		return this.abcd.selectList(NAMESPACE + "selectAll", map, rowBounds);
	}

	public int insertData(Product product) {
		return this.abcd.insert(NAMESPACE + "insertData", product);
	}
}
