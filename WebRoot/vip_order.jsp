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
<link href="css/zpageNav.css" rel="stylesheet"/>
  </head>
  
  <body>
  <div class="mianCont">
   <jsp:include page="head.jsp"></jsp:include>
	<div id="olistContainer">
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
   <div class="contRight"  >
    <h1 class="vipName"><span></span></h1>
    <h2 class="oredrName">
    我的订单 <span style="margin-left:40px;">订单总数 <span class="red">{{total}}</span> </span>
   
    </h2>
    <table class="vipMy">
    <tbody v-for="(item,index) in orderList">
    	
						<tr >
							<th colspan="5">订单编号:{{item[0].oid}}
							&nbsp;订单时间:{{item[0].ordertime}}
							&nbsp;订单状态:{{item[0].state}}
							&nbsp;物流编号：{{item[0].status}}
							
							</th>
						</tr>
						<tr >
							<th width="10%">图片</th>
							<th width="10%">商品</th>
							<th width="10%">价格</th>
							<th width="10%">数量</th>
							<th width="15%">小计</th>
						</tr>
					
						<tr  v-for="o in item">
							<td><img :src="o.image" width="70"
								height="60"></td>
							<td><a target="_blank">{{o.pname}}</a></td>
							<td>￥{{o.newPrice}}</td>
							<td>{{o.count}}</td>
							<td><span class="subtotal">￥{{o.subtotal}}</span></td>
						</tr>
						<tr >
						 <th colspan="5">
						   <button @click="deleteOrders(item[0].oid)"><strong class="red">删除订单</strong></button>
						   &nbsp;<button v-if="item[0].state=='已发货'" @click="confirmOrder(item[0].oid)"><strong class="red">确认收货</strong></button>
						   &nbsp;<button v-if="item[0].state=='已收货'" @click="evaluateOrder(item[0].oid)"><strong class="red">评价订单</strong></button>
						   &nbsp;<button v-if="item[0].state=='未付款'" @click="payOrder(item[0].oid,item[0].total)"><strong class="red">付款</strong></button>
						  
						 </th>
						
						</tr>
						
     </tbody>
    
    </table><!--vipOrder/-->
    <br />
   <div style="width: 380px; margin: 0 auto; margin-top: 50px;">
			<zpagenav v-bind:page="page" v-bind:page-size="pageSize"
				v-bind:total="total" v-bind:max-page="maxPage"
				v-on:pagehandler="pageHandler">
			<zpagenav>
		</div>
    <br />
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
<script src="js/zpageNav.js"></script>
<script type="text/javascript">
	var ordersvue = new Vue({
		el:'#olistContainer',
		data : {
			orderList : [],
			page : 1,
			pageSize : 5,
			total : 100,
			maxPage : 9
		},
		methods : {
			pageHandler : function(page) {
				this.page = page;
				var params = {
					"page" : page,
					"row" : this.pageSize
				};
				this.$http.post("getOrderlistByUserid", params, 
				{emulateJSON : true}).then(
				function(res) {
					this.orderList = res.data.list;
					
					this.total=res.data.total;
					this.maxPage=res.data.pages;
				}, function(res) {
					console.log(res);
				});
			},
			showDetail:function(pid){
			location.href="product_info.jsp?pid="+pid;
	       },
	       deleteOrders:function(oid){
		   if(confirm("您确定要删除该订单吗？")){
		     this.$http.post("deleteOrders",{"oid":oid},{emulateJSON:true}).then(
		     function(res){
		       alert("删除成功！");
		       history.go();
		     },
		     function(res){
		       console.log(res);
		     }
		     );
		   }
		  },
		  payOrder:function(oid,total){
		     location.href="orders.jsp?oid="+oid+"&total="+total;
		   },
		   
		  evaluateOrder:function(oid){
		  
		    location.href="order_eval.jsp?oid="+oid;
		   
		   }
		   
		  
		 
	       
		},
		created : function() {
			
			this.pageHandler(1);
		}
	});
</script>
  <script type="text/javascript">
 $(function(){
	 $(".vipNav dd:first").show();
	 });
</script>

</html>
