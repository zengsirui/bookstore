<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>书店商城</title>
<link type="text/css" href="css/css.css" rel="stylesheet" />
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/js.js"></script>
<script src="js/jquery.min.js" type="text/javascript"></script>
<script src="js/bootstrap.min.js" type="text/javascript"></script>
<!-- 引入自定义css文件 style.css -->
<link rel="stylesheet" href="css/style.css" type="text/css" />
  </head>
  
 <body style=" background:#FFF;">
 <div class="loginLogo">
  <div class="logoMid">
   <h1 class="logo" style="height:71px;padding-top:10px;"><a href="index.jsp"><img src="img/logo.jpg" width="241" height="71" /></a></h1>
   <div class="loginReg">
    还没有会员账号?&nbsp;<a href="login.jsp">登录</a>
   </div><!--loginReg/-->
  </div><!--logoMid/-->
 </div><!--loginLogo/-->
 <div class="loginBox">
  <img src="img/chengnuo.jpg" width="295" height="393" class="chengnuo" />
  <form   method="" class="reg">
   <div class="regList">
    <label><span class="red">*</span> 账户名</label>
    <input  id="username" name="username" type="text" value="${user.username}" /> <span style="color:#999;">用户名</span>
   </div><!--regList/-->
   <div class="regList">
    <label><span class="red">*</span> 请设置密码</label>
    <input id="password" name="password"  type="text"  value="${user.password} " />
   </div><!--regList/-->
   <div class="regList">
    <label><span class="password">*</span> 请确认手机</label>
     <input id="phone" name="phone" type="text"  type="text"  value="${user.phone}" />
   </div><!--regList/-->
   <div class="xieyi">
    <input type="checkbox" /> 我已经阅读并同意<a href="#">《用户注册协议》</a>
   </div><!--xieyi/-->
   
   <div class="reg">
    <input type="button" width="100" value="注册" name="submit" onclick="insertUsers()""
									
									style="background: url('img/sub.jpg') no-repeat scroll 0 0 rgba(0, 0, 0, 0); height: 35px; width: 100px; color: white;">
							</div>
   
   </div><!--reg/-->
  </form><!--reg/-->
  <div class="clears"></div>
 </div><!--loginBox/-->
</body>
<script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
  <script>
     function insertUsers(){
	    var params=$("form").serializeArray();
	      $.post(
	         "insertUsers.htm",/*url*/
	         params,/**/
	         function(data){//function的参数就是服务器返回的数据
	          alert("添加成功！");
	           window.location.reload(true);
	           history.back();
	          
	         }
	         	      );
	     }
        
  
  </script>
</html>
