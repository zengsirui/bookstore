package cn.edu.hbpu.bookstore.test;

import java.util.Date;

import org.junit.runner.RunWith;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;


import cn.edu.hbpu.bookstore.pojo.Product;
import cn.edu.hbpu.bookstore.pojo.User;
import cn.edu.hbpu.bookstore.service.ProductService;
import cn.edu.hbpu.bookstore.service.UserService;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class producttest {

	@Autowired
	private UserService userService;
	@Autowired
	private ProductService productService;
	@Test
	public void test01(){
		User user=new User();
		user.setUserid(786782);
		user.setBirthday(new Date());
		userService.modifyUser(user);
		
		
	}
	@Test
	public void test02(){
		
		productService.deleteProduct(3999257);
	}
	@Test
	public void test03(){
		
		productService.getProductsByPname("合", 1, 7);
	}
	}

