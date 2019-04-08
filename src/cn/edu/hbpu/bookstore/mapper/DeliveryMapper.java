package cn.edu.hbpu.bookstore.mapper;

import cn.edu.hbpu.bookstore.pojo.Delivery;
import cn.edu.hbpu.bookstore.pojo.DeliveryExample;
import cn.edu.hbpu.bookstore.pojo.DeliveryPojo;

import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface DeliveryMapper {
    int countByExample(DeliveryExample example);

    int deleteByExample(DeliveryExample example);

    int deleteByPrimaryKey(Integer asid);

    int insert(Delivery record);

    int insertSelective(Delivery record);

    List<Delivery> selectByExample(DeliveryExample example);

    Delivery selectByPrimaryKey(Integer asid);

    int updateByExampleSelective(@Param("record") Delivery record, @Param("example") DeliveryExample example);

    int updateByExample(@Param("record") Delivery record, @Param("example") DeliveryExample example);

    int updateByPrimaryKeySelective(Delivery record);

    int updateByPrimaryKey(Delivery record);
    List<DeliveryPojo>  selectDeliveryPojoByuserid(Integer userid);
}