package cn.edu.hbpu.bookstore.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.edu.hbpu.bookstore.mapper.CategoryoneMapper;
import cn.edu.hbpu.bookstore.mapper.CategorytwoMapper;
import cn.edu.hbpu.bookstore.pojo.Categoryone;
import cn.edu.hbpu.bookstore.pojo.CategoryoneExample;
import cn.edu.hbpu.bookstore.pojo.Categorytwo;
import cn.edu.hbpu.bookstore.pojo.CategorytwoExample;
import cn.edu.hbpu.bookstore.pojo.CategorytwoPojo;
import cn.edu.hbpu.bookstore.service.CategoryoneService;
@Service
public class CategoryoneServiceImpl implements CategoryoneService {
@Autowired
private CategoryoneMapper categoryoneMapper;
@Autowired 
private CategorytwoMapper categorytwoMapper;

	public List<Categoryone> getCategoryoneList() {
		// TODO Auto-generated method stub
		CategoryoneExample example=new CategoryoneExample();
         example.createCriteria().andStateEqualTo(1);
		return categoryoneMapper.selectByExample(example);
	}
	
	public void delCategoryone(Integer cid) {
		// TODO Auto-generated method stub
		Categoryone categoryone=categoryoneMapper.selectByPrimaryKey(cid);
		categoryone.setState(0);
		categoryoneMapper.updateByPrimaryKeySelective(categoryone);
		
	}


	public Categoryone getCategoryoneByCid(Integer cid) {
		// TODO Auto-generated method stub
		return  categoryoneMapper.selectByPrimaryKey(cid);
	}


	public void insertCategoryone(Categoryone categoryone) {
		// TODO Auto-generated method stub
		categoryone.setCname(categoryone.getCname());
		categoryone.setState(1);
		categoryoneMapper.insertSelective(categoryone);
		
	}


	public void modifyCategoryone(Categoryone categoryone) {
		// TODO Auto-generated method stub
		categoryoneMapper.updateByPrimaryKeySelective(categoryone);
		
	}
	
	
	
//---------------------------------------------------------------------------------	
	
	
	public List<Categorytwo> getCategorytwoList(Integer  cid) {
		// TODO Auto-generated method stub
		CategorytwoExample example=new CategorytwoExample();
		example.createCriteria().andCidEqualTo(cid);
		return categorytwoMapper.selectByExample(example);
		
		
	}
	public CategorytwoPojo getCategortwoByCCid(Integer ccid) {
		// TODO Auto-generated method stub
		
		return categorytwoMapper.selectCategorytwoPojoByCCid(ccid);
	}
	public PageInfo<CategorytwoPojo> getCategorytwo(int page, int row) {
		// TODO Auto-generated method stub
		PageHelper.startPage(page, row);
		List<CategorytwoPojo> list=categorytwoMapper.selectCategoryPojoList();
		PageInfo<CategorytwoPojo> pageInfo=new PageInfo<CategorytwoPojo>(list);
		return pageInfo;
	}





	public void delCategorytwo(Integer ccid) {
		// TODO Auto-generated method stub
	Categorytwo categorytwo=categorytwoMapper.selectByPrimaryKey(ccid);
	categorytwo.setState(0);
	categorytwoMapper.updateByPrimaryKeySelective(categorytwo);
		
	}





	public void insertCategorytwo(Categorytwo categorytwo) {
		// TODO Auto-generated method stub
		categorytwoMapper.insertSelective(categorytwo);
	}





	public void modifyCategorytwo(Categorytwo categorytwo) {
		// TODO Auto-generated method stub
		categorytwoMapper.updateByPrimaryKeySelective(categorytwo);
	}



	
	

}
