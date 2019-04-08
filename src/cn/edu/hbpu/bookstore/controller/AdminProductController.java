package cn.edu.hbpu.bookstore.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.PageInfo;




import cn.edu.hbpu.bookstore.pojo.OrderPojo;
import cn.edu.hbpu.bookstore.pojo.OrderitemPojo;
import cn.edu.hbpu.bookstore.pojo.Orders;
import cn.edu.hbpu.bookstore.pojo.Product;
import cn.edu.hbpu.bookstore.pojo.ProductPojo;
import cn.edu.hbpu.bookstore.pojo.User;

import cn.edu.hbpu.bookstore.service.OrderService;
import cn.edu.hbpu.bookstore.service.OrderitemService;
import cn.edu.hbpu.bookstore.service.ProductService;
import cn.edu.hbpu.bookstore.util.CommonUtils;

@Controller
public class AdminProductController {
   @Autowired
   private ProductService productService;
   @Autowired
   private OrderitemService orderitemService;
   @Autowired
   private OrderService orderService;
   
   @RequestMapping("/admin/saveProduct")
   @ResponseBody
   public String saveProduct(Product product,@RequestParam("imageFile")MultipartFile[] files){
  
   CommonUtils.uploadFiles(product, files);
   product.setNewPrice(product.getOldPrice());
   product.setPdate(new Date());
   product.setPublicTime(new Date());
   product.setVolume(0);
   product.setIsplay(0);
   productService.insertProduct(product);

   	return "ok";
   }
   //��ҳ��ʾ�鼮
   @RequestMapping("/admin/listProduct")
	@ResponseBody
	public List<Product> listProduct(){
	   
		return productService.getProductList();
	   
	}
   @RequestMapping("/admin/getProduct")
	@ResponseBody
	public PageInfo<ProductPojo> getProduct(int page,int row){
	   
		return productService.getProduct(page, row);
	   
	}
   
   
   
   //ɾ���鼮
   @RequestMapping("/admin/deleteProducts")
   @ResponseBody
   public String deleteProducts(Integer pid){
	 productService.deleteProduct(pid);
	  return "ok";
   }
   
   @RequestMapping("/admin/getProductByName")
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
   @RequestMapping("/admin/modifyProduct")
   @ResponseBody
   public String modifyProduct(Product product,@RequestParam("imageFile")MultipartFile[] files){
  
	   //CommonUtils.uploadFiles(product, files);
	   
	   productService.modifyProduct(product);
	return "ok";
	  
   }
  
   @RequestMapping("/admin/getProductPojoByPid")
   @ResponseBody
   public ProductPojo getProductPojoByPid(Integer pid){
	   return productService.getProductPojoByPid(pid);
	
	  
   }
   @RequestMapping("/admin/getOrderitem")
   @ResponseBody
   public PageInfo<OrderitemPojo> getOrderitem(int page,int row){
      
   	return orderitemService.getOrderitem(page, row);
      
   }
   @RequestMapping("/admin/getOrder")
   @ResponseBody
   public PageInfo<OrderPojo> getOrder(int page,int row){
      
   	return orderService.getOrder(page, row);
      
   }
   @RequestMapping("/admin/deleteOrder")
   @ResponseBody
   public String deleteOrder(Integer oid){
	 orderitemService.deleteOrderitem(oid);
	 orderService.deleteOrders(oid);
	  return "ok";
   }
   
   @RequestMapping("/admin/getOrderByUserid")
   @ResponseBody
   public PageInfo<List<OrderitemPojo>> getOrderByUserid(Integer userid, int page,int row){
	   return orderService.getOrderByUserid(userid, page, row);
   
	  
   }
   @RequestMapping("/admin/modifyOrder")
   @ResponseBody
   public String modifyOrder(Integer userid){
	   System.out.println(userid);
	   Orders orders=orderService.getOrderByUser(userid);
	   System.out.println(orders.getUserid());
	   int orderState=orders.getState();
	   System.out.println("orderstate:"+orderState);
	   orderState=(orderState+1)%5;
	   orders.setState(orderState);
	   orderService.updateState(orders);
	  
	return "ok";
	  
   }
   
}