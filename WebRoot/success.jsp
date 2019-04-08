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
    
  </head>
  
  <body>
   <div class="mianCont">
   <!-- 引入header.jsp -->
	<jsp:include page="head.jsp"></jsp:include>
  <div class="positions">
   当前位置：<a href="index.jsp">首页</a> &gt; <a href="#" class="posCur">订单支付</a>
  </div><!--positions/-->
  <div class="cont">
   <div class="chenggong">
    <h3>下单成功</h3>
    <div class="zhifu">
     您选择的支付方式是 <strong class="red">支付宝</strong><br />
     <a href="vip_order.jsp"><img src="img/zhifu.png" width="133" height="41" /></a>
    </div><!--zhifu/-->
   </div><!--chenggong/-->
  </div><!--cont/-->
  <!-- 引入footer.jsp -->
	<jsp:include page="foot.jsp"></jsp:include>
  </div>
</div>
   
  </body>
</html>
