package cn.edu.hbpu.bookstore.service;

import java.util.List;

import cn.edu.hbpu.bookstore.pojo.CommentPojo;

public interface CommentService {
   List<CommentPojo> getCommentPojoByPid(Integer pid);
   boolean saveCommentByOid(int oid,int pid,int userid,String comments );
   
   
}
