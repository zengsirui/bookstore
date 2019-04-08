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
<style>
body {
	margin-top: 20px;
	margin: 0 auto;
}

.carousel-inner .item img {
	width: 100%;
	height: 300px;
}
</style>
</head>

<body>
	<!-- 引入header.jsp -->
	<jsp:include page="head.jsp"></jsp:include>
	
	<div class="container" id="evalContainer" style="width: 100%; background: url('img/regist_bg.jpg');">
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
       <a href="vip.jsp">个人中心</a>
       <a href="vip_order.jsp" class="vipCur">我的订单</a>
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
   
		<div class="row">
			<div style="margin: 0 auto; margin-top: 10px; width: 950px;">
				<h3><strong>评价订单</strong></h3>
				<table class="table table-bordered">
						<thead>
						<tr style="background-color:#EDEDED;">
							<th colspan="5">订单编号:{{orderid}}</th>
						</tr>
						<tr style="background-color:#EDEDED;">
							<th width="30%">图片</th>
							<th width="30%">商品</th>
							<th width="20%">价格</th>
							<th width="10%">数量</th>
							<th width="15%">小计</th>
						</tr>
						</thead>
						<tbody>
						<tr class="active" v-for="item in oitemList">
							<td align="center"><input type="hidden" name="id" 
								value="22"> <img :src="item.image" width="70"
								height="60"></td>
							<td align="center"><a target="_blank" >{{item.pname}}</a></td>
							<td align="center">￥{{item.newPrice}}</td>
							<td align="center">{{item.count}}</td>
							<td align="center"><span class="subtotal">￥{{item.subtotal}}</span></td>
						</tr>
						<tr align="center"><td colspan="5">
							<textarea id="comment" rows="3" cols="145" placeholder="评价内容" v-model="comment"></textarea>
						</td></tr>
					</tbody>
				</table>
			</div>

		</div>

		<div style="text-align: right;margin-top: 10px; width: 950px;">
			<hr />
			<input type="button" width="100" value="提交评价" @click="evalOrder()" name="submit" id="evaluate"
style="background: url('img/btn_cart.png') no-repeat scroll 0 0 rgba(0, 0, 0, 0); height: 35px; width: 100px; color: green;">


			
		</div>

	</div>

	<!-- 引入footer.jsp -->
	<jsp:include page="foot.jsp"></jsp:include>

</body>
<script src="js/vue.min.js"></script>
<script src="js/vue-resource.js"></script>
<script type="text/javascript">
  var evalvue= new Vue({
   el:"#evalContainer",
	data : {
		orderid:"",
		total:0,
		oitemList:[]	,
		comment:""
		},
	methods : {
		evalOrder(){	
			var pararms={"oid":this.orderid,"comments":this.comment}
 		 	this.$http.post("saveComment",pararms,{emulateJSON:true}).then(
		    function(res){
		     alert("ok");
		    },
		    function(res){
		    console.log(res);
		    });
		}
		
			
	},
		created : function() {
		    this.orderid=getQueryString("oid");
			this.total=getQueryString("total");
			this.$http.post("getOrderitemList",{"oid":this.orderid},{emulateJSON:true}).then(
		    function(res){
		     this.oitemList=res.data;
		    },
		    function(res){
		    console.log(res);
		    });	
		}
			
	});	
</script>
