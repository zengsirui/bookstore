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
  <div id="edit_Container">
  <jsp:include page="header.jsp"></jsp:include>
				<jsp:include page="left.jsp"></jsp:include>
  <section class="rt_wrap content mCustomScrollbar">
 <div class="rt_content"  >
 <form id="form"  action="" method="post">
      <div class="page_title">
       <h2 class="fl">目录详情</h2>
       <a href="categoryone_list.jsp" class="fr top_rt_btn money_icon">目录列表</a>
      </div>
      <ul class="ulColumn2"   >
      
	<li>
<label class="item_name"  style="width:120px;" for="input01">书籍一级分类</label>
		 <input  type="text" class="textbox textbox_225"  id="" name="" v-model="cname" />						
	
							
</li>
       <li>
        <span class="item_name" style="width:120px;"></span>
       <input class="link_btn" value="修改/保存" @click="edit()">
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
	el:'#edit_Container',
	data:{
	cname:"",
	categoryoneList:[]
	
},

    methods:{


   edit:function(ccid){
				var params = {"cid":getQueryString("cid"),"cname":this.cname};
				this.$http.post("modifyCategoryone",params,{emulateJSON:true}).then(
				function(res){
					alert("修改成功！");
					location.href="categoryone_list.jsp";
				},
				function(res){
					console.log(res);
				});
			}
    

},

created:function(){
   
  
			
			this.$http.post("getCategoryoneByCid",{"cid":getQueryString("cid")},{emulateJSON:true}).then(
	        function(res){
	        	this.categoryoneList=res.data;
	        		this.cname=res.data.cname;
	        	
	          },
	          function(res){
	          	console.log(res);
	          }
	       );
 


					
}
});
</script>
</html>
