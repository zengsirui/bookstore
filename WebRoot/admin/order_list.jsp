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
 <div class="rt_content" id="orderContainer">
      <div class="page_title">
       <h2 class="fl">订单列表示例</h2>
       
      </div>
      <section class="mtb">
       <select class="select">
        <option>订单状态</option>
        <option>待付款0</option>
        <option>待发货1</option>
        <option>已经发货2</option>
        <option>已经收货3</option>
        <option>交易成功4</option>
       </select>
       <input type="text" class="textbox textbox_225" placeholder="输入订单编号或收件人姓名/电话..."/>
       <input type="button" value="查询" class="group_btn"/>
      </section>
      <table class="table">
       <tr>
        <th>订单编号</th>
        <th>收件人</th>
        <th>联系电话</th>
        <th>收件人地址</th>
        <th>订单状态</th>
        <th>订单金额</th>
        <th>操作</th>
       </tr>
       <tr v-for="(item,index) in orderList">
        <td class="center">{{item.oid}}</td>
        <td class="center">{{item.username}}</td>
        <td>{{item.phone}}</td>
        <td>{{item.address}}</td>
        <td>
         <address class="center">{{item.state}}</address>
        </td>
        <td class="center"><strong class="rmb_icon">{{item.total}}</strong></td>
        <td class="center">
         <a href="#" title="查看订单" class="link_icon"  @click="detail(item.userid)" >&#118;</a>
         <a href="#" title="删除" class="link_icon"  @click="del(item.oid)">&#100;</a>
        </td>
       </tr>
       
      </table>
      <aside class="paging">
      <zpagenav v-bind:page="page" v-bind:page-size="pageSize"  v-bind:max-page="maxPage"
						v-on:pagehandler="pageHandler"
						v-bind:total="total">
						</zpagenav>
      </aside>
 </div>
</section>	
   
  </body>
  	<script src="../js/vue.min.js"></script>
	<script src="../js/vue-resource.js"></script>
	<script src="../js/zpageNav.js"></script>
	<script type="text/javascript">
		var tvue = new Vue({
		el:"#orderContainer",
		data:{
			orderList:[],
			page:1,
			pageSize:7,
			total:100,
			maxPage:9,
			pname:"",
			searchContent:[],
				product:[]
			
			
		
		},
		
		methods:{
			pageHandler:function(page){
				this.page=page;
				var params = {"page":page, "row":this.pageSize};
				this.$http.post("getOrder", params,{emulateJSON:true}).then(
					function(res){
						this.orderList=res.data.list;
						this.maxPage=res.data.pages;
						this.total=res.data.total;
					},
					function(res){
						console.log(res);
					}
				);
			},
			searchProduct:function(){
				var content=encodeURI(encodeURI(this.searchContent));
				location.href="search_productlist.jsp?searchContent="+content;
				},
				
				detail:function(userid){
					location.href="order_detail.jsp?userid="+userid;
				},
			del:function(oid){
				this.$http.post("deleteOrder",{"oid":oid},{emulateJSON:true}).then(
				function(res){
					alert("删除成功！");
					window.location.reload(true);
				},
				function(res){
					console.log(res);
				}
				);
			}
			
		},
		created : function() {
				this.pageHandler(1);
				
						
			}
	});
		
</script>	
</html>
