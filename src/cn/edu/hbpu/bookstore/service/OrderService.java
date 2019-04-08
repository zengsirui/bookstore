package cn.edu.hbpu.bookstore.service;

import java.util.List;

import cn.edu.hbpu.bookstore.pojo.OrderPojo;
import cn.edu.hbpu.bookstore.pojo.OrderitemPojo;
import cn.edu.hbpu.bookstore.pojo.Orders;

import com.github.pagehelper.PageInfo;

public interface OrderService {
	Integer insertOrders(Double total,Integer[] cartIds,Integer userid);
   void updateOrders(Integer oid);
   PageInfo<List<OrderitemPojo>> getOrderByUserid(Integer userid,int page,int row);
   void deleteOrders(Integer oid);
   PageInfo<OrderPojo> getOrder(int page, int row);
   
   void updateState(Orders orders);
   
   Orders getOrderByUser(Integer userid);


   
}
