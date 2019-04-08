<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>破万卷书店网</title>
<link type="text/css" href="css/css.css" rel="stylesheet" />
<script src="js/MagicZoom.js" type="text/javascript"></script>
<script src="js/jquery.min.js" type="text/javascript"></script>
<script src="js/bootstrap.min.js" type="text/javascript"></script>
<script src="js/util.js"></script>
</head>

<body>
 <div class="mianCont">
    <!-- 引入head.jsp -->
	<jsp:include page="head.jsp"></jsp:include>
	<div id="indexContainer">
  <div class="pnt">
  
   <div class="pntRight">
    <div class="banner">
     <div id="kinMaxShow">
      <div >
       <a href="#"><img src="img/ban6.jpg"  height="360"  /></a>
      </div> 		
      <div>
       <a href="http://localhost:8090/bookstore/product_info.jsp?pid=99470506"><img src="img/ban2.jpg" height="360"  /></a>
      </div>
      <div>
       <a href="http://localhost:8090/bookstore/product_info.jsp?pid=82313708"><img src="img/ban3.jpg" height="360"  /></a>
      </div>
      <div>
       <a href="http://localhost:8090/bookstore/product_info.jsp?pid=86526050"><img src="img/ban4.jpg" height="360"  /></a>
      </div>
      <div>
       <a href="http://localhost:8090/bookstore/product_info.jsp?pid=91553751"><img src="img/ban5.jpg" height="360"  /></a>
      </div>      
     </div><!--kinMaxShow/-->
    </div><!--banner/-->
   </div><!--pntRight/-->
   <div class="clears"></div>
  </div><!--pnt/-->
  <div class="rdPro" >
   <div class="rdLeft">
    <ul class="rdList">
     <li>出版社推荐</li>
     <li>编辑推荐</li>
     <li>重磅推荐</li>
     <li>热门推荐</li>
     <div class="clears"></div>
    </ul><!--rdList/-->
    <div>
     <div class="clears"></div>
    </div><!--rdPro/-->
    <div class="rdProBox">
     <dl   v-for="(item,index) in pressBooks" @click="showDetail(item.pid)">
      <dt><a href="#"><img :src="item.image" width="132" height="129" /></a></dt>
      <dd>{{item.pname}}</dd>
      <dd class="cheng">￥{{item.newPrice}}</dd>
     </dl>
     <div class="clears"></div>
    </div><!--rdPro/-->
     <div class="rdProBox">
      <dl   v-for="(item,index) in authorBooks"  @click="showDetail(item.pid)">
      <dt><a href="#"><img :src="item.image" width="132" height="129" /></a></dt>
      <dd>{{item.pname}}</dd>
      <dd class="cheng">￥{{item.newPrice}}</dd>
     </dl>
     <div class="clears"></div>
    </div><!--rdPro/-->
     <div class="rdProBox">
      <dl   v-for="(item,index) in hotBooks" @click="showDetail(item.pid)">
      <dt><a href="#"><img :src="item.image" width="132" height="129" /></a></dt>
      <dd>{{item.pname}}</dd>
      <dd class="cheng">￥{{item.newPrice}}</dd>
     </dl>
     <div class="clears"></div>
    </div><!--rdPro/-->
     <div class="rdProBox">
      <dl   v-for="(item,index) in newBooks" @click="showDetail(item.pid)">
      <dt><a href="#"><img :src="item.image" width="132" height="129" /></a></dt>
      <dd>{{item.pname}}</dd>
      <dd class="cheng">￥{{item.newPrice}}</dd>
     </dl>
     <div class="clears"></div>
    </div><!--rdPro/-->
   </div><!--rdLeft/-->
   <div class="rdRight">
    <img src="img/rdRight.jpg" width="221" height="254" />
   </div><!--rdRight/-->
   <div class="clears"></div>
  </div><!--rdPro/-->
  <div class="hengfu">
   <img src="img/h2.bmp" width="979" height="97" />
  </div><!--hengfu/-->
  <div class="floor" id="floor1">
   <h3 class="floorTitle">
   1F&nbsp;&nbsp;&nbsp;&nbsp;计算机图书
 
   </h3>
   <div class="floorBox">
    <div class="floorLeft" >
     
     <div class="flImg"><img src="img/f3.jpg" width="198" height="350" /></div>
    </div><!--floorLeft/-->
    <div class="floorRight">
     <div class="frProList">
       <dl   v-for="(item,index) in compBooks" @click="showDetail(item.pid)">
      <dt><a href="#"><img :src="item.image" width="132" height="129" /></a></dt>
      <dd>{{item.pname}}</dd>
      <dd class="cheng">￥{{item.newPrice}}/本</dd>
     </dl>
      <div class="clears"></div>
     </div><!--frProList-->
    </div><!--floorRight/-->
    <div class="clears"></div>
   </div><!--floorBox/-->
  </div><!--floor/-->
  <div class="hengfu">
   <img src="img/h3.bmp" width="978" height="97" />
  </div><!--hengfu/-->
  <div class="floor" id="floor3">
   <h3 class="floorTitle">
   2F&nbsp;&nbsp;&nbsp;&nbsp;科技图书
   
   </h3>
   <div class="floorBox">
    <div class="floorLeft">
     <div class="flImg"><img src="img/f4.jpg" width="200" height="350" /></div>
    </div><!--floorLeft/-->
    <div class="floorRight">
     <div class="frProList">
      <dl   v-for="(item,index) in sctBooks" @click="showDetail(item.pid)">
      <dt><a href="#"><img :src="item.image" width="132" height="129" /></a></dt>
      <dd>{{item.pname}}</dd>
      <dd class="cheng">￥{{item.newPrice}}/本</dd>
     </dl>
      <div class="clears"></div>
     </div><!--frProList-->
    </div><!--floorRight/-->
    <div class="clears"></div>
   </div><!--floorBox/-->
  </div><!--floor/-->
  <div class="hengfu">
   <img src="img/h4.bmp" width="978" height="97" />
  </div><!--hengfu/-->
  <div class="floor" id="floor2">
   <h3 class="floorTitle">
   3F&nbsp;&nbsp;&nbsp;&nbsp;经济管理图书
  
   </h3>
   <div class="floorBox">
    <div class="floorLeft">
     <div class="flImg"><img src="img/f2.jpg" width="200" height="350" /></div>
    </div><!--floorLeft/-->
    <div class="floorRight">
     
    
   
     <div class="frProList">
      <dl   v-for="(item,index) in monBooks" @click="showDetail(item.pid)" >
      <dt><a href="#"><img :src="item.image" width="132" height="129" /></a></dt>
      <dd>{{item.pname}}</dd>
      <dd class="cheng">￥{{item.newPrice}}/本</dd>
     </dl>
      <div class="clears"></div>
     </div><!--frProList-->
    </div><!--floorRight/-->
    <div class="clears"></div>
   </div><!--floorBox/-->
  </div><!--floor/-->
  </div>
