package cn.edu.hbpu.bookstore.service.Impl;

import java.util.Date;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.edu.hbpu.bookstore.mapper.AdminuserMapper;
import cn.edu.hbpu.bookstore.pojo.Adminuser;
import cn.edu.hbpu.bookstore.pojo.AdminuserExample;
import cn.edu.hbpu.bookstore.pojo.AdminuserExample.Criteria;
import cn.edu.hbpu.bookstore.service.AdminUserService;


@Service
public class AdminUserServiceImpl implements AdminUserService {
	@Autowired
	private AdminuserMapper adminuserMapper;
	
	
	
//��ʾ����Ա�б�
	public List<Adminuser> getAdminUserList() {
		// TODO Auto-generated method stub
		AdminuserExample example=new AdminuserExample();
		List<Adminuser> list=adminuserMapper.selectByExample(example);
		return list;
	}
	
//��ӹ���Ա
	public void insertAdminUser(Adminuser admin) {
		// TODO Auto-generated method stub
		
		admin.setStatus("0");
		admin.setLogintime(new Date());
	     adminuserMapper.insertSelective(admin);
	
	}
//ɾ�����Ա
	public void delAdminUser(Integer uid) {
		// TODO Auto-generated method stub
		adminuserMapper.deleteByPrimaryKey(uid);
	}
//�޸�
	public void updateAdminUser(Adminuser admin) {
		// TODO Auto-generated method stub
		adminuserMapper.updateByPrimaryKeySelective(admin);
	}

	public Adminuser getAdminuserByUid(Integer uid) {
		// TODO Auto-generated method stub
		return adminuserMapper.selectByPrimaryKey(uid);
	}
//��̨����Ա��ѯ

	public List<Adminuser> selectAdminuserByTerm(Adminuser adminuser) {
		// TODO Auto-generated method stub
		AdminuserExample example=new AdminuserExample();
		Criteria adminuCriteria=example.createCriteria();
		if (adminuser.getUsername()!=null&&!"".equals(adminuser.getUsername())) {
			adminuCriteria.andUsernameLike("%"+adminuser.getUsername()+"%");
		}
		List<Adminuser> list=adminuserMapper.selectByExample(example);
		return list;
	}

	public Boolean checkLogin(Integer uid, String password) {
		// TODO Auto-generated method stub
		Adminuser adminuser=adminuserMapper.selectByPrimaryKey(uid);
		if (adminuser!=null&&adminuser.getPassword().equals(password)) {
			return true;
		}else
		return false;
	}





}
