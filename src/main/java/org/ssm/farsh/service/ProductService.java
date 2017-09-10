package org.ssm.farsh.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;
import org.ssm.farsh.model.Product;

public interface ProductService {

	 //修改
	public void modifyProduct(Product product);
	//删除
	public  void deleteProduct(Product product);
	//保存
	public void saveProduct(Product product);
	//通过pid查找
	public Product findProductByID(Integer pid);
	//查询所有
	public List<Product> queryAllProduct();
	//分页显示商品
	public void showProductByPage(HttpServletRequest request,Model model);
	//查询显示分页
	public void searchProductByPage(String searchText,HttpServletRequest request,Model model);
	
}
