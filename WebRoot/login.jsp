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
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/js.js"></script>
<script src="js/jquery.min.js" type="text/javascript"></script>
<script src="js/bootstrap.min.js" type="text/javascript"></script>
<!-- 引入自定义css文件 style.css -->
<link rel="stylesheet" href="css/style.css" type="text/css" />
  </head>
  
  <body style=" background:#FFF;" >
  <div id="loginContainer">
  <div class="loginLogo">
  <div class="logoMid">
   <h1 class="logo" style="height:71px;padding-top:10px;"><a href="index.jsp"><img src="img/logo.jpg" width="241" height="71" /></a></h1>
   <div class="loginReg">
    还没有会员账号?&nbsp;<a href="reg.jsp">免费注册</a>
   </div><!--loginReg/-->
  </div><!--logoMid/-->
 </div><!--loginLogo/-->
 <div class="loginBox">
  <div class="loginLeft">
   <img src="img/logoinimg.jpg" width="716" height="376" />
  </div><!--loginLeft/-->
  <form action="vip.jsp" method="" class="loginRight">
   <h2>会员登录</h2>
   <h3>用户名</h3>
   <input type="text" class="name"  id="userid" name="uid"
    v-model="user.userid" />
   <h3>密码</h3>
   <input type="password" class="pwd" id="password" name="password"
     v-model="user.password"  />
      <h3>验证码</h3>
   <input type="text" class="name" id="checkcode" name="checkcode"
     v-model="checkcode"  />
      <img  :src="imagSrc"  @click="changeCheckcode()" />
   <div class="zhuangtai">
    <input type="checkbox" checked="checked" /> 下次自动登录
   </div><!--zhuangtai/-->
   <div class="subs">
   <input type="button" width="100" value="登录" name="submit" @click="userLogin()"
									id="login"
									style="background: url('img/sub.jpg') no-repeat scroll 0 0 rgba(0, 0, 0, 0); height: 35px; width: 100px; color: white;">
							</div>
  
    
   </div>
  </form><!--loginRight/-->
  <div class="clears"></div>
 </div><!--loginBox/-->
   </div>
  </body>
  <script src="js/vue.min.js"></script>
<script src="js/vue-resource.js"></script>
<script type="text/javascript">
	var loginvue = new Vue({
		el : '#loginContainer',
		data : {
			user : {
				userid : 0,
				password : ""
			},
			checkcode : "",
			imagSrc : "VerifyCode"
		},
		methods : {
			userLogin : function() {
				var params = {
					"userid" : this.user.userid,
					"password" : this.user.password,
					"checkcode" : this.checkcode
				};
				this.$http.post("checkUserLogin", params, {
					emulateJSON : true
				}).then(function(res) {
					if (res.data.result == "ok") {
						alert("登录成功!");
						history.back();
					} else {
						alert("您输入的信息有误，请重新输入");
					}
				}, function(res) {
					console.log(res);
				});
			},
			changeCheckcode : function() {
				var str=this.imagSrc;
				this.imagSrc=str+"?"+new Date();
			}
		}

	});
</script>
</html>
