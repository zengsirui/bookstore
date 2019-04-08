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
	<div id="pinfoContainer">
  <div class="positions">
   当前位置：<a href="index.jsp">首页</a> &gt; <a href="#" class="posCur">{{pInfo.cname}}</a>
  </div><!--positions/-->
  <div class="cont">

   <div class="contRight" style="border:0;">
   <div class="proBox">
   <div id="tsShopContainer">
	<div id="tsImgS"><a :src="pInfo.image" title="img" class="MagicZoom" id="MagicZoom"><img width="300" height="300" :src="pInfo.image" /></a></div>
	<div id="tsPicContainer">
		<div id="tsImgSArrL" onclick="tsScrollArrLeft()"></div>
		<div id="tsImgSCon">
			<ul>
				<li onclick="showPic(0)" rel="MagicZoom" class="tsSelectImg"><img height="42" width="42" :src="pInfo.image"  /></li>
				<li onclick="showPic(1)" rel="MagicZoom"><img height="42" width="42"  :src="pInfo.image"  /></li>
				<li onclick="showPic(2)" rel="MagicZoom"><img height="42" width="42"  :src="pInfo.image"  /></li>
				<li onclick="showPic(3)" rel="MagicZoom"><img height="42" width="42" :src="pInfo.image"  /></li>
				<li onclick="showPic(4)" rel="MagicZoom"><img height="42" width="42"  :src="pInfo.image"  /></li>
				<li onclick="showPic(5)" rel="MagicZoom"><img height="42" width="42"  :src="pInfo.image"  /></li>
				<li onclick="showPic(6)" rel="MagicZoom"><img height="42" width="42"  :src="pInfo.image"  /></li>
				<li onclick="showPic(7)" rel="MagicZoom"><img height="42" width="42"  :src="pInfo.image"  /></li>
				<li onclick="showPic(8)" rel="MagicZoom"><img height="42" width="42"  :src="pInfo.image"  /></li>
				<li onclick="showPic(9)" rel="MagicZoom"><img height="42" width="42"  :src="pInfo.image"  /></li>
				<li onclick="showPic(10)" rel="MagicZoom"><img height="42" width="42"  :src="pInfo.image"  /></li>
			</ul>
		</div>
		<div id="tsImgSArrR" onclick="tsScrollArrRight()"></div>
	</div>
	<img class="MagicZoomLoading" width="16" height="16" src="img/loading.gif" alt="Loading..." />
    <script src="js/ShopShow.js"></script>
    </div><!--tsShopContainer/-->
    <div class="proBoxRight">
     <h3 class="proTitle">{{pInfo.pname}}</h3>
     <div>书籍出版社： {{pInfo.press}} </div>
      <div>书籍作者： {{pInfo.author}} </div>
     <div>会员价：<strong class="red">¥{{pInfo.newPrice}}</strong> </div>
     <div>类型：{{pInfo.ccname}} </div>
      <div>销量：{{pInfo.volume}} </div>
     <div>库存：<strong class="red">{{pInfo.total}} </strong> </div>
     <div>书籍上市时间：{{pInfo.pdate}} </div>
     <div class="shuliang2">
<div class="info-desc">
						购买数量: <input id="quantity" name="quantity" v-model="quantity" type="number" value="1"
							maxlength="4" size="10" type="text">
					</div>
     </div><!--shuliang2/-->
     </br>
     <div class="info-desc-1">
     <img src="img/goumai.png" width="117"  height="36" @click="addCart()"/></a>&nbsp;&nbsp;
						
					</div>
    </div><!--proRight/-->
    <div class="clears"></div>
    </div><!--proBox/-->
    <ul class="fangyuan">
      <li>商品描述</li>
      <li>商品评论</li>
      <div class="clears"></div>
    </ul><!--fangyuan/-->
    <div class="fangList">
    <div class="fangPar">
        {{pInfo.pdesc}}
    </div><!--fangPar/-->
    </div><!--fangList/-->
   
    <div class="fangList" >
      <table class="table">
						<tbody>
							<tr class="active" v-for="item in commentList">
								<td>用户名：{{item.username}}</td></br>
								<td>发表于:{{item.created}}</td>
								<td colspan="2">内容：{{item.content}}</td>
							</tr>
							
						</tbody>
					</table>
    </div><!--fangList/-->
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
	var pinfovue = new Vue({
		el:'#pinfoContainer',
		data : {
			pInfo:{
			pname:"",
			cname:"",
			newPrice:0,
			oldPrice:0,
			total:0,
			volume:0,
			pdesc:"",
			pdate:"",
			image:"",
			press:"",
			author:""
			},
			images:[],
			quantity:1,
			commentList:[]
		
		},
		methods : {
			addCart:function(){
			if(this.pInfo.total<=0)
			{
			  alert("该商品已经卖光！");
			}else if(this.pInfo.total-this.quantity<0)
			{
			  alert("库存不足，请重新选择购买的数量!");
			}else
			{
			 var subtotal=this.quantity*(this.pInfo.newPrice);
			 var params=
			 {
			   "pid":getQueryString("pid"),
			   "count":this.quantity,
			   "subtotal":subtotal
			 };
		this.$http.post("addCart",params,{emulateJSON:true}).then(
			function(res)
			{
			  if(res.data.result=="error")
			  {
			    alert("您未登录，请先登录再购买！");
			    location.href="login.jsp";
			  }else
			  {
			    alert("商品在购物车等亲哦！");
			     location.href="shopcart.jsp";
			  }
			},
			function(res)
			{
			  console.log(res);
			}
		);
	   }
	  }
	},
		created : function() {
			var params={"pid":getQueryString("pid")};
			this.$http.post("getProductInfo",params,{emulateJSON:true}).then(
			function(res)
			{
			   this.pInfo=res.data;
			  
			},
			  function(res)
			  {
			  console.log(res);
			  }
			);
			this.$http.post("getBookComment",params,{emulateJSON:true}).then(
			function(res)
			{
			  this.commentList=res.data;
		
			  
			},
			function(res){
			  console.log(res);
			}
		   );
		  }
		});
	
	</script>
</html>
