package cn.edu.hbpu.bookstore.mapper;

import cn.edu.hbpu.bookstore.pojo.Orderitem;
import cn.edu.hbpu.bookstore.pojo.OrderitemExample;
import cn.edu.hbpu.bookstore.pojo.OrderitemPojo;

import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface OrderitemMapper {
    int countByExample(OrderitemExample example);

    int deleteByExample(OrderitemExample example);

    int deleteByPrimaryKey(Integer itemid);

    int insert(Orderitem record);

    int insertSelective(Orderitem record);

    List<Orderitem> selectByExample(OrderitemExample example);

    Orderitem selectByPrimaryKey(Integer itemid);

    int updateByExampleSelective(@Param("record") Orderitem record, @Param("example") OrderitemExample example);

    int updateByExample(@Param("record") Orderitem record, @Param("example") OrderitemExample example);

    int updateByPrimaryKeySelective(Orderitem record);

    int updateByPrimaryKey(Orderitem record);
    
    List<OrderitemPojo> selectOrderitemPojoByOid(Integer oid);
    
    List<OrderitemPojo> selectOrderitemPojo();
}