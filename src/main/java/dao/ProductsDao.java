package dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import vo.Product;

@Component("pdao")
public class ProductsDao {
	private final String NAMESPACE = "mapProduct.";
	
	@Autowired
	SqlSessionTemplate abcd;
	
	public Product selectDataByPk(int pr_id) {
		return this.abcd.selectOne(NAMESPACE + "selectDataByPk", pr_id) ;
	}
	
}
