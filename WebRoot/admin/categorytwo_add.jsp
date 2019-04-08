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
  </head>
  
  <body>
  <div id="add_Container">
  <jsp:include page="header.jsp"></jsp:include>
				<jsp:include page="left.jsp"></jsp:include>
  <section class="rt_wrap content mCustomScrollbar">
 <div class="rt_content"  >
 <form id="form"  action="" method="post">
      <div class="page_title">
       <h2 class="fl">添加二级目录</h2>
       <a href="categorytwo_list.jsp" class="fr top_rt_btn money_icon">目录列表</a>
      </div>
      <ul class="ulColumn2"   >
      <li>
		<label class="item_name"  style="width:120px;" for="input01">书籍一级分类</label>
								
		<select class="select" name="cid" id="cid" v-model="selected">
		<option v-for="item in categoryoneList" :value="item.cid">{{item.cname}}</option>
										
	</select>
							
	</li>
	<li>
<label class="item_name"  style="width:120px;" for="input01">书籍二级分类</label>
		 <input  type="text" class="textbox textbox_225" id="" name="" v-model="ccname" />						
	
							
</li>
       <li>
        <span class="item_name" style="width:120px;"></span>
       <input class="link_btn" value="提交" @click="javascript:insert();">
       </li>
       
      </ul>
      </form>
 </div>
</section>
</div>
  
  </body>
 <script src="../js/vue.min.js"></script>
<script src="../js/vue-resource.js"></script>
<script type="text/javascript">
var tvue=new Vue({
	el:'#add_Container',
	data:{
	ccname:"",
	categoryoneList:[],
	selected:"",
	categorytwoList:[]
},

    methods:{


   insert:function(ccid){
				var params = {"ccname":this.ccname,"cid":this.selected};
				this.$http.post("insertCategorytwo",params,{emulateJSON:true}).then(
				function(res){
					alert("添加成功！");
					location.href="categorytwo_list.jsp";
				},
				function(res){
					console.log(res);
				});
			}
    

},

created:function(){
   
    
	var params={"ccid":getQueryString("ccid")};
			this.$http.get("getCategories").then(
			function(res){
				this.categoryoneList=res.data;
			},
			function(res){
				console.log(res);
			});
								
}
});
</script>
</html>
