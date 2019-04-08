package cn.edu.hbpu.bookstore.service;

import java.util.List;

import cn.edu.hbpu.bookstore.pojo.Product;
import cn.edu.hbpu.bookstore.pojo.ProductPojo;

import com.github.pagehelper.PageInfo;


public interface ProductService {
	void insertProduct(Product product);
	void deleteProduct(Integer pid);
	void modifyProduct(Product product);
	
	List<Product> getProductList();
	

	
	ProductPojo getProductPojoByPid(Integer pid);
	
	PageInfo<ProductPojo> getProduct(int page,int row);
	
	
	
	
	
	PageInfo<Product> getProductsByPname(String name,int page,int row);
	PageInfo<Product> getProductByCid(int cid, int page,int row);
	
	PageInfo<Product>  getCarobook();
	PageInfo<Product> getPressbook();
	PageInfo<Product>   getAuthorbook();
	PageInfo<Product>   getHotbook();
	PageInfo<Product>  getNewbook();
	PageInfo<Product> getCompbook();
	PageInfo<Product> getSctbook();
	PageInfo<Product> getMonbook();
	
	
	
	
	
		

}
