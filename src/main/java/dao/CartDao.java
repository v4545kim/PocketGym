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

	// 사용자가 원하는 상품을 장바구니(carts)에 넣어주는 메소드
	public int insertCart(Cart cart) {
		return this.abcd.insert(NAMESPACE + "insertCart", cart);
	}

	// 사용자가 장바구니에 미리 넣어둔 리스트들을 보여주는 메소드
	public List<Cart> selectCartList(String mem_id) {
		return this.abcd.selectList(NAMESPACE + "selectCartList", mem_id);
	}

	// 사용자가 장바구니에 들어있는 상품을 삭제할 수 있게 도와주는 메소드
	public int deleteCart(int cart_id) {
		return this.abcd.delete(NAMESPACE + "deleteCart", cart_id);
	}
}
