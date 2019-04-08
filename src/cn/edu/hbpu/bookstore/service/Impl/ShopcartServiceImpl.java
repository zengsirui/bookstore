package cn.edu.hbpu.bookstore.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.edu.hbpu.bookstore.mapper.ShopcartMapper;
import cn.edu.hbpu.bookstore.pojo.Shopcart;
import cn.edu.hbpu.bookstore.pojo.ShopcartPojo;
import cn.edu.hbpu.bookstore.service.ShopcartService;
@Service
public class ShopcartServiceImpl implements ShopcartService {
@Autowired
private ShopcartMapper shopcartMapper;
	public void insertCart(Shopcart cart) {
		// TODO Auto-generated method stub
        shopcartMapper.insert(cart);
	}
	public List<ShopcartPojo> getShopcartPojoByUserid(Integer userid) {
		List<ShopcartPojo> list=shopcartMapper.selectShopcartPojoByUserid(userid);
		changeShopcartPojoList(list);
		return list;
	}
	private void changeShopcartPojoList(List<ShopcartPojo> list){
		for(int i=0;i<list.size();i++){
			ShopcartPojo shopcartPojo=list.get(i);
			String image=shopcartPojo.getImage();
			String[] split=image.split(",");
			shopcartPojo.setImage("/pic/"+split[0]);
		}
	}
	public void modify(Shopcart cart) {
		// TODO Auto-generated method stub
		shopcartMapper.updateByPrimaryKeySelective(cart);
	}
	public void delete(Integer sid) {
		// TODO Auto-generated method stub
		 shopcartMapper.deleteByPrimaryKey(sid);
	}
	
}
