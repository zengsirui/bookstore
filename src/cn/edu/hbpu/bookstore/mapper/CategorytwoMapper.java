package cn.edu.hbpu.bookstore.mapper;

import cn.edu.hbpu.bookstore.pojo.Categorytwo;
import cn.edu.hbpu.bookstore.pojo.CategorytwoExample;
import cn.edu.hbpu.bookstore.pojo.CategorytwoPojo;

import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface CategorytwoMapper {
    int countByExample(CategorytwoExample example);

    int deleteByExample(CategorytwoExample example);

    int deleteByPrimaryKey(Integer ccid);

    int insert(Categorytwo record);

    int insertSelective(Categorytwo record);

    List<Categorytwo> selectByExample(CategorytwoExample example);

    Categorytwo selectByPrimaryKey(Integer ccid);

    int updateByExampleSelective(@Param("record") Categorytwo record, @Param("example") CategorytwoExample example);

    int updateByExample(@Param("record") Categorytwo record, @Param("example") CategorytwoExample example);

    int updateByPrimaryKeySelective(Categorytwo record);

    int updateByPrimaryKey(Categorytwo record);
    
   List<CategorytwoPojo> selectCategoryPojoList();
    
    CategorytwoPojo selectCategorytwoPojoByCCid(Integer ccid);
    
    
}