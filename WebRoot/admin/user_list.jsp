<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
     <jsp:include page="top.jsp"></jsp:include>
	<link href="css/zpageNav.css" rel="stylesheet"/>
	

  </head>
  
  
  <body>
          	<jsp:include page="header.jsp"></jsp:include>
				<jsp:include page="left.jsp"></jsp:include>
  <section class="rt_wrap content mCustomScrollbar">
 <div class="rt_content" id="tContainer">
      <div class="page_title">
       <h2 class="fl">会员列表</h2>
       <a href="user_add.jsp" class="fr top_rt_btn add_icon">添加新会员</a>
      </div>
      <section class="mtb">
       <select class="select">
        <option>会员等级</option>
        <option>普通会员</option>
        <option>高级会员</option>
       </select>
       <input type="text" class="textbox textbox_225"  v-model="searchContent" placeholder="输入会员名"/>
       <input type="button" value="查询" class="group_btn"  @click="searchUser()"/>
      </section>
      <table class="table">
       <tr>
        <th>选择</th>
        <th>Id</th>
        <th>用户名</th>
        <th>手机号码</th>
        <th>电子邮件</th>
        <th>性别</th>
        <th>用户生日</th>
        <th>注册时间</th>
        <th>操作</th>
       </tr>
       <tbody  v-for="(item,index) in userList">
       <tr  >
       <td>{{index+1}}</td>
        <td class="center">{{item.userid}}</td>
        <td>{{item.username}}</td>
        <td >{{item.phone}}</td>
        <td style="font-size:x-small" >{{item.email}}</td>
         <td class="center">{{item.sex}}</td>
        <td class="center">{{item.birthday}}</td>
        <td class="center">{{item.creattime}}</td>
        <td class="center">
         <a @click="modify(item.userid)"  href="javascript:;" title="编辑" class="link_icon">&#101;</a>
         <a @click="del(item.userid)" href="javascript:;" title="删除" class="link_icon">&#100;</a>
        </td>
       </tr>
       </tbody>

      </table>
      <div style="width: 380px; margin: 0 auto; margin-top: 50px; " >
						<zpagenav v-bind:page="page" v-bind:page-size="pageSize"  v-bind:max-page="maxPage"
						v-on:pagehandler="pageHandler"
						v-bind:total="total">
						</zpagenav>
				</div>
     
 </div>
 
</section>

  </body>
  
	<script src="../js/vue.min.js"></script>
	<script src="../js/vue-resource.js"></script>
	<script src="../js/zpageNav.js"></script>
	<script type="text/javascript">
		var tvue = new Vue({
		el:"#tContainer",
		data:{
			userList:[],
			page:1,
			pageSize:7,
			total:100,
			maxPage:9,
			username:"",
			searchContent:[],
				user:[]
			
			
		
		},
		
		methods:{
			pageHandler:function(page){
				this.page=page;
				var params = {"page":page, "row":this.pageSize};
				this.$http.post("getUsers", params,{emulateJSON:true}).then(
					function(res){
						this.userList=res.data.list;
						this.maxPage=res.data.pages;
						this.total=res.data.total;
					
					},
					function(res){
						console.log(res);
					}
				);
			},

				searchUser:function(){
					var content=encodeURI(encodeURI(this.searchContent));
					location.href="search_list.jsp?searchContent="+content;
		},
		
			del:function(userid){
				this.$http.post("deleteUsers",{"userid":userid},{emulateJSON:true}).then(
				function(res){
					alert("删除成功！");
					window.location.reload(true);
				},
				function(res){
					console.log(res);
				});
			},
			
			
			
			modify:function(userid){
				location.href="edit_user.jsp?userid="+userid;
			}
			
			
		},
		created : function() {
				this.pageHandler(1);
				
						
			}
	});
		
</script>	




</html>
