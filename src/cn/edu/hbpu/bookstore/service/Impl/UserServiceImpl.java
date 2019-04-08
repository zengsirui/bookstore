package cn.edu.hbpu.bookstore.service.Impl;


import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.edu.hbpu.bookstore.mapper.UserMapper;
import cn.edu.hbpu.bookstore.pojo.DeliveryPojo;
import cn.edu.hbpu.bookstore.pojo.User;
import cn.edu.hbpu.bookstore.pojo.UserExample;
import cn.edu.hbpu.bookstore.service.UserService;

@Service
public class UserServiceImpl implements UserService {
@Autowired
private UserMapper userMapper;

	public List<User> getUserList() {
		// TODO Auto-generated method stub
		UserExample example=new UserExample();
		List<User> list=userMapper.selectByExample(example);
		return list;
		
	}

	
	public PageInfo<User> getUser(int page, int row) {
		// TODO Auto-generated method stub
		PageHelper.startPage(page, row);
		UserExample example=new UserExample();
		example.setOrderByClause("userid asc");
		List<User> list=userMapper.selectByExample(example);
		PageInfo<User> pageInfo=new PageInfo<User>(list);
		return pageInfo;
	}


	public void insertUser(User user) {
		// TODO Auto-generated method stub
          user.setState(0);
          user.setUsername(user.getUsername());
          user.setPassword(user.getPassword());
          user.setEmail(user.getEmail());
          user.setPhone(user.getPhone());
          user.setCode(user.getCode());
          user.setSex(user.getSex());
          user.setBirthday(user.getBirthday());
          user.setCreattime(new Date());
          userMapper.insertSelective(user);
	}
//修改
	public void modifyUser(User user) {
		// TODO Auto-generated method stub
		
		userMapper.updateByPrimaryKeySelective(user);
		
       
	}
	

	public void deleteUser(Integer userid) {
		// TODO Auto-generated method stub
		userMapper.deleteByPrimaryKey(userid);

	}
	
	public PageInfo<User> getUserByPname(String name, int page, int row) {
		// TODO Auto-generated method stub
			PageHelper.startPage(page, row);
			UserExample example=new UserExample();
			example.createCriteria().andUsernameLike("%"+name+"%");
			List<User> list=userMapper.selectByExample(example);
			PageInfo<User> pageInfo=new PageInfo<User>(list);
			return pageInfo;
		
		
	}
	


	public User getUsersByUserid(Integer userid) {
		// TODO Auto-generated method stub
		return userMapper.selectByPrimaryKey(userid);
	}

	public Boolean checkLogin(User user) {
		// TODO Auto-generated method stub
		User user2=userMapper.selectByPrimaryKey(user.getUserid());
		if(user2!=null&&user2.getPassword().equals(user.getPassword())){
			return true;
		}
		return false;
	}

	
	
	

}
