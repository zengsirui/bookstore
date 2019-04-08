package cn.edu.hbpu.bookstore.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageInfo;

import cn.edu.hbpu.bookstore.pojo.Adminuser;
import cn.edu.hbpu.bookstore.pojo.User;
import cn.edu.hbpu.bookstore.pojo.UserExample;
import cn.edu.hbpu.bookstore.service.UserService;


@Controller
@RequestMapping("/admin")
public class UserController {
   @Autowired
   private UserService userService;

	//商品列表
	@RequestMapping("/userlist")
	public ModelAndView userlist(){
		List<User> list = userService.getUserList();
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("userlist", list);
		modelAndView.setViewName("user_list");
		return modelAndView;
	}
	
	//分页
	@RequestMapping("/getUsers")
	@ResponseBody
	public PageInfo<User> getUsers(Integer page, Integer row) {
		return userService.getUser(page, row);
	}
	
   
	
	
	//删除
   @RequestMapping("/deleteUsers")
   @ResponseBody
   public String deleteUsers(Integer userid){
	  userService.deleteUser(userid);
	  return "ok";
   }
   
   
   //增加
   @RequestMapping("/insertUsers")
   @ResponseBody
   public String insertUsers(User user){
	  userService.insertUser(user);
	  return "ok";
   }
   @RequestMapping("/modifyUsers")
   @ResponseBody
   public String modifyUsers(User user){
	   
	 userService.modifyUser(user);
	 return "ok";
   }
   //查询
   @RequestMapping("/getUsersByName")
   @ResponseBody
   public PageInfo<User> getUsersByName(String name,int page,int row){
	   String content="";
	   try{
		   content=URLDecoder.decode(name, "utf-8");
	   }catch (UnsupportedEncodingException e) {
		e.printStackTrace();
	}
	return userService.getUserByPname(content, page, row);
   }
   
   @RequestMapping("/getUserByUserid")
   @ResponseBody
   public User getUserByUserid(Integer userid){
	   
	  return userService.getUsersByUserid(userid);
   }
   //----------------------------------------------------
 
   
   
}
