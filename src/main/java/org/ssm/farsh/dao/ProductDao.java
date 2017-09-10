package org.ssm.farsh.dao;

import java.util.List;   

import org.apache.ibatis.annotations.Param;
import org.ssm.farsh.model.Product;

public interface ProductDao {

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
		//分页查询所有
		public List<Product> queryAllProductByPage(@Param(value="startPos")Integer startPos,@Param(value="pageSize")Integer pageSize);
		//分页查询bypname
		public List<Product> queryAllProductByPname(@Param(value="pname")String pname,@Param(value="startPos")Integer startPos,@Param(value="pageSize")Integer pageSize);
		//分页查询Bypcategory
		public List<Product> queryAllProductByPcategory(@Param(value="pcategory")String pcategory,@Param(value="startPos")Integer startPos,@Param(value="pageSize")Integer pageSize);
		//分页查询byPname记录总数
		public long getProductByPnameCount(String pname);
		//分页查询byPcategory记录总数
		public long getProductByPcategoryCount(String pcategory);
		//分页查询记录总数
		public long getProductCount();
}
