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
<script src="js/jquery.min.js" type="text/javascript"></script>
<script type="text/javascript" src="js/jqPaginator.js" charset="UTF-8"></script>
<script src="js/bootstrap.min.js" type="text/javascript"></script>
<script src="js/util.js"></script>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/js.js"></script>
<script src="js/wb.js" type="text/javascript" charset="utf-8"></script>
<link href="css/zpageNav.css" rel="stylesheet" />
  </head>
  
  <body>
   <div class="mianCont" >
	<!-- 引入header.jsp -->
	<jsp:include page="head.jsp"></jsp:include>
	<div id="plistContainer">
	<div class="positions">
   当前位置：<a href="index.jsp">首页</a> &gt; <a href="#" class="posCur">商品列表</a>
  </div><!--positions/-->
  <div class="cont">
  <div class="jilu">

   </div><!--jilu/-->
   <div class="contRight" >
    <div class="frProList"  >
      <dl  v-for="item in productList"  @click="showDetail(item.pid)">
      <dt><img :src="item.image" width="132" height="129" /></a></dt>
      <dd>{{item.pname}}</dd>
      <dd class="cheng">￥{{item.newPrice}}/元 <span>￥{{item.oldPrice}}</span></dd>
     </dl>
      <div class="clears"></div>
     </div><!--frProList-->
   </div><!--contRight/-->
   <div class="clears"></div>
   <!--分页 -->
		<div style="width: 380px; margin: 0 auto; margin-top: 50px;">
			<zpagenav v-bind:page="page" v-bind:page-size="pageSize"
				v-bind:total="total" v-bind:max-page="maxPage"
				v-on:pagehandler="pageHandler"> <zpagenav>
		</div>
		<!-- 分页结束 -->
  </div><!--cont/-->
	<!-- 引入footer.jsp -->
	<jsp:include page="foot.jsp"></jsp:include>
	</div>
   </div>
  </body>
  <script src="js/vue.min.js"></script>
<script src="js/vue-resource.js"></script>
<script src="js/zpageNav.js"></script>
<script type="text/javascript">
	var headvue = new Vue({
		el:'#plistContainer',
		data : {
			productList : [],
			page : 1,
			pageSize : 10,
			total : 100,
			maxPage : 9,
			cname:""
		},
		methods : {
			pageHandler : function(page) {
				this.page = page;
				var params = {
					"page" : page,
					"row" : this.pageSize,
					"cid" : getQueryString("cid")
				};
				this.$http.post("getCatBooks", params, 
				{emulateJSON : true}).then(
				function(res) {
					this.productList = res.data.list;
					this.total = res.data.total;
					this.maxPage = res.data.pages;
				}, function(res) {
					console.log(res);
				});
			},
			showDetail:function(pid){
				location.href="product_info.jsp?pid="+pid;
		       }
		
		},
		created : function() {
			this.pageHandler(1);
		}
	});
</script>
</html>
