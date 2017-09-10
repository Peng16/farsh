package org.ssm.test.farsh;

import static org.junit.Assert.*; 

import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.ssm.farsh.dao.ProductDao;
import org.ssm.farsh.model.Product;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:mybatis-spring/spring-mybatis.xml"})
public class ProductDaoTest {

	@Autowired
	private ProductDao productDao;
	
	@Test
	public void testModifyProduct() {
		Integer pid=45;
		String pname="香蕉";
		Double price=23.5;
		String picture="jdj.png";
		Integer psalenum=55;
		Integer pstock=523;
		Double pdiscount=0.2;
	    String pattern="色彩黄嫩";
	    Date pubdate=new Date();
	    String pcategory="水果";
	    Product product = new Product(pid, pname, price, picture, psalenum, pstock, pdiscount, pattern, pubdate, pcategory);
	    productDao.modifyProduct(product);
		
	}

	@Test
	public void testDeleteProduct() {
		Integer pid=45;
		Product product = new Product(pid);
		productDao.deleteProduct(product);
	}

	@Test
	public void testSaveProduct() {
		String pname="香蕉";
		Double price=23.5;
		String picture="jdj.jpg";
		Integer psalenum=55;
		Integer pstock=523;
		Double pdiscount=0.2;
	    String pattern="色彩黄嫩";
	    Date pubdate=new Date();
	    String pcategory="水果";
	    Product product = new Product(pname, price, picture, psalenum, pstock, pdiscount, pattern, pubdate, pcategory);
	    productDao.saveProduct(product);
	}

	@Test
	public void testFindProductByID() {
		Integer pid=28;
		Product  product = productDao.findProductByID(pid);
		System.out.println(product.toString());
	}

	@Test
	public void testQueryAllProduct() {
		List<Product> productlist = productDao.queryAllProduct();
		for(Product product:productlist){
			System.out.println(product.toString());
		}
	}

}
