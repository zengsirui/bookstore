<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
  <head>
  <meta charset="UTF-8">
    <title>欢迎页面-书店后台系统</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="css/font.css">
    <link rel="stylesheet" href="css/xadmin.css">
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript" src="lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="../js/xadmin.js"></script>
    
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
   <body>
    <div class="x-nav">
      <span class="layui-breadcrumb">
        <a href="index.jsp">首页</a>
        <a href="">管理员</a>
        <a>
          <cite>管理员信息</cite></a>
      </span>
      <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新">
        <i class="layui-icon" style="line-height:30px">ဂ</i></a>
    </div>
    <div class="x-body">
      <div class="layui-row" id="headContainer">
        <form class="layui-form layui-col-md12 x-so" method="post" action="getAdminusersByName">
          <input type="text" name="username" id="username" list="searchList"  v placeholder="请输入用户名" autocomplete="off" class="layui-input">
          <button class="layui-btn"  lay-submit="" lay-filter="sreach"  type="sumbit" ><i class="layui-icon">&#xe615;</i></button>
        </form>
      </div>
      <xblock>
       <button type="button" class="layui-btn layui-btn-danger" onclick="javascript:batchDel()"><i class="layui-icon"></i>批量删除</button>
        <button class="layui-btn" onclick="x_admin_show('添加用户','./admin_add.jsp')"><i class="layui-icon"></i>添加</button>
      
      </xblock>
      <table class="layui-table">
        <thead>
          <tr>
            <th>
                                 选择
            </th>
            <th>序号</th>
            <th>ID</th>
            <th>登录名</th>
            <th>密码</th>
            <th>类型</th>
            <th>加入时间</th>
            <th>状态</th>
            <th>操作</th>
        </thead>
        <tbody>
      
     <c:forEach items="${adminlist}" var="admin" varStatus="status">
          <tr>
            <td>
              <input type="checkbox" name="delId" value="${admin.uid }">
         
            </td>
            <td>
                ${status.index+1 }
            </td>
            <td>
                ${admin.uid }
            </td>
            <td>${admin.username }</td>
            <td>${admin.password }</td>
            <td>${admin.type}</td>
            <td><fmt:formatDate value="${admin.logintime}" pattern="yyyy-MM-dd HH:mm:ss" /> </td>
         
          <td class="td-status">
              <button class="layui-btn layui-btn-normal layui-btn-mini" onclick="x_admin_show('修改信息','adminEdit/${admin.uid }.htm')">修改</span></button>
              </td>
            <td class="td-manage">
        
              
              <a title="删除" onclick="member_del(this,'要删除的id')" href="javascript:del(${admin.uid })">
                <i class="layui-icon">&#xe640;</i>
              </a>
            </td>
          </tr>
       </c:forEach>
        </tbody>
      </table>
      

    </div>
    <script type="text/javascript" src="../js/jquery-1.11.3.min.js"></script>
    <script>
      layui.use('laydate', function(){
        var laydate = layui.laydate;
        
        //执行一个laydate实例
        laydate.render({
          elem: '#start' //指定元素
        });

        //执行一个laydate实例
        laydate.render({
          elem: '#end' //指定元素
        });
      });

     


         function del(uid){
	      $.post(
	         "adminDel.htm",/*url*/
	         {uid:uid},
	         function(data){
	          alert("操作成功！");
	           window.location.reload(true);
	         }
	         	      );
	     }
	   
	 function batchDel(){
	       //定义一个数组
	       var delIds=new Array();
	       $("input:checked").each(function(){
	           delIds.push($(this).val());
	       
	       });
	       $.post(
	          "batchDelAdmin.htm",
	          {uIds:delIds},
	          function(data){
	             alert("操作成功！");
	             window.location.reload(true);
	          
	          }
   
	       );

	   }
  </script>
 

  </body>

</html>
