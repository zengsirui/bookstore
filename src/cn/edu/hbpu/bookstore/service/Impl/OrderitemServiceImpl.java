package cn.edu.hbpu.bookstore.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.github.pagehelper.PageInterceptor;

import cn.edu.hbpu.bookstore.mapper.OrderitemMapper;
import cn.edu.hbpu.bookstore.pojo.OrderitemPojo;
import cn.edu.hbpu.bookstore.service.OrderitemService;
import cn.edu.hbpu.bookstore.pojo.OrderitemExample;
@Service
public class OrderitemServiceImpl implements OrderitemService {
 @Autowired
 private OrderitemMapper orderitemMapper;
 
	public List<OrderitemPojo> getOrderitemByOid(Integer oid) {
		// TODO Auto-generated method stub
		List<OrderitemPojo> list=orderitemMapper.selectOrderitemPojoByOid(oid);
		changeOrderitemPojoList(list);
		return list;
	}
	
	public PageInfo<OrderitemPojo> getOrderitem(int page, int row){
		PageHelper.startPage(page,row);
		List<OrderitemPojo> list=orderitemMapper.selectOrderitemPojo();
		changeOrderitemPojoList(list);
		PageInfo<OrderitemPojo> pageInfo=new PageInfo<OrderitemPojo>(list);
		
		
		return pageInfo;
	}
	
	
	private void changeOrderitemPojoList(List<OrderitemPojo> list){
		for(int i=0;i<list.size();i++){
			OrderitemPojo item=list.get(i);
			String image=item.getImage();
			String[] split=image.split(",");
			item.setImage("/pic/"+split[0]);
		}
	}
	public void deleteOrderitem(Integer oid) {
		// TODO Auto-generated method stub
		OrderitemExample example=new OrderitemExample();
		example.createCriteria().andOidEqualTo(oid);
		orderitemMapper.deleteByExample(example);
	}
	
}
