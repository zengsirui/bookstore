package cn.edu.hbpu.bookstore.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageInfo;

import cn.edu.hbpu.bookstore.mapper.DeliveryMapper;
import cn.edu.hbpu.bookstore.pojo.Delivery;
import cn.edu.hbpu.bookstore.pojo.DeliveryPojo;
import cn.edu.hbpu.bookstore.service.DeliveryService;
@Service
public class DeliveryServiceImpl implements DeliveryService {
@Autowired
private DeliveryMapper deliveryMapper;
	public List<DeliveryPojo> getRecordsByUserid(Integer userid) {
		
		// TODO Auto-generated method stub
		return deliveryMapper.selectDeliveryPojoByuserid(userid);
		
		
	}
	public void deleteDelivery(Integer asid) {
		// TODO Auto-generated method stub
		deliveryMapper.deleteByPrimaryKey(asid);
	}
	public void insertDelivery(Delivery delivery) {
		// TODO Auto-generated method stub
		deliveryMapper.insert(delivery);
	}

	

}
