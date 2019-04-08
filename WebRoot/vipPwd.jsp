<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML >
<html>
  <head>
   <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>书店商城</title>
<link type="text/css" href="css/css.css" rel="stylesheet" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/js.js"></script>
<script src="js/wb.js" type="text/javascript" charset="utf-8"></script>
<script src="js/MagicZoom.js" type="text/javascript"></script>
<script src="js/jquery.min.js" type="text/javascript"></script>
<script src="js/bootstrap.min.js" type="text/javascript"></script>
<script src="js/util.js"></script>

  </head>
  
  <body>
  <div class="mianCont">
      <!-- 引入header.jsp -->
	<jsp:include page="head.jsp"></jsp:include>
	<div>
   <div class="positions">
   当前位置：<a href="index.jsp">首页</a> &gt; <a href="vip.jsp">会员中心</a>
    &gt; <a href="#" class="posCur">我的订单</a>
  </div><!--positions/-->
  <div class="cont">
   <div class="contLeft" id="contLeft">
    <h3 class="leftTitle">会员中心</h3>
    <dl class="helpNav vipNav">
     <dt>我的主页</dt>
      <dd>
       <a href="vip.jsp" class="vipCur">个人中心</a>
       <a href="vip_order.jsp">我的订单</a>
      </dd>
     <dt>账户设置</dt>
      <dd>
       <a href="vipMy.jsp">个人信息</a>
       <a href="vipPwd.jsp">密码修改</a>
       <a href="vipAdress.jsp">收货地址</a>
      </dd>
      <dt>客户服务</dt>
       <dd>
        <a href="vipExit.jsp">网站使用条款</a>
        <a href="vipTuihuo.jsp">网站免责声明</a>
        <a href="message.jsp">在线留言</a>
       </dd>
      
      
    </dl><!--helpNav/-->
   </div><!--contLeft/-->
   <div class="contRight" id="userContainer">
    <h2 class="oredrName">
    修改密码
    </h2>
    <div class="address" style="display:block">
    <div class="addList">
     <label>新密码:</label>
     <input type="password" class="vipPwd1" id="password" name="password" v-model="password" />
    </div><!--addList-->
    <div class="addList">
     <label>确认密码:</label>
     <input type="password" class="vipPwd2" />
    </div><!--addList-->
    <div class="addList2">
     <input type="image" src="img/baocun.png" width="79" height="30" class="vipSub"  @click="editItem(item,index)" />
    </div><!--addList2/-->
   </div><!--address/-->
   </div><!--contRight/-->
   </div><!--contRight/-->
   <div class="clears"></div>
  </div><!--cont/-->
  </div>
   <!-- 引入footer.jsp -->
	<jsp:include page="foot.jsp"></jsp:include>
  </div>
  
  </body>
  <script src="js/vue.min.js"></script>
<script src="js/vue-resource.js"></script>
  <script type="text/javascript">
    var tvue = new Vue({
		el:'#userContainer',
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
		methods : {
		modify:function(userid){
			
				this.$http.post("modifyPwd",{"password":this.password},{emulateJSON:true}).then(
				function(res){
					alert("修改成功！");
					window.location.reload(true);
				},
				function(res){
					console.log(res);
				}
				);
				}
			},
	

			created:function() {
			//created代表当页面加载完成
			//发送Ajax请求
			this.$http.get("getUser").then(function(res) {
				this.userList = res.data;

			}, function(res) {
				console.log(res);
			});
		}
		
	});
  
  </script> 
	
  <script type="text/javascript">
 $(function(){
	 $(".vipNav dd:first").show();
	 });
</script>
</html>
   