package cn.edu.hbpu.bookstore.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;

import cn.edu.hbpu.bookstore.pojo.Delivery;
import cn.edu.hbpu.bookstore.pojo.DeliveryPojo;
import cn.edu.hbpu.bookstore.pojo.ProductPojo;
import cn.edu.hbpu.bookstore.pojo.ShopcartPojo;
import cn.edu.hbpu.bookstore.pojo.User;
import cn.edu.hbpu.bookstore.service.CommentService;
import cn.edu.hbpu.bookstore.service.DeliveryService;
import cn.edu.hbpu.bookstore.service.OrderService;
import cn.edu.hbpu.bookstore.service.OrderitemService;
import cn.edu.hbpu.bookstore.service.ShopcartService;
import cn.edu.hbpu.bookstore.service.UserService;
import cn.edu.hbpu.bookstore.pojo.Shopcart;
import cn.edu.hbpu.bookstore.pojo.OrderitemPojo;
@Controller
public class FrontController {
	  @Autowired
	   private UserService userService;
	  @Autowired
	  private ShopcartService shopcartService;
	  @Autowired
	  private OrderService orderService;
	  @Autowired
	  private OrderitemService orderitemService;
	  @Autowired
	  private DeliveryService deliveryService;
	  @Autowired
	  private CommentService commentService;
	  
@RequestMapping("/checkUserLogin")
@ResponseBody
	   public Map<String, String> checkUserLogin(User user,  String checkcode,HttpSession session){
		   Map<String, String> map=new HashMap<String, String>();
		   Boolean result=userService.checkLogin(user);
		   String vCode=(String) session.getAttribute("vCode");
		   if(result&&checkcode.equalsIgnoreCase(vCode)){
			  
			   session.setAttribute("userid", String.valueOf(user.getUserid()) );
			 
			  
			  
			   map.put("result","ok");
		   }else {
			map.put("result", "error");
		}
		   
		   return map;
	   }
@RequestMapping("/addCart")
@ResponseBody
public Map<String, String> addCart(Shopcart cart,HttpSession session){
	  Map<String, String> map=new HashMap<String, String>();
	  String userid=(String) session.getAttribute("userid");
	   if(userid==null){
		   map.put("result","error");
	   }else{
		   cart.setUserid(Integer.parseInt(userid));
		   shopcartService.insertCart(cart);
		   map.put("result","ok");
	   }

	   return map;
}
@RequestMapping("/getShopcart")
@ResponseBody
	public List<ShopcartPojo> getShopcart(HttpSession session){
	String userid= (String)(session.getAttribute("userid")) ;
	return shopcartService.getShopcartPojoByUserid(Integer.parseInt(userid) );
	
}   
@RequestMapping("/modifyShopcart")
@ResponseBody
	public String modifyShopcart(Shopcart cart,HttpSession session){
		String userid=(String) session.getAttribute("userid");
		cart.setUserid(Integer.parseInt(userid));
		shopcartService.modify(cart);
		return "ok";
	
}
@RequestMapping("/modifyPwd")
@ResponseBody
	public String modifyPwd(User user,HttpSession session){
		String userid=(String) session.getAttribute("userid");
		user.setUserid(Integer.parseInt(userid));
		userService.modifyUser(user);
		return "ok";
	
}



@RequestMapping("/delShopcart")
@ResponseBody
public String delShopcart(Integer sid){
	shopcartService.delete(sid);
	return "ok";
}
@RequestMapping("/submitOrder")
@ResponseBody
public Map<String, String> submitOrder(Double total,HttpServletRequest request,HttpSession session){
	 Map<String, String> map=new HashMap<String, String>();
	 String userid=(String) session.getAttribute("userid");
	 String[] ids=request.getParameterValues("cartIds[]");
	 Integer[] cartIds=new Integer[ids.length];
	 for (int i = 0; i < ids.length; i++) {
		cartIds[i]=Integer.parseInt(ids[i]);
	}
	 Integer oid=orderService.insertOrders(total, cartIds, Integer.parseInt(userid));
	 map.put("result", oid+"");
	 return map;
}
@RequestMapping("/getOrderitemList")
@ResponseBody
public List<OrderitemPojo> getOrderitemList(Integer oid){
	   return orderitemService.getOrderitemByOid(oid);   
} 




@RequestMapping("/payOrder")
@ResponseBody
public String payOrder(Integer oid,Double total){
	   orderService.updateOrders(oid);
	   return "ok";   
}
@RequestMapping("/getOrderlistByUserid")
@ResponseBody
public PageInfo<List<OrderitemPojo>> getOrderlistByUserid(HttpSession session ,int page,int row){
	String userid=(String)session.getAttribute("userid");
	return orderService.getOrderByUserid(Integer.parseInt(userid), page, row);
}
@RequestMapping("/insertUsers")
@ResponseBody
public String insertUsers(User user){
	  userService.insertUser(user);
	  return "ok";
}
@RequestMapping("/deleteOrders")
@ResponseBody
public String deleteOrders(Integer oid){
	orderitemService.deleteOrderitem(oid);
	  orderService.deleteOrders(oid);
	   return "ok";
}
@RequestMapping("/getDelivery")
@ResponseBody
public List<DeliveryPojo> getDelivery(HttpSession session){
	String userid= (String)(session.getAttribute("userid")) ;
	   return deliveryService.getRecordsByUserid(Integer.parseInt(userid));
}
@RequestMapping("/deleteDelivery")
@ResponseBody
public String deleteDelivery(Integer asid){
	deliveryService.deleteDelivery(asid);
	return "ok";
}
@RequestMapping("/deleteUser")
@ResponseBody
public String deleteUser(Integer userid){
	userService.deleteUser(userid);
	return "ok";
}
@RequestMapping("/addDelivery")
@ResponseBody
public Map<String, String> addDelivery(Delivery delivery,HttpSession session){
	  Map<String, String> map=new HashMap<String, String>();
	  String userid=(String) session.getAttribute("userid");
	   if(userid==null){
		   map.put("result","error");
	   }else{
		  delivery.setUserid(Integer.parseInt(userid));
		   deliveryService.insertDelivery(delivery);
		   map.put("result","ok");
	   }

	   return map;
}

@RequestMapping("/getUser")
@ResponseBody
public List<User> getUser(HttpSession session){
	String userid= (String)(session.getAttribute("userid")) ;
	List<User> list=new ArrayList<User>();
	User user= userService.getUsersByUserid(Integer.parseInt(userid));
	list.add(user);
	return list;
}

@RequestMapping("/saveComment")
@ResponseBody
public Map<String, Object> saveComment(int  oid,String comments,HttpSession session){
	String userid= (String)(session.getAttribute("userid")) ;
	int userId=Integer.parseInt(userid);
	List<OrderitemPojo> orderitemByOidList = orderitemService.getOrderitemByOid(oid);
	for (OrderitemPojo orderitemPojo : orderitemByOidList) {
		commentService.saveCommentByOid(oid, orderitemPojo.getPid(), userId, comments);
	}
	
	return null;	
}



}
