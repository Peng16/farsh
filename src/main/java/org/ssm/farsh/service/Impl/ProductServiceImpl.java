package org.ssm.farsh.service.Impl;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;
import org.ssm.farsh.dao.ProductDao;
import org.ssm.farsh.model.Page;
import org.ssm.farsh.model.Product;
import org.ssm.farsh.model.Scart;
import org.ssm.farsh.model.User;
import org.ssm.farsh.service.ProductService;
@Service("ProductService")
public class ProductServiceImpl implements ProductService {

	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired
	private ProductDao productDao;
	@Override
	public void modifyProduct(Product product) {
		// TODO Auto-generated method stub
		productDao.modifyProduct(product);
	}

	@Override
	public void deleteProduct(Product product) {
		// TODO Auto-generated method stub
		productDao.deleteProduct(product);
	}

	@Override
	public void saveProduct(Product product) {
		// TODO Auto-generated method stub
		productDao.saveProduct(product);
	}

	@Override
	public Product findProductByID(Integer pid) {
		// TODO Auto-generated method stub
		return productDao.findProductByID(pid);
	}

	@Override
	public List<Product> queryAllProduct() {
		// TODO Auto-generated method stub
		return productDao.queryAllProduct();
	}

	@Override
	public void showProductByPage(HttpServletRequest request, Model model) {
		// TODO Auto-generated method stub
		String pageNow = request.getParameter("pageNow");
		Page page = null;
		List<Product> productlist= new ArrayList<Product>();
		int totalCount = (int)productDao.getProductCount();
		if(pageNow!=null){
			page = new Page(totalCount, Integer.parseInt(pageNow));
			productlist = productDao.queryAllProductByPage(page.getStartPos(), page.getPageSize());
		}else{
			page = new Page(totalCount, 1);
			productlist = productDao.queryAllProductByPage(page.getStartPos(), page.getPageSize());
		}
		model.addAttribute("productlist", productlist);
		System.out.println("分页信息"+page.toString());
		model.addAttribute("page",page);
		
	}

	@Override
	public void searchProductByPage(String searchText,
			HttpServletRequest request, Model model) {
		// TODO Auto-generated method stub
		String pageNow = request.getParameter("pageNow");
		Page page = null;
		List<Product> productlist= new ArrayList<Product>();
		List<Product> productlist2 = productDao.queryAllProduct();
		System.out.println(searchText);
		for (Product product : productlist2) {
			if (searchText.equals(product.getPcategory())) {
				int totalCount = (int)productDao.getProductByPcategoryCount(searchText);
				System.out.println(totalCount+" 总数");
				if(pageNow!=null){
					page = new Page(totalCount, Integer.parseInt(pageNow));
					productlist = productDao.queryAllProductByPcategory(searchText, page.getStartPos(), page.getPageSize());
				}else{
					page = new Page(totalCount, 1);
					productlist = productDao.queryAllProductByPcategory(searchText, page.getStartPos(), page.getPageSize());
				}
				model.addAttribute("productlist", productlist);
				System.out.println("分页信息"+page.toString());
				model.addAttribute("page",page);
				break;
			}else if(product.getPname().equals(searchText)){
				int totalCount = (int)productDao.getProductByPnameCount(searchText);
				if(pageNow!=null){
					page = new Page(totalCount, Integer.parseInt(pageNow));
					productlist = productDao.queryAllProductByPname(searchText, page.getStartPos(), page.getPageSize());
				}else{
					page = new Page(totalCount, 1);
					productlist = productDao.queryAllProductByPname(searchText, page.getStartPos(), page.getPageSize());
				}
				model.addAttribute("productlist", productlist);
				System.out.println("分页信息"+page.toString());
				model.addAttribute("page",page);
				break;
			}else{
				productlist=null;
			}
		}
		model.addAttribute("productlist", productlist);
		System.out.println("分页chanpling信息"+productlist);
		model.addAttribute("page",page);
		
	}

	 

}
