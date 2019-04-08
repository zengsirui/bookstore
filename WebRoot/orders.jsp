<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
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
	<div id="orderContainer">
  <div class="positions">
   当前位置：<a href="index.jsp">首页</a> &gt; <a href="#" class="posCur">填写核对订单 {{orderid}}</a>
  </div><!--positions/-->
  <div class="cont">
   <div class="carImg"><img src="img/car2.jpg" width="961" height="27" /></div>
   <h4 class="orderTitle">收货地址</h4>
   <table class="ord" v-for="item in deliveryList">
    <tr>
     <td width="30%">
      <input type="radio" /> {{item.username}}
     </td>
     <td width="50%">
      {{item.address}}	,{{item.postc}},{{item.phone}}
     </td>
     <td>
      <span class="green upd">[修改]</span> | <span class="green add">[添加]</span> 
     </td>
    </tr>
   </table><!--ord/-->
   <div class="address">
    <div class="addList">
     <label><span class="red">* </span>选择地区:</label>
     <select>
      <option>请选择省</option>
     </select>
     <select>
      <option>请选择市</option>
     </select>
     <select>
      <option>请选择地区</option>
     </select>
    </div><!--addList-->
    <div class="addList">
     <label><span class="red">* </span>详细地址:</label>
     <input type="text" />
    </div><!--addList-->
    <div class="addList">
     <label><span class="red">* </span>邮政编码:</label>
     <input type="text" />
    </div><!--addList-->
    <div class="addList">
     <label><span class="red">* </span>收件人:</label>
     <input type="text" />
    </div><!--addList-->
    <div class="addList">
     <label><span class="red">* </span>手机号码:</label>
     <input type="text" /> 或者固定电话 <input type="text" />
    </div><!--addList--> 
    <div class="addList2">
     <input type="image" src="img/queren.jpg" width="100" height="32" />
    </div><!--addList2/-->
   </div><!--address/-->
   <h4 class="orderTitle">支付方式</h4>
   <ul class="zhiList">
   <li>网银支付-借记卡</li>
   <li>网银支付-信用卡</li>
   <li>财付通-余额支付</li>
   <li>支付宝-余额支付</li>
   <div class="clears"></div>
  </ul><!--zhiList/-->
  <div class="zhifufangshi">
   <ul class="yinhang">
    <li><input type="radio" /><img src="img/yin1.gif" /></li>
    <li><input type="radio" /><img src="img/yin2.gif" /></li>
    <li><input type="radio" /><img src="img/yin3.gif" /></li>
    <li><input type="radio" /><img src="img/yin4.gif" /></li>
    <li><input type="radio" /><img src="img/yin5.gif" /></li>
    <li><input type="radio" /><img src="img/yin6.gif" /></li>
    <li><input type="radio" /><img src="img/yin7.gif" /></li>
    <li><input type="radio" /><img src="img/yin8.gif" /></li>
    <li><input type="radio" /><img src="img/yin9.gif" /></li>
    <li><input type="radio" /><img src="img/yin1.gif" /></li>
    <li><input type="radio" /><img src="img/yin2.gif" /></li>
    <li><input type="radio" /><img src="img/yin3.gif" /></li>
    <li><input type="radio" /><img src="img/yin4.gif" /></li>
    <li><input type="radio" /><img src="img/yin5.gif" /></li>
    <li><input type="radio" /><img src="img/yin6.gif" /></li>
    <li><input type="radio" /><img src="img/yin7.gif" /></li>
    <li><input type="radio" /><img src="img/yin8.gif" /></li>
    <div class="clears"></div>
   </ul>
  </div><!--zhzhifufangshii/-->
  <div class="zhifufangshi">
   <ul class="yinhang">
    <li><input type="radio" /><img src="img/yin7.gif" /></li>
    <li><input type="radio" /><img src="img/yin8.gif" /></li>
    <li><input type="radio" /><img src="img/yin9.gif" /></li>
    <li><input type="radio" /><img src="img/yin1.gif" /></li>
    <li><input type="radio" /><img src="img/yin2.gif" /></li>
    <li><input type="radio" /><img src="img/yin3.gif" /></li>
    <li><input type="radio" /><img src="img/yin4.gif" /></li>
    <li><input type="radio" /><img src="img/yin5.gif" /></li>
    <li><input type="radio" /><img src="img/yin6.gif" /></li>
    <li><input type="radio" /><img src="img/yin7.gif" /></li>
    <li><input type="radio" /><img src="img/yin8.gif" /></li>
    <div class="clears"></div>
   </ul>
  </div><!--zhzhifufangshii/-->
  <div class="zhifufangshi">
   <ul class="yinhang">
    <li><input type="radio" /><img src="img/caifutong.jpg" /></li>
    <div class="clear"></div>
   </ul>
  </div><!--zhzhifufangshii/-->
  <div class="zhifufangshi">
   <ul class="yinhang">
    <li><input type="radio" /><img src="img/zhifubao.jpg" /></li>
    <div class="clear"></div>
   </ul>
  </div><!--zhzhifufangshii/-->
  <h4 class="orderTitle">订单号{{orderid}}</h4>
  <table class="orderList">
    <tr>
   
     <th width="430">商品</th>
     <th width="135">单价</th>
     <th width="135">数量</th>
     <th width="135">总金额</th>
     <th>操作</th>
    </tr>
    <tr v-for="item in oitemList">
      
     <td>
      <dl>
       <dt><a href="proinfo.html"><img :src="item.image" width="85" height="85" /></a></dt>
       <dd>{{item.pname}}<br /><span class="red">有货</span></dd>
       <div class="clears"></div>
      </dl>
     </td>
     <td><strong class="red">￥{{item.newPrice}}</strong></td>
     <td>
    
     <strong class="red">{{item.count}}/本</strong>
 
     </td>
     <td><strong class="red">￥{{item.subtotal}}</strong></td>
     <td><a href="#" class="green">删除</a></td>
    </tr>
   </table><!--orderList/-->
   <table class="zongjia" align="right">
    <tr>
     <td width="120" align="left">商品总价：</td>
     <td width="60" ><strong class="red">{{total}}元</strong></td>
    </tr>
   
    <tr>
     <td colspan="2" style="height:50px;">
    <img src="img/tijao.png" width="142" height="32" @click="payOrder()" /></a>
     </td>
    </tr>
   </table><!--zongjia/-->
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
	var orderinfo = new Vue({
		el :'#orderContainer',
		data : {
			orderid:"",
			total:0,
			oitemList:[],
			deliveryList:[]
			
		},
		methods : {
		 payOrder(){
		    this.$http.post("payOrder",{"oid":this.orderid,"total":this.total},{emulateJSON:true}).then(
		    function(res){
		     location.href="success.jsp";
		    },
		    function(res){
		    console.log(res);
		    });
		 }
		},	  
		created : function() {
			//created代表当页面加载完成
			//发送Ajax请求
			this.orderid=getQueryString("oid");
			this.total=getQueryString("total");
			this.$http.post("getOrderitemList",{"oid":this.orderid},{emulateJSON:true}).then(
		    function(res){
		     this.oitemList=res.data;
		    },
		    function(res){
		    console.log(res);
		    });
		    this.$http.get("getDelivery").then(function(res) {
				this.deliveryList = res.data;

			}, function(res) {
				console.log(res);
			});
		}
		
	});
</script>
</html>
