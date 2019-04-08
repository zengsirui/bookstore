package cn.edu.hbpu.bookstore.service;

import java.util.List;

import com.github.pagehelper.PageInfo;

import cn.edu.hbpu.bookstore.pojo.DeliveryPojo;
import cn.edu.hbpu.bookstore.pojo.User;

public interface UserService {
	
	List<User> getUserList();
	
	PageInfo<User> getUser(int page,int row);
	//添加
	void insertUser(User user);
	//删除
	void deleteUser(Integer userid);
	//修改
	void modifyUser(User user);
	
	User getUsersByUserid(Integer userid);
	
	PageInfo<User> getUserByPname(String name,int page,int row);
	Boolean checkLogin(User user);
	
	
	
	

}
