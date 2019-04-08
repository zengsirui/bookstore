<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	<div id="deliveryContainer">
   <div class="positions">
   当前位置：<a href="index.html">首页</a> &gt; <a href="vip.html">会员中心</a>
    &gt; <a href="#" class="posCur">我的订单</a>
  </div><!--positions/-->
  <div class="cont">
   <div class="contLeft" id="contLeft">
    <h3 class="leftTitle">会员中心</h3>
    <dl class="helpNav vipNav">
     <dt>我的主页</dt>
      <dd>
       <a href="vip.jsp" class="vipCur">个人中心</a>
       <a href="vip_order.jsp">我的订单</a>
      </dd>
     <dt>账户设置</dt>
      <dd>
       <a href="vipMy.jsp">个人信息</a>
       <a href="vipPwd.jsp">密码修改</a>
       <a href="vipAdress.jsp">收货地址</a>
      </dd>
      <dt>客户服务</dt>
       <dd>
        <a href="vipExit.jsp">网站使用条款</a>
        <a href="vipTuihuo.jsp">网站免责声明</a>
        <a href="message.jsp">在线留言</a>
       </dd>
      
      
    </dl><!--helpNav/-->
   </div><!--contLeft/-->
   <div class="contRight">
    <div class="helpPar">
&nbsp;&nbsp;&nbsp;&nbsp;首先，你要注册一个淘宝帐号，然后下载一个在线聊天工具：淘宝旺旺（淘宝网也提供网页版阿里旺旺）。登录后，可以在我的淘宝中先选择你要购买的商品进行查询，在查询出的页面，你可以选择以商家信誉排列商品或以价格高低排列商品，这样比较一目了然的可以看到你所要选的商品。<br /><br />
&nbsp;&nbsp;&nbsp;&nbsp;然后，选定一家信誉尚可，价格较佳的商家，就你所要的商品和他详谈商品的品质，价格及售后和所走的物流，一切谈妥后，选择支付方式，在这里推荐使用第三方支付平台：支付宝，这一支付平台是你先把货款打入一第三方帐户，只有当你收到货时确认货品与商家承诺一致，支付宝才会把你的款项转入商家户头，这样对你购物比较有保障。你可以用网上银行给支付宝充值，如果无网上银行，可以让有网上银行的朋友给你充值，还有部分商家支持信用卡在线支付的。<br /><br />
&nbsp;&nbsp;&nbsp;&nbsp;第三，当你收到货物后及时查验是否与卖家说描述的相符合，如果没有问题的话可以就货物是否与卖家说描述的相符、卖家的服务态度、卖家的发货速度对卖家的进行评价，这有助于提高双方的信誉，也为其他人购物提供了参考。等到卖家对买家进行了评价后可以说这次交易就完全结束。
    </div><!--helpPar-->
   </div><!--contRight/-->
   <div class="clears"></div>
  </div><!--cont/-->
  </div>
   <!-- 引入footer.jsp -->
	<jsp:include page="foot.jsp"></jsp:include>
  </div>
  
  </body>


	
  <script type="text/javascript">
 $(function(){
	 $(".vipNav dd:first").show();
	 });
</script>
</html>
