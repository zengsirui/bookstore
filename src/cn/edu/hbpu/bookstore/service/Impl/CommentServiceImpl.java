package cn.edu.hbpu.bookstore.service.Impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.edu.hbpu.bookstore.mapper.CommentMapper;
import cn.edu.hbpu.bookstore.pojo.Comment;
import cn.edu.hbpu.bookstore.pojo.CommentPojo;
import cn.edu.hbpu.bookstore.service.CommentService;
@Service
public class CommentServiceImpl implements CommentService {
@Autowired
private CommentMapper commentMapper;

	public List<CommentPojo> getCommentPojoByPid(Integer pid) {
		// TODO Auto-generated method stub
		return commentMapper.selectCommentPojoByPid(pid);
		
	}
	public boolean saveCommentByOid(int oid, int pid,int userid, String comments) {
		// TODO Auto-generated method stub
		Comment comment=new Comment(); 
		comment.setContent(comments);
		comment.setOid(oid);
		comment.setPid(pid);
		comment.setUserid(userid);
		comment.setCreated(new Date());
		int flag= commentMapper.insertSelective(comment);
		return flag>0? true:false;
	}

}
