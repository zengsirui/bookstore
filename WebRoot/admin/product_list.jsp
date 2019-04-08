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
 <div class="rt_content" id="aproductContainer">
      <div class="page_title">
       <h2 class="fl">商品列表示例</h2>
       <a href="add_product.jsp" class="fr top_rt_btn add_icon">添加商品</a>
      </div>
      <section class="mtb">
       
       <input type="text" class="textbox textbox_225" v-model="searchContent" placeholder="输入产品关键词或产品货号..."/>
       <input type="button" value="查询" class="group_btn"  @click="searchProduct()"/>
      </section>
      <table class="table">
      <thead>
       <tr>
       <th>序号</th>
        <th>产品图片</th>
        <th>产品名称</th>
        <th>货号</th>
        <th>单价</th>
        <th>上架时间</th>
        <th>出版社</th>
        <th>作者</th>
        <th>销量</th>
        <th>库存</th>
        <th>操作</th>
       </tr>
       </thead>
      <tbody  v-for="(item,index) in productList">
       <tr  >
       <td>{{index+1}}</td>
        <td class="center"><img :src="item.image" width="50" height="50"></td>
        <td>{{item.pname}}</td>
        <td >{{item.pid}}</td>
        <td >{{item.newPrice}}</td>
        <td>{{item.pdate}}</td>
         <td class="center">{{item.press}}</td>
        <td class="center">{{item.author}}</td>
        <td class="center">{{item.volume}}</td>
        <td class="center">{{item.total}}</td>
        <td class="center">
         <a @click="modify(item.pid)"  href="javascript:;" title="编辑" class="link_icon">&#101;</a>
         <a @click="del(item.pid)" href="javascript:;" title="删除" class="link_icon">&#100;</a>
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
		el:"#aproductContainer",
		data:{
			productList:[],
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
				this.$http.post("getProduct", params,{emulateJSON:true}).then(
					function(res){
						this.productList=res.data.list;
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
				
				modify:function(pid){
					location.href="edit_product.jsp?pid="+pid;
				},
			del:function(pid){
				this.$http.post("deleteProducts",{"pid":pid},{emulateJSON:true}).then(
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