<!-- 引入foot.jsp -->
	<jsp:include page="foot.jsp"></jsp:include>
 </div><!--mianCont/-->
 <a href="#" class="backTop">&nbsp;</a>
</body>
<script src="js/vue.min.js"></script>
<script src="js/vue-resource.js"></script>
<script type="text/javascript">
	var headvue = new Vue({
		el :'#indexContainer',
		data : {
			caroBooks : [],
			hotBooks : [],
			newBooks : [],
			authorBooks:[],
			pressBooks:[],
			sctBooks:[],
			monBooks:[],
			compBooks:[]
			

		},
		methods:{
			showDetail:function(pid){
				location.href="product_info.jsp?pid="+pid;
			}
		},
		created : function() {
			//created代表当页面加载完成
			//发送Ajax请求
			this.$http.get("getCaroBooks").then(function(res) {
				this.caroBooks = res.data.list;
				 
			}, function(res) {
				console.log(res);
				
			});
			this.$http.get("getPressBooks").then(function(res) {
				this.pressBooks = res.data.list;

			}, function(res) {
				console.log(res);
				
			});
			this.$http.get("getAuthorBooks").then(function(res) {
				this.authorBooks = res.data.list;

			}, function(res) {
				console.log(res);
				
			});
			this.$http.get("getHotBooks").then
			(function(res) {
				this.hotBooks = res.data.list;

			}, 
			
			function(res) {
				console.log(res);
			});
			this.$http.get("getCompBooks").then(function(res) {
				this.compBooks = res.data.list;

			}, function(res) {
				console.log(res);
				
			});
			this.$http.get("getSctBooks").then(function(res) {
				this.sctBooks = res.data.list;

			}, function(res) {
				console.log(res);
				
			});
			this.$http.get("getMonBooks").then(function(res) {
				this.monBooks = res.data.list;

			}, function(res) {
				console.log(res);
				
			});
			this.$http.get("getNewBooks").then
			(function(res) {
				this.newBooks = res.data.list;

			}, 
			function(res) {
				console.log(res);
			});
		}
	});
</script>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/js.js"></script>
<script src="js/wb.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
$(function(){
	$("#kinMaxShow").kinMaxShow();
});
</script>
</html>
