package cn.edu.hbpu.bookstore.service;

import java.util.List;

import cn.edu.hbpu.bookstore.pojo.Shopcart;
import cn.edu.hbpu.bookstore.pojo.ShopcartPojo;

public interface ShopcartService {
  void insertCart(Shopcart cart);
  List<ShopcartPojo> getShopcartPojoByUserid(Integer userid);
  void modify(Shopcart cart);
  void delete(Integer sid);
}
