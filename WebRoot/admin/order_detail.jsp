<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML >
<html>
  <head>
   <jsp:include page="top.jsp"></jsp:include>
   <link href="css/zpageNav.css" rel="stylesheet"/>

  </head>
  
  <body>
  <jsp:include page="header.jsp"></jsp:include>
				<jsp:include page="left.jsp"></jsp:include>


   <section class="rt_wrap content mCustomScrollbar">
 <div class="rt_content" id="olistContainer">
      <div class="page_title">
       <h2 class="fl">订单详情示例</h2>
      </div>
      <table class="table" v-for="(item,index) in orderList">
       <tr>
        <td>订单编号：{{item[0].oid}}</td>
        <td>物流说明：{{item[0].status}}</td>
        <td>订单状态：{{item[0].state}}</td>
        <td>订单时间：{{item[0].ordertime}}</td>
       </tr>
      <tr >
							<th class="center">图片</th>
							<th class="center">商品</th>
							<th class="center">价格</th>
							<th class="center">数量</th>
							<th class="center">小计</th>
						</tr>
     
       <tr  v-for="o in item">
        <td class="center"><img :src="o.image" width="50" height="50"/></td>
        <td class="center">{{o.pname}}</td>
        <td class="center"><strong class="rmb_icon">{{o.newPrice}}</strong></td>
        <td class="center"><strong>{{o.count}}</strong></td>
        <td class="center"><strong class="rmb_icon">{{o.subtotal}}</strong></td>
       </tr>
      
      </table>
      <aside class="mtb" style="text-align:right;">
       <label>管理员操作：</label>
      <input type="button"  @click="editOrders();" name="state" value="改变状态" class="group_btn"/> 

      </aside>
 </div>
</section>
  </body>
 <script src="../js/vue.min.js"></script>
	<script src="../js/vue-resource.js"></script>
	<script src="../js/zpageNav.js"></script>
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
					"row" : this.pageSize,
					"userid":getQueryString("userid")
				};
				this.$http.post("getOrderByUserid", params, 
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
		   editOrders:function(oid){
		    var params={"userid":getQueryString("userid")};
		   
		   if(confirm("您确定要修改该订单状态吗？")){
		     this.$http.post("modifyOrder",params,{emulateJSON:true}).then(
		     function(res){
		       alert("修改成功！");
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
		  
		    location.href="order_eval?oid="+oid;
		   
		   }
		   
		  
		 
	       
		},
		created : function() {
			
			this.pageHandler(1);
		}
	});
	</script>
	
	  <script type="text/javascript" src="../js/jquery.min.js"></script>
 
</html>
