package cn.edu.hbpu.bookstore.service;

import java.util.List;

import cn.edu.hbpu.bookstore.pojo.Adminuser;

import com.github.pagehelper.PageInfo;

public interface AdminUserService {
    public void insertAdminUser(Adminuser admin);
	public List<Adminuser> getAdminUserList();
	public void delAdminUser(Integer uid);
	 public void updateAdminUser(Adminuser admin);
	public Adminuser getAdminuserByUid(Integer uid);
	public List<Adminuser> selectAdminuserByTerm(Adminuser adminuser);
    public Boolean checkLogin(Integer uid,String password);
}
