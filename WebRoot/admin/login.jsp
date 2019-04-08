<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta charset="utf-8"/>
<title>后台登录</title>
<meta name="author" content="DeathGhost" />
<link rel="stylesheet" type="text/css" href="css/style.css" />
<style>
body{height:100%;background:#16a085;overflow:hidden;}
canvas{z-index:-1;position:absolute;}
</style>

</head>
<body>
<dl class="admin_login" >
 <dt>
  <strong>站点后台管理系统</strong>
  <em>Management System</em>
 </dt>
 <form method="post" class="well" action="adminLogin.htm">
 <dd class="user_icon">
  <input type="text" placeholder="用户id" class="login_txtbx" name="uid"/>
 </dd>
 <br>
 <br>
 <dd class="pwd_icon">
  <input type="password" placeholder="密码" class="login_txtbx" name="password"/>
 </dd>
 
 <br>
 <br>
 <br>

 <dd class="val_icon">
  
 <dd>
  <input type="submit" value="立即登录" class="submit_btn"/>
 </dd>
 <dd>
  </form>
  <p>© 2018-2018 DeathGhost 版权所有</p>
  <p>湖北理工B2-20080224-1</p>
 </dd>
</dl>
</body>
<script src="../js/jquery.js"></script>
<script src="../js/verificationNumbers.js"></script>
<script src="../js/Particleground.js"></script>
<script>
$(document).ready(function() {
  //粒子背景特效
  $('body').particleground({
    dotColor: '#5cbdaa',
    lineColor: '#5cbdaa'
  });
  //验证码
  createCode();
  //测试提交，对接程序删除即可
  $(".submit_btn").click(function(){
	  location.href="index.jsp";
	  });
});
</script>
</html>
