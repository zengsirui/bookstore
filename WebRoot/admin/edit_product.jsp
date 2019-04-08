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
 <div class="rt_content" id="etContainer">
      <div class="page_title">
       <h2 class="fl">修改图书</h2>
       <a class="fr top_rt_btn" href="product_list.jsp">返回产品列表</a>
      </div>
     <section >
     <form id="uploadForm" class="form-horizontal"  enctype="multipart/form-data">
						<fieldset>
						<ul class="ulColumn2" >
						
						     <li>
								    <span class="item_name" style="width:120px;"  for="input01">商品名称</span>
							
									<input type="text" class="textbox textbox_295" id="pname" name="pname" v-model="pname"/>
							 </li>
						
							 <li>
								<span class="item_name"  style="width:120px;" for="input01">商品库存</span>
								
									<input type="text" class="textbox textbox_295" id="total" name="total" v-model="total"/>
								
							 </li>	
							
						     <li>
								<label class="item_name" style="width:120px;" for="input01">商品价格</label>
								
									<input type="text" class="textbox textbox_295" id="oldPrice" name="oldPrice" v-model="oldPrice"/>
							
							</li>
								<li>
								<label class="item_name" style="width:120px;" for="input01">书籍作者</label>
								
									<input type="text" class="textbox textbox_295" id="author" name="author" v-model="author"/>
							
							</li>
						
								<li>
								<label class="item_name" style="width:120px;" for="input01">出版社&nbsp;&nbsp;&nbsp;</label>
								
									<input type="text" class="textbox textbox_295" id="press" name="press" v-model="press"/>
							
							</li>
						
					
							<li>
								<label class="item_name"  style="width:120px;" for="input01">书籍一级分类</label>
								
									<select class="select" name="cid" id="cid" onchange="show_ccid(this.options[this.options.selectedIndex].value)" v-model="cname">
									<option  >选择产品一级分类</option>
										
									</select>
							
							</li>
							<li>
								<label class="item_name"  style="width:120px;" for="input01">书籍二级分类</label>
								
									<select class="select" name="ccid" id="ccid" v-model="ccname" >
									<option  >选择产品二级分类</option>
										
									</select>
							
							</li>
				

					
							
							<li>
								<label class="item_name" for="textarea" style="vertical-align: top;display: inline-block;">
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;商品描述</label>
								  
									<textarea class="input-xlarge" id="pdesc" rows="20" cols="30" name="pdesc" v-model="pdesc"></textarea>
								 	
								
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
       							 <span class="item_name" style="width:120px;"></span>
        							<button type="button" class="item_name" onclick="javascript:editBook();">保存</button> 
								       &nbsp;&nbsp;
								<button type="button"  class="btn" onclick="javascript:history.back();">取消</button>
      							 </li>
							</ul>
						</fieldset>
				
					</form>
					<li>
								<label   class="item_name"for="fileInput">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;商品图片</label>
								
									<img id="imgshow" v-model="image" :src="image" style="width:200px;height=150px">
 
									<input class="input-file" multiple="multiple" id="imageFile" name="imageFile" type="file" accept="image/*"  
									      onchange="javascript:changeImg()"/>
								
								<div class="controls" id="imgs">
									
								</div>
							</li>	

     </section>
 </div>
</section>
</div>
</div>

   
  </body>
  <script src="../js/vue.min.js"></script>
<script src="../js/vue-resource.js"></script>
<script type="text/javascript">
 var tvue = new Vue({
		el:"#etContainer",
		data:{
			pname:"",
			total:"",
			cid:"",
			ccid:"",
			cname:"",
			ccname:"",
			press:"",
			author:"",
			pdesc:"",
			cname:"",
			ccname:"",
			image:"",
			oldPrice:"",
			state:0,
			productList:[]
			
		
		},
		
		created:function(){
			var params={"pid":getQueryString("pid")};

			
			this.$http.post("getProductPojoByPid",
			params,{emulateJSON:true}).then(
	        function(res){
	        	this.productList=this.data;
	        	this.cid=res.data.cid;
	        	this.ccid=res.data.ccid;
	        	this.image=res.data.image;
	        	this.oldPrice=res.data.oldPrice;
	        	this.pdesc=res.data.pdesc;
	        	this.press=res.data.press;
	        	this.cname=res.data.cname;
	        	this.ccname=res.data.ccname;
	        	this.author=res.data.author;
	        	this.pname=res.data.pname;
	            this.state=res.data.state;
	            this.total=res.data.total;
	        	
	        	
	          },
	          function(res){
	          	console.log(res);
	          }
	       );
		}
	
	});
        
  </script>
  
  
  <script type="text/javascript" src="../js/jquery.min.js"></script>
  <script type="text/javascript">

  //在input file内容改变的时候触发事件
  $('#imageFile').change(function(){
  //获取input file的files文件数组;
  //$('#filed')获取的是jQuery对象，.get(0)转为原生对象;
  //这边默认只能选一个，但是存放形式仍然是数组，所以取第一个元素使用[0];
    var file = $('#imageFile').get(0).files[0];
  //创建用来读取此文件的对象
    var reader = new FileReader();
  //使用该对象读取file文件
    reader.readAsDataURL(file);
  //读取文件成功后执行的方法函数
    reader.onload=function(e){
  //读取成功后返回的一个参数e，整个的一个进度事件
      console.log(e);
  //选择所要显示图片的img，要赋值给img的src就是e中target下result里面
  //的base64编码格式的地址
      $('#imgshow').get(0).src = e.target.result;
    }
  });

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
	    data: {cid:2},
		dataType : "json",//回调
		success : function(data){
		$.each(data, function(i, n){
			var option=$("<option></option>");
			option.val(n.ccid);
			option.html(n.ccname);
			$("select[id='ccid']").append(option);	
			var select=document.getElementById("cid");
			for(var i=0;i<select.length;i++){
				if(select.options[i].innerHTML==tvue.cname){
						console.log("cname"+tvue.cname)
						select.options[i].selected=true;
						break;
					}else{
						select.options[i].selected=false;
						}
				}
			
		});
		var select=document.getElementById("ccid");
		for(var i=0;i<select.length;i++){
			if(select.options[i].innerHTML==tvue.ccname){
					console.log("ccname"+tvue.ccname)
					select.options[i].selected=true;
					break;
				}else{
					select.options[i].selected=false;
					}
			}
		var pdesc=document.getElementById("pdesc");
		pdesc.innerHTML=tvue.pdesc;
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
function editBook(){
    	
    	var params=new FormData($("#uploadForm")[0]);
    	var oEditor=FCKeditorAPI.GetInstance("pdesc");
     
    	var fcontent=oEditor.GetXHTML();
    	//var checkContent = oEditor.GetXHTML();  
    	params.set("pdesc",fcontent);
    	params.set("pid",getQueryString("pid"));
    	$.ajax({
    		url:"/bookstore/admin/modifyProduct",
    	    type:"post",
    	  	data:params,
    	   	async:false,
    	   	cache:false,
    	   	contentType:false,
    	   	processData:false,
    	   	success:function(data){
    	   		alert("修改书籍成功");
    	   		 window.location.href="product_list.jsp";
    	   }
    	
    	});
    	
    	}


	
    	
    </script>
    
   
</html>
