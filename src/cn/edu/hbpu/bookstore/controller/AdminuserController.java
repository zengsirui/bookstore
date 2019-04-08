package cn.edu.hbpu.bookstore.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageInfo;

import cn.edu.hbpu.bookstore.pojo.Adminuser;
import cn.edu.hbpu.bookstore.service.AdminUserService;


@Controller
@RequestMapping("/admin")
public class AdminuserController {
	
	@Autowired
	private AdminUserService adminUserService;
	
	@RequestMapping(value={"/adminlist","/adminAll"})
	public ModelAndView adminlist() {
	
		List<Adminuser> list=adminUserService.getAdminUserList();
		
		

		ModelAndView modelAndView=new ModelAndView();
		modelAndView.addObject("adminlist", list);
		
		modelAndView.setViewName("admin_list");
		return modelAndView;
		
	}
	
	
	
	@RequestMapping("/addAdmin")
	@ResponseBody
	public String adminAdd(Adminuser admin){
		
		
		admin.getUsername();
		admin.getPassword();
		adminUserService.insertAdminUser(admin);
		return "ok";
	}
	
	@RequestMapping("/adminDel")
	@ResponseBody
	public String adminDel(Integer uid){
		
		
		adminUserService.delAdminUser(uid);
		return "ok";
	}
	@RequestMapping("/batchDelAdmin")
	@ResponseBody
	public String adminBatchDel(@RequestParam(value="uIds[]")Integer[] uIds){
		
		for (int i = 0; i < uIds.length; i++) {
			adminUserService.delAdminUser(uIds[i]);
		}

		return "ok";
	}
	@RequestMapping("/adminEdit/{uid}")
	public ModelAndView adminEdit(@PathVariable()Integer uid){
		
		Adminuser admin=adminUserService.getAdminuserByUid(uid);
		
		ModelAndView modelAndView=new ModelAndView();
		modelAndView.addObject("admin", admin);
	
		modelAndView.setViewName("../edit_admin");
		return modelAndView;

	}
	@RequestMapping("/adminModify")
	public String adminModify(Adminuser admin){
		adminUserService.updateAdminUser(admin);
		
		return "redirect:/admin/adminlist.htm";
	}
	
	
	
	@RequestMapping("/getAdminusersByName")
	@ResponseBody
	public ModelAndView getAdminusersByName(Adminuser adminuser ){
	  List<Adminuser> list=adminUserService.selectAdminuserByTerm(adminuser);
	  ModelAndView modelAndView=new ModelAndView();
	  if(list==null && list.size()==0){
		  modelAndView.addObject("msg","重新查询");
		  
	  }else {
		modelAndView.addObject("adminlist",list);
	}
	  modelAndView.setViewName("admin_list");
	return  modelAndView;
	  
}
	@RequestMapping("/adminLogin")
	public String adminLogin(Adminuser admin,HttpSession session){
		Boolean login=adminUserService.checkLogin(admin.getUid(),admin.getPassword());
		if (login) {
			session.setAttribute("adminuser", admin.getUid());
			return "index";
		}else{
			return "login";
		}
		
		
	}
	
}
