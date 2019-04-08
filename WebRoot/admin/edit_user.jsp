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
  <div   id="etContainer" >
  <jsp:include page="header.jsp"></jsp:include>
				<jsp:include page="left.jsp"></jsp:include>
  <section class="rt_wrap content mCustomScrollbar">
 <div class="rt_content" >
 <form id="form" >
      <div class="page_title">
       <h2 class="fl">会员详情</h2>
       <a href="user_list.jsp" class="fr top_rt_btn money_icon">会员列表</a>
      </div>
      <ul class="ulColumn2"   >
       <li>
        <span class="item_name" style="width:120px;">会员名称：</span>
        <input  type="text" class="textbox textbox_225" id="username" name="username" v-model="username" />
       </li>
         <li>
        <span class="item_name" style="width:120px;">会员密码：</span>
        <input  type="text" class="textbox textbox_225"  id="password" name="password" v-model="password" />
       </li>
       <li>
        <span class="item_name" style="width:120px;">会员性别：</span>
        <select  id="sex" name="sex" v-model="sex"> 
				<option>-- 选择会员性别 --</option> 
				<option value="女" >女</option> 
				<option value="男" >男</option> 
				</select>
       </li>
       
       <li>
        <span class="item_name" style="width:120px;">电子邮箱：</span>
        <input type="text" class="textbox textbox_225" id="email" name="email" v-model="email" />
        
       </li>
       <li>
        <span class="item_name" style="width:120px;">手机号码：</span>
        <input type="text" class="textbox textbox_225" id="phone" name="phone" v-model="phone"/>
        
       </li>
       <li>
        <span class="item_name" style="width:120px;"></span>
       <input class="link_btn" value="修改/保存" @click="modify()">
       </li>
       
      </ul>
      </form>
 </div>
</section>
  </div>
   
  </body>
  
 <script src="../js/vue.min.js"></script>
<script src="../js/vue-resource.js"></script>
  <script>
    var tvue = new Vue({
		el:"#etContainer",
		data:{
			username:"",
			userid:"",
			password:"",
			phone:"",
			email:"",
			sex:"",
			birthday:"",
			userList:[]
			
		
		},
		methods:{
			modify:function(userid){
				var params = {"userid":getQueryString("userid"),
				"username":this.username,"password":this.password,"email":this.email,"phone":this.phone,"sex":this.sex};
				this.$http.post("modifyUsers",params,
				{emulateJSON:true}).then(
				function(res){
					
				   
					alert("修改成功！");
					location.href="user_list.jsp";
				},
				function(res){
					console.log(res);
				});
			}
		},

		
		created:function(){
			var params={"userid":getQueryString("userid")};

			
			this.$http.post("getUserByUserid",
			params,{emulateJSON:true}).then(
	        function(res){
	        	this.userid=res.data.userid;
	            this.password=res.data.password;
	            this.username=res.data.username;
	            this.sex=res.data.sex;
	            this.email=res.data.email;
	            this.phone=res.data.phone;
	        	
	        	
	          },
	          function(res){
	          	console.log(res);
	          }
	       );
		}
	
	});
        
  
  </script> 
  
</html>