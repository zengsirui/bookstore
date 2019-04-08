package cn.edu.hbpu.bookstore.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;

import cn.edu.hbpu.bookstore.pojo.Categoryone;
import cn.edu.hbpu.bookstore.pojo.Categorytwo;
import cn.edu.hbpu.bookstore.pojo.CategorytwoPojo;
import cn.edu.hbpu.bookstore.service.CategoryoneService;

@Controller
public class CategoryoneController {
@Autowired
private CategoryoneService categoryoneService;


//后台
@RequestMapping("/admin/getCategories")
@ResponseBody
public List<Categoryone> getCategories(){
	
	return categoryoneService.getCategoryoneList();
	
}
@RequestMapping("/admin/delCategoryone")
@ResponseBody
public String delCategoryone(Integer cid){
	 categoryoneService.delCategoryone(cid);
	return "ok";
	
}
@RequestMapping("/admin/insertCategoryone")
@ResponseBody
public String insertCategoryone(Categoryone categoryone){
	 categoryoneService.insertCategoryone(categoryone);
	return "ok";
	
}
@RequestMapping("/admin/modifyCategoryone")
@ResponseBody
public String modifyCategoryone(Categoryone categoryone){
	 categoryoneService.modifyCategoryone(categoryone);
	return "ok";
	
}
@RequestMapping("/admin/getCategoryoneByCid")
@ResponseBody
public String getCategoryoneByCid(Integer cid){
	 categoryoneService.getCategoryoneByCid(cid);
	 return "ok";
	
}








//-----------------------------------------------------------------------------
@RequestMapping("/admin/getTwoCategories")
@ResponseBody
public List<Categorytwo> getTwoCategories(Integer cid ){
	
	return categoryoneService.getCategorytwoList(cid);
	
}
@RequestMapping("/admin/getTwoCategory")
@ResponseBody
public PageInfo<CategorytwoPojo> getTwoCategory(int page,int row){
	
	return categoryoneService.getCategorytwo(page, row);
	
}
@RequestMapping("/admin/getTwoCategoryByCCid")
@ResponseBody
public Categorytwo getTwoCategoryByCCid(Integer ccid){
	
	return categoryoneService.getCategortwoByCCid(ccid);
	
}
@RequestMapping("/admin/modifyCategorytwo")
@ResponseBody
public String modifyCategorytwo(Categorytwo categorytwo){
	 categoryoneService.modifyCategorytwo(categorytwo);
	return "ok";
	
}
@RequestMapping("/admin/delCategorytwo")
@ResponseBody
public String delCategorytwo(Integer ccid){
	 categoryoneService.delCategorytwo(ccid);
	return "ok";
	
}
@RequestMapping("/admin/insertCategorytwo")
@ResponseBody
public String insertCategorytwo(Categorytwo categorytwo){
	categorytwo.setCcname(categorytwo.getCcname());
	categorytwo.setCid(categorytwo.getCid());
	categorytwo.setState(1);
	 categoryoneService.insertCategorytwo(categorytwo);
	return "ok";
	
}

//前台

@RequestMapping("/getHCategories")
@ResponseBody
public List<Categoryone> getHCategories(HttpSession session){
	List<Categoryone> categoryoneList=(List<Categoryone>) session.getAttribute("categoryoneList");
	 if (categoryoneList==null||categoryoneList.size()==0) {
		 categoryoneList=categoryoneService.getCategoryoneList();
		session.setAttribute("categoryoneList", categoryoneList);
	}
	return categoryoneList;
	
}
@RequestMapping("/getHTwoCategories")
@ResponseBody
public List<Categorytwo> getHTwoCategories(Integer cid ){
	
	return categoryoneService.getCategorytwoList(cid);
	
}


}
