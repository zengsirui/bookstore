<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<!--[if lt IE 7 ]><html lang="en" class="ie6 ielt7 ielt8 ielt9"><![endif]--><!--[if IE 7 ]><html lang="en" class="ie7 ielt8 ielt9"><![endif]--><!--[if IE 8 ]><html lang="en" class="ie8 ielt9"><![endif]--><!--[if IE 9 ]><html lang="en" class="ie9"> <![endif]--><!--[if (gt IE 9)|!(IE)]><!--> 
<html lang="en"><!--<![endif]--> 
	<head>
	
	</head>
	<body>
		<div class="container">
			
			<div class="row">
			
			<div class="span9">
					<h1 style="text-align: center;">
						 修改管理员
					</h1>
					<form class="form-horizontal" method="post" action="../adminModify.htm">
						<fieldset>
							<div class="control-group" >
								<label class="control-label" for="input01">管理员姓名</label>
								<div class="controls">
									<input type="text" class="input-xlarge" id="username" name="username"
									    value="${admin.username }"/>
									    <input type="hidden" name="uid" value="${admin.uid }" />
								</div>
							</div></br>
							<div class="control-group" >
								<label class="control-label" for="input01">管理员密码</label>
								<div class="controls">
									<input type="text" class="input-xlarge" id="password" name="password"
									    value="${admin.password }"/>
									    <input type="hidden" name="uid" value="${admin.uid }" />
								</div>
							</div></br>
							<div class="control-group">
								<label class="control-label" for="select01">管理员类型</label>
								<div class="controls">
									<select id="type" name="type"> 
										<option value="1" <c:if test="${admin.type==1}">selected="selected"</c:if>>超级管理员</option> 
										<option value="2" <c:if test="${admin.type==2}">selected="selected"</c:if>>普通管理员</option> 
									
									</select>
								</div>
							</div></br>
													
							<div class="form-actions">
								<button type="submit" class="btn btn-primary"  >修改</button> 
								&nbsp;&nbsp;
								<button class="btn" onclick="javascript:history.back();">取消</button>
							</div>
						</fieldset>
					</form>
				</div>
			</div>
		</div>
		
		
	</body>
</html>

