<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
  <head>
  <meta http-equiv="Content-Type" content="multipart/form-data; charset=utf-8" >
      <jsp:include page="top.jsp"></jsp:include>
      
  </head>
  
  <body>
  <div class="container">
			<jsp:include page="header.jsp"></jsp:include>
			<div class="row">
				<jsp:include page="left.jsp"></jsp:include>
				
  <section class="rt_wrap content mCustomScrollbar">
 <div class="rt_content">
      <div class="page_title">
       <h2 class="fl">新增图书</h2>
       <a class="fr top_rt_btn" href="product_list.jsp">返回产品列表</a>
      </div>
     <section >
     <form id="uploadForm" class="form-horizontal"  enctype="multipart/form-data">
						<fieldset>
						<ul class="ulColumn2" >
						
						     <li>
								    <span class="item_name" style="width:120px;"  for="input01">商品名称</span>
							
									<input type="text" class="textbox textbox_295" id="pname" name="pname"/>
							 </li>
						
							 <li>
								<span class="item_name"  style="width:120px;" for="input01">商品库存</span>
								
									<input type="text" class="textbox textbox_295" id="total" name="total"/>
								
							 </li>	
							
						     <li>
								<label class="item_name" style="width:120px;" for="input01">商品价格</label>
								
									<input type="text" class="textbox textbox_295" id="oldPrice" name="oldPrice"/>
							
							</li>
								<li>
								<label class="item_name" style="width:120px;" for="input01">书籍作者</label>
								
									<input type="text" class="textbox textbox_295" id="author" name="author"/>
							
							</li>
						
								<li>
								<label class="item_name" style="width:120px;" for="input01">出版社&nbsp;&nbsp;&nbsp;</label>
								
									<input type="text" class="textbox textbox_295" id="press" name="press"/>
							
							</li>
						
					
							<li>
								<label class="item_name"  style="width:120px;" for="input01">书籍一级分类</label>
								
									<select class="select" name="cid" id="cid" onchange="show_ccid(this.options[this.options.selectedIndex].value)">
									<option  >选择产品一级分类</option>
										
									</select>
							
							</li>
							<li>
								<label class="item_name"  style="width:120px;" for="input01">书籍二级分类</label>
								
									<select class="select" name="ccid" id="ccid" >
									<option  >选择产品二级分类</option>
										
									</select>
							
							</li>
				
						
							<li>
								<label class="item_name" for="fileInput">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;商品图片</label>
									<input class="input-file" multiple="multiple" id="imageFile" name="imageFile" type="file" accept="image/*"  
									      onchange="javascript:changeImg()"/>
								
								<div class="controls" id="imgs">
									
								</div>
							</li>	
							
							<li>
								<label class="item_name" for="textarea" style="vertical-align: top;display: inline-block;">
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;商品描述</label>
								  
									<textarea class="input-xlarge" id="pdesc" rows="20" cols="30" name="pdesc"></textarea>
								 	
								
							</li>
							<li>
								<label class="item_name" style="width:120px" for="optionsCheckbox">推荐方向</label>
								
									<label class="single_selection">&nbsp;<input type="radio" name="state" id="state" value="1"/>&nbsp;轮播&nbsp;</label>
									<label class="single_selection">&nbsp;<input type="radio" name="state" id="state" value="2"/>&nbsp;编辑&nbsp;</label>
									<label class="single_selection">&nbsp;<input type="radio" name="state" id="state" value="3"/>&nbsp;出版社&nbsp;</label>
									<label class="single_selection">&nbsp;<input type="radio" name="state" id="state" value="4"/>&nbsp;重磅&nbsp;</label>
									<label class="single_selection">&nbsp;<input type="radio" name="state" id="state" value="5"/>&nbsp;热门&nbsp;</label>
									&nbsp;<input type="radio" name="state" id="state" value="0" checked="checked" />&nbsp;否
								
							</li>
											
							<li>
								<button type="button" class="item_name" onclick="javascript:addProduct();">保存</button> 
								&nbsp;&nbsp;
								<button class="btn" onclick="javascript:history.back();">取消</button>
							</li>
							</ul>
						</fieldset>
				
					</form>
     </section>
 </div>
</section>
</div>
</div>

   
  </body>
  <script type="text/javascript" src="../js/jquery.min.js"></script>
  <script type="text/javascript">
  $(function(){
		
		$.ajax({
			url : "/bookstore/admin/getCategories",
			type : "post",
			dataType : "json",//回调
			success : function(data){
			$.each(data, function(i, n){
					var option=$("<option></option>");
					option.val(n.cid);
					option.html(n.cname);
					$("select[id='cid']").append(option);
			});
			}		
		});
 
  $.ajax({
		url : "/bookstore/admin/getTwoCategories",
		type : "post",
	    data: {cid:1},
		dataType : "json",//回调
		success : function(data){
		$.each(data, function(i, n){
			var option=$("<option></option>");
			option.val(n.ccid);
			option.html(n.ccname);
			$("select[id='ccid']").append(option);	
			
			
		});
		}		
	});
  });
	function show_ccid(v){
	$("#ccid").empty();
	$.ajax({
		url : "/bookstore/admin/getTwoCategories",
		type : "post",
	    data: {cid:v},
		dataType : "json",//回调
		success : function(data){
		$.each(data, function(i, n){
			var option=$("<option></option>");
			option.val(n.ccid);
			option.html(n.ccname);
			$("select[id='ccid']").append(option);	
		});
		}		
	});
}

	
		$(function(){
			//1、建立FckEditor的对象
			var ofckEditor=new FCKeditor("pdesc");
			//参数：是页面的TextArea的name属性
			//2、设定路径
			ofckEditor.BasePath="../fckeditor/";
			
			//3、FckEditor的对象的属性（宽、高）
			ofckEditor.Height=500;
			ofckEditor.Width=530;
			//4、利用该FckEditor的对象替换掉页面的TextArea
			ofckEditor.ReplaceTextarea();
			
    	});
    	
    </script>
    <script type="text/javascript">
    function addProduct(){
         var params=new FormData($("#uploadForm")[0]);
         var oEditor=FCKeditorAPI.GetInstance("pdesc");
         var fcontent=oEditor.GetXHTML();
         params.set("pdesc",fcontent);
         $.ajax({
                 url: "/bookstore/admin/saveProduct",
                 type: "post",
                 data: params,
                 async: false,
                 cache: false,
                 contentType: false,
                 processData: false,
                 success : function(data){
                           alert("添加商品成功");
                           history.go();
                 }

             });
    }
    </script>
</html>
