<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
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
	<div id="cartContainer">
   <div class="positions">
   当前位置：<a href="index.jsp">首页</a> &gt; <a href="#" class="posCur">购物车 </a>
  </div><!--positions/-->
  <div class="cont" >
   <div class="carImg"><img src="img/car1.jpg" width="951" height="27" /></div>
   <table class="orderList">
    <tr>
     <th width="20"></th>
     <th width="430">商品</th>
     <th width="135">单价</th>
     <th width="135">数量</th>
     <th width="135">总金额</th>
     <th>操作</th>
    </tr>
    <tr v-for="(item,index) in cartList">
     <td><input type="checkbox" name="selectList" :id="item.sid"
		:value="index" v-model="selectList" /></td>
     <td>
      <dl>
       <dt><a href="proinfo.html"><img :src="item.image" width="85" height="85" /></a></dt>
       <dd>{{item.pname}}<br /></dd>
       <div class="clears"></div>
      </dl>
     </td>
     <td><strong class="red">￥{{item.newPrice}}</strong></td>
     <td>
     <div class="jia_jian">
      
      <input type="number" name="quantity" :value="item.count"maxlength="4" size="10" min="1"
   			@change="changeNumber(item,$event)" class="shuliang"  />
     
     </div>
     </td>
     <td><strong class="red">￥{{item.newPrice*item.count}}</strong></td>
     <td><a href="#" class="green" @click="deleteItem(item,index)">删除</a></td>
    </tr>
    
    <tr>
     <td colspan="6"><div class="shanchu"><img src="img/lajio.jpg" /> 全部删除</div></td>
    </tr>
   </table><!--orderList/-->
   <div class="zongji">
    总计(不含运费)：<strong class="red">￥{{total}}</strong>
   </div><!--zongji/-->
   <div class="jiesuan">
    <a href="product_list.jsp" class="jie_1">继续购物&gt;&gt;</a>
    <a  class="jie_2" @click="submitOrder()">立即结算&gt;&gt;</a>
    <div class="clears"></div>
   </div><!--jiesuan/-->
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
	var cartvue = new Vue({
		el :'#cartContainer',
		data : {
			cartList : [],
			selectList:[]
		},
		computed:{
		total:function(){
		  var sum=0;
		  var len=this.selectList.length;
		  for(var i=0;i<len;i++){
		  var index=this.selectList[i];
		  var item=this.cartList[index];
		  if(item){
		    sum+=item.newPrice*item.count;
		   }else{
		      continue;
		      }
		  }
		  return sum;
		}
	   },
		methods : {
		 changeNumber:function(item,event){
		   var obj=$(event.target);
		   item.count=obj.val();
		   item.subtotal=item.newPrice*item.count;
		   this.$http.post("modifyShopcart",item,{emulatJSON:true}).then
		   (function(res) {
		   	
			}, 
			function(res) {
				console.log(res);
			});
		  },
		  deleteItem(item,index){
		   if(confirm("您确定要删除该商品吗？")){
		     this.cartList.splice(index,1);
		     this.$http.post("delShopcart",{"sid":item.sid},{emulateJSON:true}).then(
		     function(res){
		       alert("删除成功！");
		     },
		     function(res){
		       console.log(res);
		     }
		     );
		   }
		  },
		  submitOrder:function(){
		    if(confirm("您确定要提交订单吗？")){
		      var cartIds=new Array();
		      var len=this.selectList.length;
		      for(var i=0;i<len;i++){
		        var index=this.selectList[i];
		        var item=this.cartList[index];
		        if(item){
		           cartIds.push(item.sid);
		         }else{
		           continue;
		         }
		      }
		      var params={"total":this.total,"cartIds":cartIds};
		      this.$http.post("submitOrder",params,{emulateJSON:true}).then(
		      function(res) {
				location.href="orders.jsp?oid="+res.data.result+"&total="+this.total;
				}, 
			  function(res) {
				 console.log(res);
			});
		    }
		  }	
		},
		created:function() {
			//created代表当页面加载完成
			//发送Ajax请求
			
			this.$http.get("getShopcart").then(function(res) {
				this.cartList = res.data;

			}, function(res) {
				console.log(res);
			});
		}
	});
</script>
</html>
