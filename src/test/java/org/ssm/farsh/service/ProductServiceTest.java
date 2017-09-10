package org.ssm.farsh.service;

import static org.junit.Assert.*;

import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.ssm.farsh.model.Product;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:mybatis-spring/spring-mybatis.xml","classpath:mybatis-spring/spring-service.xml","classpath:mybatis-spring/spring-mvc.xml"})
public class ProductServiceTest {

	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired
	private ProductService productService;
	@Test
	public void testModifyProduct() {
		Integer pid=64;
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
	    productService.modifyProduct(product);
	}

	@Test
	public void testDeleteProduct() {
		Integer pid=46;
		Product product = new Product(pid);
		productService.deleteProduct(product);
	}

	@Test
	public void testSaveProduct(){
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
	    productService.saveProduct(product);
	}

	@Test
	public void testFindProductByID() {
		Integer pid=28;
		Product  product = productService.findProductByID(pid);
		System.out.println(product.toString());
	}

	@Test
	public void testQueryAllProduct() {
		List<Product> productlist = productService.queryAllProduct();
		for(Product product:productlist){
			System.out.println(product.toString());
		}
	}

}
