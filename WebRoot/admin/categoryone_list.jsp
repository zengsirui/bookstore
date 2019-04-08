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
 <div class="rt_content" id="one_Container">
      <div class="page_title">
       <h2 class="fl">目录列表</h2>
       <a href="categoryone_add.jsp" class="fr top_rt_btn add_icon">添加一级目录</a>
      </div>
      <section class="mtb">
       
       <input type="text" class="textbox textbox_225"   placeholder="输入会员名"/>
       <input type="button" value="查询" class="group_btn"  />
      </section>
      <table class="table">
       <tr>
        <th>选择</th>
        <th>Id</th>
        <th>一级目录</th>
        <th>操作</th>
       </tr>
       <tbody  >
       <tr  v-for="(item,index) in categoryoneList" >
       <td class="center"><input type="checkbox" name="delId" value="{{item.cid}}"/></td>
        <td class="center">{{item.cid}}</td>
        <td class="center">{{item.cname}}</td>
        <td class="center">
         <a  @click="edit(item.cid)"  href="javascript:;" title="编辑" class="link_icon">&#101;</a>
         <a  @click="del(item.cid)" href="javascript:;" title="删除" class="link_icon">&#100;</a>
        </td>
       </tr>
       </tbody>

      </table>
     
 </div>
 
</section>

  </body>
  <script src="../js/vue.min.js"></script>
<script src="../js/vue-resource.js"></script>
<script type="text/javascript">
var vue3=new Vue({
	el:'#one_Container',
	data:{
	categoryoneList:[]
	
	
	
},

methods:{

	 del:function(cid){
	 this.$http.post("delCategoryone",{"cid":cid},{emulateJSON:true}).then(
   		  function(res){
   			 alert("删除成功！");
	           window.location.reload(true);
                 
                 },
             function(res){
                     console.log(res);
                 }); 
                },
                
                
                
                
                
      edit:function(cid){
				location.href="edit_categoryone.jsp?cid="+cid;
			}

},

created:function(){
   this.$http.get("getCategories").then(
			function(res){
				//请求成功
				this.categoryoneList=res.data;
				
},
function(res){
	//请求失败
	console.log(res);
});
}

});


</script>
  
  
  
</html>
