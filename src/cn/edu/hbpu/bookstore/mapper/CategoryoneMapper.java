package cn.edu.hbpu.bookstore.mapper;

import cn.edu.hbpu.bookstore.pojo.Categoryone;
import cn.edu.hbpu.bookstore.pojo.CategoryoneExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface CategoryoneMapper {
    int countByExample(CategoryoneExample example);

    int deleteByExample(CategoryoneExample example);

    int deleteByPrimaryKey(Integer cid);

    int insert(Categoryone record);

    int insertSelective(Categoryone record);

    List<Categoryone> selectByExample(CategoryoneExample example);

    Categoryone selectByPrimaryKey(Integer cid);

    int updateByExampleSelective(@Param("record") Categoryone record, @Param("example") CategoryoneExample example);

    int updateByExample(@Param("record") Categoryone record, @Param("example") CategoryoneExample example);

    int updateByPrimaryKeySelective(Categoryone record);

    int updateByPrimaryKey(Categoryone record);
}