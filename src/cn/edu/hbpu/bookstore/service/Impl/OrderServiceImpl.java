package cn.edu.hbpu.bookstore.service.Impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.edu.hbpu.bookstore.mapper.OrdersMapper;
import cn.edu.hbpu.bookstore.mapper.OrderitemMapper;
import cn.edu.hbpu.bookstore.mapper.ShopcartMapper;
import cn.edu.hbpu.bookstore.pojo.OrderPojo;
import cn.edu.hbpu.bookstore.pojo.Orders;
import cn.edu.hbpu.bookstore.pojo.Orderitem;
import cn.edu.hbpu.bookstore.pojo.OrderitemPojo;
import cn.edu.hbpu.bookstore.pojo.Shopcart;
import cn.edu.hbpu.bookstore.service.OrderService;
import cn.edu.hbpu.bookstore.pojo.Orders;
import cn.edu.hbpu.bookstore.pojo.OrdersExample;
@Service
public class OrderServiceImpl implements OrderService {
@Autowired
private OrdersMapper ordersMapper;
@Autowired 
 private OrderitemMapper orderitemMapper;
@Autowired
private ShopcartMapper shopcartMapper;

	public Integer insertOrders(Double total, Integer[] cartIds, Integer userid) {
		// TODO Auto-generated method stub
		Orders orders=new Orders();
		orders.setUserid(userid);
		orders.setTotal(total);//订单的总金额
		orders.setOrdertime(new Date());//下订单时间
		orders.setState(0);//代表未付款
		ordersMapper.insert(orders);
		Integer oid=orders.getOid();
		for (int i = 0; i < cartIds.length; i++) {
			Shopcart shopcart=shopcartMapper.selectByPrimaryKey(cartIds[i]);
			
			Orderitem orderitem=new Orderitem();
			orderitem.setCount(shopcart.getCount());
			orderitem.setPid(shopcart.getPid());
			orderitem.setSubtotal(shopcart.getSubtotal());
			orderitem.setOid(oid);
			orderitemMapper.insert(orderitem);
			
			shopcartMapper.deleteByPrimaryKey(cartIds[i]);
		}
		
		return oid;
	}

	public void updateOrders(Integer oid) {
		// TODO Auto-generated method stub
		Orders orders=ordersMapper.selectByPrimaryKey(oid);
		orders.setState(1);
		ordersMapper.updateByPrimaryKeySelective(orders);
	}

	public PageInfo<List<OrderitemPojo>> getOrderByUserid(Integer userid,
			int page, int row) {
		// TODO Auto-generated method stub
	     PageHelper.startPage(page, row);
		OrdersExample example=new OrdersExample();
		example.createCriteria().andUseridEqualTo(userid);
		example.setOrderByClause("oid desc");
		List<Orders> orderList=ordersMapper.selectByExample(example);
		
		PageInfo<Orders> pageInfo1=new PageInfo<Orders>(orderList);
		
		
		List<List<OrderitemPojo>> list=new ArrayList<List<OrderitemPojo>>();
		for(Orders orders:pageInfo1.getList()){
			List<OrderitemPojo> orderitemList=orderitemMapper.selectOrderitemPojoByOid(orders.getOid());
			for(OrderitemPojo orderitem:orderitemList){
				String image=orderitem.getImage();
				String[] split=image.split(",");
				orderitem.setImage("/pic/"+split[0]);
				orderitem.setOrdertime(orders.getOrdertime());
				orderitem.setTotal(orders.getTotal());
				String status=orders.getStatus();
				if(status==null) status="无";
				orderitem.setStatus(status);
				Integer state=orders.getState();
				String c="";
				if(state==0){
					c="未付款";
				}else if(state==1){
					c="已付款（未发货）";
				}else if(state==2){
					c="已发货";
				}else if(state==3){
					c="已收货";
				}else if(state==4){
					c="交易成功）";
				}
				orderitem.setState(c);	
			}
			list.add(orderitemList);	
		}
		PageInfo<List<OrderitemPojo>> pageInfo=new PageInfo<List<OrderitemPojo>>(list);
		pageInfo.setPages(pageInfo1.getPages());
		pageInfo.setTotal(pageInfo1.getTotal());
		pageInfo.setHasNextPage(pageInfo1.isHasNextPage());
		pageInfo.setHasPreviousPage(pageInfo1.isHasPreviousPage());	
		return pageInfo;
		
	}

	public void deleteOrders(Integer oid) {
		// TODO Auto-generated method stub
		
		ordersMapper.deleteByPrimaryKey(oid);
	}
	public PageInfo<OrderPojo> getOrder(int page ,int row){
		PageHelper.startPage(page, row);
		List<OrderPojo> list =ordersMapper.selectOrderPojoList();
		PageInfo<OrderPojo> pageInfo=new PageInfo<OrderPojo>(list);
		return pageInfo;
	}

	public void updateState(Orders orders) {
		// TODO Auto-generated method stub
		
		ordersMapper.updateByPrimaryKeySelective(orders);
	}

	public Orders getOrderByUser(Integer userid) {
		// TODO Auto-generated method stub
		OrdersExample example=new OrdersExample();
		example.createCriteria().andUseridEqualTo(userid);
		
		return ordersMapper.selectByExample(example).get(0);
	}



}
