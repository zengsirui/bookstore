package cn.edu.hbpu.bookstore.service;

import java.util.List;

import cn.edu.hbpu.bookstore.pojo.Delivery;
import cn.edu.hbpu.bookstore.pojo.DeliveryPojo;


import com.github.pagehelper.PageInfo;

public interface DeliveryService {
	List<DeliveryPojo> getRecordsByUserid(Integer userid);
	void deleteDelivery(Integer asid);
    void insertDelivery(Delivery delivery);
}
