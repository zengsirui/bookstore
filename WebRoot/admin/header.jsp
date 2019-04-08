<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<header>
<h1>
<img src="${pageContext.request.contextPath }/admin/img/admin_logo.png"/></h1>
 <ul class="rt_nav">
  <li><a href="index.jsp" target="_blank" class="website_icon">站点首页</a></li>
  <li><a href="#" class="admin_icon">${admin.uid} </a></li>
  <li><a href="adminlist" class="set_icon">账号设置</a></li>
  <li><a href="login.jsp" class="quit_icon">安全退出</a></li>
 </ul>
</header>
