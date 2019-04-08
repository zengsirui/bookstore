package cn.edu.hbpu.bookstore.service;

import java.util.List;

import com.github.pagehelper.PageInfo;

import cn.edu.hbpu.bookstore.pojo.Orderitem;
import cn.edu.hbpu.bookstore.pojo.OrderitemPojo;

public interface OrderitemService {
 List<OrderitemPojo> getOrderitemByOid(Integer oid);
 void deleteOrderitem(Integer oid);
 PageInfo<OrderitemPojo> getOrderitem(int page, int row);

 
}
