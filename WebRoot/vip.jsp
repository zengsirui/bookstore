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
	<div id="deliveryContainer">
   <div class="positions">
   当前位置：<a href="index.html">首页</a> &gt; <a href="vip.html">会员中心</a>
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
   <div class="contRight">
    <h1 class="vipName"><span>用户名：</span> <strong class="vipUp">[点击修改/补充个人信息]</strong></h1>
    <table class="vipMy">
     <tr>
      <th>用户名</th>
      <th>邮编</th>
      <th>真实姓名</th>
      <th>联系方式</th>
       <th>地址</th>
      <th>操作</th>
     
     </tr>
     <tr  v-for="(item,index) in deliveryList">
      <td>{{item.username}}</td>
      <td>{{item.postc}}</td>
      <td>{{item.recname}}</td>
      <td>{{item.phone}}</td> 
      <td>{{item.address}}</td>
    <td><a href="#" class="green" @click="deleteItem(item,index)">删除</a></td>
     </tr>
    </table><!--vipMy/-->
    <div class="address">
    <div class="addList">
     <label><span class="red">* </span>用户名:</label>
     <input type="text" id="recname" name="recname" v-model="recname"  />
    </div><!--addList-->
    <div class="addList">
     <label><span class="red">* </span>详细地址:</label>
     <input type="text" id="address" name="address" v-model="address"  />
    </div><!--addList-->
    <div class="addList">
     <label><span class="red">* </span>邮政编码:</label>
     <input type="text" id="postc" name="postc" v-model="postc"  />
    </div><!--addList-->
    <div class="addList">
     <label><span class="red">* </span>手机号码:</label>
     <input type="text" id="phone" name="phone" v-model="phone"  /> 
    </div><!--addList--> 
    <div class="addList2">
     <input type="image" src="img/baocun.png" width="79" height="30"  @click="addDelivery()" />
    </div><!--addList2/-->
   </div><!--address/-->
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
	var deliveryvue = new Vue({
		el :'#deliveryContainer',
		data : {
			deliveryList : [],
			postc:[],
			address:[],
			phone:[],
			recname:[],
			selectList:[]
		},
		methods:{
			deleteItem(item,index){
			
				this.$http.post("deleteDelivery",{"asid":item.asid},{emulateJSON:true}).then(
				function(res){
					alert("删除成功！");
					window.location.reload(true);
				},
				function(res){
					console.log(res);
				}
				);
			},
			
			addDelivery:function(){
				var params=
				 {
				  
				   "postc":this.postc,
				   "phone":this.phone,
				   "address":this.address,
				   "recname":this.recname
				 };
				this.$http.post("addDelivery",params,{emulateJSON:true}).then(
						function(res){
							
							alert("添加成功！");
							location.href="vip.jsp";
						},
						function(res){
							console.log(res);
						});
				
				
			}
			
		},
		created:function() {
			//created代表当页面加载完成
			//发送Ajax请求
			this.$http.get("getDelivery").then(function(res) {
				this.deliveryList = res.data;

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
