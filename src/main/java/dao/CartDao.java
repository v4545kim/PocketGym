package dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import vo.Cart;
import vo.Order;

@Component("cdao")
public class CartDao {
	private final String NAMESPACE = "mapCart.";

	@Autowired
	SqlSessionTemplate abcd;

	public int insertCart(Cart cart) {
		return this.abcd.insert(NAMESPACE + "insertCart", cart);
	}

	public List<Cart> selectCartList(String mem_id) {
		return this.abcd.selectList(NAMESPACE + "selectCartList", mem_id);
	}

	public int deleteCart(int cart_id) {
		return this.abcd.delete(NAMESPACE + "deleteCart", cart_id);
	}

	
	

}
