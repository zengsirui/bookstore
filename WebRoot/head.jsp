<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<!-- 用户的登录、注册、个人中心 -->

<div id="headContainer">
<div class="top">
   <span>您好<a class="red">${sessionScope.userid} </a>
   ！欢迎来到破万卷书店 请&nbsp;<a href="login.jsp">[登录]</a>&nbsp;<a href="reg.jsp">[注册]</a></span>
   <span class="topRight">
    <a href="vip.jsp">我的书店</a>&nbsp;| 
    <a href="shopcart.jsp">我的购物车</a>&nbsp;| 
    <a href="vip.jsp">会员中心</a>&nbsp;|
    <a href="contact.jsp">联系我们</a>
   </span>
   </div>
    <!--top/-->
    <div class="lsg">
   <h1 class="logo"><a href="index.jsp"><img src="img/logo.jpg" width="217" height="90" /></a></h1>
   <form action="#" method="get" class="subBox">
    <div class="subBoxDiv" role="search">
     <input type="text" class="subLeft"  v-model="searchContent"/>
     <input type="button" value="搜索" width="63" height="34" class="sub"  @click="searchProduct()"/>
     
    </div><!--subBoxDiv/-->
   </form><!--subBox/-->
   <div class="gouwuche">
    <div class="gouCar">
     <img src="img/gouimg.png" width="19" height="20" style="position:relative;top:6px;" />&nbsp;|&nbsp;
     <strong class="red">0</strong>&nbsp;件&nbsp;|
     <strong class="red">￥ 0.00</strong> 
     <a href="shopcart.jsp">去结算</a> <img src="img/youjian.jpg" width="5" height="8" />    
    </div><!--gouCar/-->
    <div class="myChunlv">
     <a href="vip.jsp"><img src="img/mychunlv.jpg" width="112" height="34" /></a>
    </div><!--myChunlv/-->
   </div><!--gouwuche/-->
  </div><!--lsg/-->
  <div class="pnt"  id="headContainer">
   <div class="pntLeft">
    <h2 class="Title">所有商品分类
     <ul class="InPorNav">
     <li :class="{'active':index==0}"
      v-for="(item,index) in categoryList"  @click="getCatBooks(item.cid)">
      <a href="#">{{item.cname}}</a>
      <div class="chilInPorNav"  >
      </div><!--chilLeftNav/-->
     </li>
    </ul><!--InPorNav/-->
    </h2>
   </div><!--pntLeft/-->
   <div class="pntRight">
    <ul class="nav">
     <li><a href="index.jsp">商城首页</a></li>
     <li><a href="http://localhost:8090/bookstore/product_list.jsp?cid=1">促销中心</a></li>
     <li><a href="vip.jsp">会员中心</a></li>
     <li><a href="vipTuihuo.jsp">帮助中心</a></li>
     <div class="clears"></div>
     <div class="phone">TEL：13995973993</div>
    </ul><!--nav/-->
   </div><!--pntRight/-->
   <div class="clears"></div>
  </div><!--pnt/-->
  </div>
  <script src="js/vue.min.js"></script>
<script src="js/vue-resource.js"></script>
<script type="text/javascript">
	var headvue = new Vue({
		el :'#headContainer',
		data : {
		categoryList : [],
	searchContent:[]
				
	
		},
		methods : {
         getCatBooks:function(cid){
				
			    location.href="product_list.jsp?cid="+cid;
			
			},
			searchProduct:function(){
				 var content=encodeURI(encodeURI(this.searchContent));
			      location.href="search_list.jsp?searchContent="+content;  
			
			}
			
			
		},
		created : function() {
			//created代表当页面加载完成
			//发送Ajax请求
			this.$http.get("getHCategories").then(function(res) {
				this.categoryList = res.data;
				console.log(this.categoryList);

			}, function(res) {
				console.log(res);
			});
		}	
	});
</script>



