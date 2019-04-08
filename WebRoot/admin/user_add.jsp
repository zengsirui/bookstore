<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
       <jsp:include page="top.jsp"></jsp:include>

  </head>
  
  <body>
  <jsp:include page="header.jsp"></jsp:include>
				<jsp:include page="left.jsp"></jsp:include>
  <section class="rt_wrap content mCustomScrollbar">
 <div class="rt_content" >
 <form>
      <div class="page_title">
       <h2 class="fl">会员详情</h2>
       <a href="user_list.jsp" class="fr top_rt_btn money_icon">会员列表</a>
      </div>
      <ul class="ulColumn2">
      
       <li>
        <span class="item_name" style="width:120px;">会员名称：</span>
        <input id="username" name="username" type="text" class="textbox textbox_225" value="${user.username}" placeholder="会员账号..."/>
  
       </li>
       <li>
        <span class="item_name" style="width:120px;">登陆密码：</span>
        <input id="password" name="password" type="text" class="textbox textbox_225" value="${user.password} " placeholder="会员密码..."/>
       </li>
       <li>
        <span class="item_name" style="width:120px;">会员性别：</span>
        <select id="sex" name="sex"> 
				<option>-- 选择会员性别 --</option> 
				<option value="女" <c:if test="${user.sex==女}">selected="selected"</c:if>>女</option> 
				<option value="男" <c:if test="${user.sex==男}">selected="selected"</c:if>>男</option> 
				</select>
       </li>
       
       <li>
        <span class="item_name" style="width:120px;">电子邮箱：</span>
        <input id="email" name="email" type="text" class="textbox textbox_225" value="${user.email}" placeholder="电子邮件地址..."/>
        
       </li>
       <li>
        <span class="item_name" style="width:120px;">手机号码：</span>
        <input id="phone" name="phone" type="text" class="textbox textbox_225" value="${user.phone}" placeholder="手机号码..."/>
        
       </li>
       <li>
        <span class="item_name" style="width:120px;"></span>
        <input type="submit" class="link_btn" value="更新/保存" onclick="insertUsers()"/>
       </li>
       
      </ul>
      </form>
 </div>
</section>
  
   
  </body>
  <script type="text/javascript" src="../js/jquery-1.11.3.min.js"></script>
  <script>
     function insertUsers(){
	    var params=$("form").serializeArray();
	      $.post(
	         "insertUsers.htm",/*url*/
	         params,/**/
	         function(data){//function的参数就是服务器返回的数据
	          alert("添加成功！");
	           window.location.reload(true);
	           history.go();
	          
	         }
	         	      );
	     }
        
  
  </script>
  
</html>
