package cn.edu.hbpu.bookstore.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;

import cn.edu.hbpu.bookstore.pojo.CommentPojo;
import cn.edu.hbpu.bookstore.pojo.Product;
import cn.edu.hbpu.bookstore.pojo.ProductPojo;
import cn.edu.hbpu.bookstore.service.CommentService;
import cn.edu.hbpu.bookstore.service.ProductService;

@Controller
public class BookController {
   @Autowired
   private  ProductService productService;
   @Autowired
   private CommentService commentService;
 //�ֲ�  
   @RequestMapping("/getCaroBooks")
	@ResponseBody
	public PageInfo<Product> getCaroBooks(){
	   
		return productService.getCarobook();
	   
	}
   //�������Ƽ�
   @RequestMapping("/getPressBooks")
	@ResponseBody
	public PageInfo<Product> getPressBooks(){
	   
		return productService.getPressbook();
	   
	}
   //�༭�Ƽ�
   @RequestMapping("/getAuthorBooks")
	@ResponseBody
	public PageInfo<Product> getAuthorBooks(){
	   
		return productService.getAuthorbook();
	   
	}
   //�ذ��Ƽ�
   @RequestMapping("/getNewBooks")
	@ResponseBody
	public PageInfo<Product> getNewBooks(){
	   
		return productService.getNewbook();
	   
	}
   //����
   @RequestMapping("/getHotBooks")
	@ResponseBody
	public PageInfo<Product> getHotBooks(){
	   
		return productService.getHotbook();
	   
	}
   @RequestMapping("/getCatBooks")
	@ResponseBody
	public PageInfo<Product> getCatBooks(int cid,int page,int row){
	   
		return productService.getProductByCid(cid, page, row);
	   
	}
   @RequestMapping("/getCompBooks")
	@ResponseBody
	public PageInfo<Product> getCompBooks(){
	   
		return productService.getCompbook();
	   
	}
   @RequestMapping("/getSctBooks")
	@ResponseBody
	public PageInfo<Product> getSctBooks(){
	   
		return productService.getSctbook();
	   
	}
   @RequestMapping("/getMonBooks")
	@ResponseBody
	public PageInfo<Product> getMonBooks(){
	   
		return productService.getMonbook();
	   
	}
   
   @RequestMapping("/getProductByName")
   @ResponseBody
   public PageInfo<Product> getProductByName(String name,int page,int row){
	   String content="";
	   try{
		   content=URLDecoder.decode(name, "utf-8");
	   }catch (UnsupportedEncodingException e) {
		e.printStackTrace();
	}
	return productService.getProductsByPname(content, page, row);
   }
   @RequestMapping("/getBookComment")
   @ResponseBody
   public List<CommentPojo> getBookComment(int pid){
	   
	return  commentService.getCommentPojoByPid(pid);
   }
   @RequestMapping("/getProductInfo")
   @ResponseBody
   public  ProductPojo getProductInfo(int pid){
	   
	return  productService.getProductPojoByPid(pid);
   }
   
}
