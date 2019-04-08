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
 <div class="rt_content" id="two_Container">
      <div class="page_title">
       <h2 class="fl">目录列表</h2>
       <a href="categorytwo_add.jsp" class="fr top_rt_btn add_icon">添加二级目录</a>
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
        <th>二级目录</th>
        <th>操作</th>
       </tr>
       <tbody  v-for="(item,index) in categorytwoList">
       <tr  >
       <td class="center"><input type="checkbox" name="delId" value="{{item.ccid}}"/></td>
        <td class="center">{{item.ccid}}</td>
        <td class="center">{{item.cname}}</td>
        <td class="center">{{item.ccname}}</td>
        <td class="center">
         <a  @click="edit(item.ccid)"  href="javascript:;" title="编辑" class="link_icon">&#101;</a>
         <a  @click="del(item.ccid)" href="javascript:;" title="删除" class="link_icon">&#100;</a>
        </td>
       </tr>
       </tbody>

      </table>
      <div style="width: 380px; margin: 0 auto; margin-top: 50px; " >
						<zpagenav v-bind:page="page" v-bind:page-size="pageSize"  v-bind:max-page="maxPage"
						v-on:pagehandler="pageHandler"
						v-bind:total="total">
						</zpagenav>
				</div>
     
 </div>
 
</section>

  </body>
  <script src="../js/vue.min.js"></script>
<script src="../js/vue-resource.js"></script>
<script src="../js/zpageNav.js"></script>
<script type="text/javascript">
var vue3=new Vue({
	el:'#two_Container',
	data:{
	categorytwoList:[],
	categoryoneList:[],
	page : 1,
	pageSize : 10,
	total : 100,
	maxPage : 9
	
	
	
},

methods:{

pageHandler : function(page) {
				this.page = page;
				var params = {
					"page" : page,
					"row" : this.pageSize
				};
				this.$http.post("getTwoCategory", params, {emulateJSON : true}).then(
				function(res) {
					this.categorytwoList = res.data.list;
					this.total = res.data.total;
					this.maxPage = res.data.pages;
				}, function(res) {
					console.log(res);
				}
				);
			},
			   del:function(ccid){
	 this.$http.post("delCategorytwo",{"ccid":ccid},{emulateJSON:true}).then(
   		  function(res){
   			 alert("删除成功！");
	           window.location.reload(true);
                 
                 },
             function(res){
                     console.log(res);
                 }); 
                },
                
                
                
                
                
      edit:function(ccid){
				location.href="edit_categorytwo.jsp?ccid="+ccid;
			}

},

created:function(){
    this.pageHandler(1);
}
}
);


</script>
  
  
  
</html>
