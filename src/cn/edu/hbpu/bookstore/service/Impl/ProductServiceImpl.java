package cn.edu.hbpu.bookstore.service.Impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.edu.hbpu.bookstore.mapper.ProductMapper;
import cn.edu.hbpu.bookstore.pojo.Product;
import cn.edu.hbpu.bookstore.pojo.ProductExample;
import cn.edu.hbpu.bookstore.pojo.ProductPojo;
import cn.edu.hbpu.bookstore.service.ProductService;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductMapper productMapper;

	public void insertProduct(Product product) {
		// TODO Auto-generated method stub
		product.setIsplay(0);
	   	productMapper.insertSelective(product);
    
	}
	public void modifyProduct(Product product) {
		// TODO Auto-generated method stub
		productMapper.updateByPrimaryKeySelective(product);
		
	}
	public void deleteProduct(Integer pid) {
		// TODO Auto-generated method stub
 		
       productMapper.deleteByPrimaryKey(pid);
		
	}
	public List<Product> getProductList() {
		// TODO Auto-generated method stub
		ProductExample example=new ProductExample();
		return productMapper.selectByExample(example);
	}
	public PageInfo<Product> listProductByPage(int page, int row) {
		// TODO Auto-generated method stub
		PageHelper.startPage(page, row);
		ProductExample example=new ProductExample();
		List<Product> list=productMapper.selectByExample(example);
		list=productutil(list);
		PageInfo<Product> pageInfo=new PageInfo<Product>(list);
		return pageInfo;
	}
	public PageInfo<ProductPojo> getProduct(int page, int row) {
		// TODO Auto-generated method stub
		PageHelper.startPage(page, row);
		List<ProductPojo> list=productMapper.selectProductPojoList();
		list=productutilt(list);
		PageInfo<ProductPojo> pageInfo=new PageInfo<ProductPojo>(list);
		return pageInfo;
		
	}
	public ProductPojo getProductPojoByPid(Integer pid) {
		// TODO Auto-generated method stub
		 ProductPojo productPojo= productMapper.selectProductPojoByPid(pid);
		  productPojo.setImage("/pic/"+productPojo.getImage());
		 return productPojo;
	}
	
	
	

	
	public PageInfo<Product> getProductsByPname(String name, int page, int row) {
		// TODO Auto-generated method stub
				PageHelper.startPage(page, row);
				ProductExample example=new ProductExample();
				example.createCriteria().andPnameLike("%"+name+"%");
				List<Product> list=productMapper.selectByExample(example);
				list=productutil(list);
				PageInfo<Product> pageInfo=new PageInfo<Product>(list);
				return pageInfo;		
		}
	
	
	public List<Product>  productutil(List<Product> list){
	     for (Product product : list) {
			product.setImage("/pic/"+product.getImage());
		}
		return list ;
	}
	
	public List<ProductPojo>  productutilt(List<ProductPojo> list){
	     for (ProductPojo productPojo : list) {
			productPojo.setImage("/pic/"+productPojo.getImage());
		}
		return list ;
	}
 	
 	//�༭�Ƽ�
	public PageInfo<Product> getAuthorbook() {
		// TODO Auto-generated method stub
		PageHelper.startPage(1, 5);
		ProductExample example=new ProductExample();
		example.createCriteria().andStateEqualTo(2);
		example.setOrderByClause("pid desc");//����
		List<Product> list=productMapper.selectByExample(example);
		list=productutil(list);
		PageInfo<Product> pageInfo=new PageInfo<Product>(list);
		return pageInfo;
		}
	//�ֲ�
	public PageInfo<Product> getCarobook() {
		// TODO Auto-generated method stub
		PageHelper.startPage(1, 5);
		ProductExample example=new ProductExample();
		example.createCriteria().andStateEqualTo(1);
		example.setOrderByClause("pid desc");//����
		List<Product> list=productMapper.selectByExample(example);
		list=productutil(list);
		PageInfo<Product> pageInfo=new PageInfo<Product>(list);
		return pageInfo;
		
	}
	//����
	public PageInfo<Product> getHotbook() {
		// TODO Auto-generated method stub
		PageHelper.startPage(1, 5);
		ProductExample example=new ProductExample();
		example.createCriteria().andStateEqualTo(4);
		example.setOrderByClause("pid desc");//����
		List<Product> list=productMapper.selectByExample(example);
		list=productutil(list);
		PageInfo<Product> pageInfo=new PageInfo<Product>(list);
		return pageInfo;
	}
	//�ذ��Ƽ�
	public PageInfo<Product> getNewbook() {
		// TODO Auto-generated method stub
		PageHelper.startPage(1, 5);
		ProductExample example=new ProductExample();
		example.createCriteria().andStateEqualTo(5);
		example.setOrderByClause("pid desc");//����
		List<Product> list=productMapper.selectByExample(example);
		list=productutil(list);
		PageInfo<Product> pageInfo=new PageInfo<Product>(list);
		return pageInfo;
	}
	public PageInfo<Product> getCompbook() {
		// TODO Auto-generated method stub
		PageHelper.startPage(1, 8);
		ProductExample example=new ProductExample();
		example.createCriteria().andCidEqualTo(1);
		example.setOrderByClause("pid desc");//����
		List<Product> list=productMapper.selectByExample(example);
		list=productutil(list);
		PageInfo<Product> pageInfo=new PageInfo<Product>(list);
		return pageInfo;
	
	}
	public PageInfo<Product> getSctbook() {
		// TODO Auto-generated method stub
		PageHelper.startPage(1, 8);
		ProductExample example=new ProductExample();
		example.createCriteria().andCidEqualTo(2);
		example.setOrderByClause("pid desc");//����
		List<Product> list=productMapper.selectByExample(example);
		list=productutil(list);
		PageInfo<Product> pageInfo=new PageInfo<Product>(list);
		return pageInfo;
	}
	public PageInfo<Product> getMonbook() {
		// TODO Auto-generated method stub
		PageHelper.startPage(1, 8);
		ProductExample example=new ProductExample();
		example.createCriteria().andCidEqualTo(3);
		example.setOrderByClause("pid desc");//����
		List<Product> list=productMapper.selectByExample(example);
		list=productutil(list);
		PageInfo<Product> pageInfo=new PageInfo<Product>(list);
		return pageInfo;
	}
	
	//�����Ƽ�
	public PageInfo<Product> getPressbook() {
		// TODO Auto-generated method stub
		PageHelper.startPage(1, 5);
		ProductExample example=new ProductExample();
		example.createCriteria().andStateEqualTo(3);
		example.setOrderByClause("pid desc");//����
		List<Product> list=productMapper.selectByExample(example);
		list=productutil(list);
		PageInfo<Product> pageInfo=new PageInfo<Product>(list);
		return pageInfo;
	}
	public PageInfo<Product> getProductByCid(int cid, int page, int row) {
		// TODO Auto-generated method stub
		PageHelper.startPage(page, row);
		ProductExample example=new ProductExample();
		example.createCriteria().andCidEqualTo(cid);
		List<Product> list=productMapper.selectByExample(example);
		list=productutil(list);
		PageInfo<Product> pageInfo=new PageInfo<Product>(list);
		return pageInfo;
	}
	
	
	
	
	

	
	

}
