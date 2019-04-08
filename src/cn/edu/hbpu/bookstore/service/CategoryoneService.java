package cn.edu.hbpu.bookstore.service;

import java.util.List;

import com.github.pagehelper.PageInfo;

import cn.edu.hbpu.bookstore.pojo.Categoryone;
import cn.edu.hbpu.bookstore.pojo.Categorytwo;
import cn.edu.hbpu.bookstore.pojo.CategorytwoPojo;

public interface CategoryoneService {
	List<Categoryone> getCategoryoneList();
	Categoryone getCategoryoneByCid(Integer cid);
	void delCategoryone(Integer cid);
	void insertCategoryone(Categoryone categoryone);
	void modifyCategoryone(Categoryone categoryone);
	
	
	
	
	List<Categorytwo> getCategorytwoList(Integer cid);
	PageInfo<CategorytwoPojo> getCategorytwo(int page,int row);
	CategorytwoPojo getCategortwoByCCid(Integer ccid);
    void delCategorytwo(Integer ccid);
    void insertCategorytwo(Categorytwo categorytwo);
    void modifyCategorytwo(Categorytwo categorytwo);

	

}
