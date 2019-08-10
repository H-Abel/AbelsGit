<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">

		 <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
		 <link rel="stylesheet" href="https://unpkg.com/bootstrap-table@1.14.2/dist/bootstrap-table.min.css">
		 <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
	     <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
	     
	     <title>类型管理</title>
		<style  type="text/css">
		
		.content{
			float: left;
			width: 10%;
		}
		.main{
			position: relative;
			float: right;
			width: 90%;
		}
		</style>

	</head>
	<body>
		<div>
		<div class="row clearfix">
		<div class="col-sm-12 col-md-12 column">
			<!--role属性标识这是一个导航容器-->
			<nav class="navbar navbar-default" role="navigation">
				<div class="navbar-header">
					 <button class="navbar-toggle" type="button" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"> 
					 	<span class="sr-only">Toggle navigation</span>
					 	<span class="icon-bar"></span>
					 	<span class="icon-bar"></span>
					 	<span class="icon-bar"></span>
					 </button> 
					 <a class="navbar-brand" href="#"><strong>后台管理</strong></a>
				</div>
				
					<ul class="nav navbar-nav navbar-right">
					<!-- 
						<li>
							 <a href="${pageContext.request.contextPath }/admin/language?locale=zh_CN"><spring:message code="language.cn"></spring:message></a>
						</li>
						<li>
						     <a href="${pageContext.request.contextPath }/admin/language?locale=en_US"><spring:message code="language.en"></spring:message></a>
						</li>
						 -->
						<li>
							<a href="#"></a>
						</li>
						<li>
							<a href="${pageContext.request.contextPath}/admin/loginOut"><span class="glyphicon">安全退出</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
						</li>
					</ul>
				
					<form class="navbar-form navbar-right" role="search">
						<div class="form-group">
							<input class="form-control" type="text" />
						</div> <button class="btn btn-default" type="submit"><span class="glyphicon glyphicon-search"></span>搜索</button>
					</form>
			</nav>
			</div>	
			
		</div>
	    </div>

	<div class="container">
			<div class="clearfix">
				<div class="col-md-12">
					<div class="content">
						<div class="col-sub">
							<aside class="mt-menu">
								<div class="mt-menu-tree">
									<dl class="mt-menu-item">
										<dd class="fs14"><spring:message code="management"></spring:message></dd>
										<dd><a href="${pageContext.request.contextPath}/admin/goodsManage" class="active"><spring:message code="GoodsManage"></spring:message></a></dd>
										<dd><a href="${pageContext.request.contextPath}/admin/typeManage"><spring:message code="TypeManage"></spring:message></a></dd>
										<dd><a href="${pageContext.request.contextPath}/admin/userManage"><spring:message code="UserManage"></spring:message></a></dd>
										<dd><a href="${pageContext.request.contextPath}/admin/orderManage"><spring:message code="OrderManage"></spring:message></a></dd>
										
									</dl>
								</div>
							</aside>
						</div>
					</div>
				    <div class="main">
				    	<div>
				    		<a class="btn btn-default"  href="${pageContext.request.contextPath}/admin/toAddType">添加商品类型</a>
				    		
				    		
				    	</div>
				    	<table id="mytab" class="table table-bordered table-hover" >
				    	    <thead>
				    		<tr>
				    		  <th style="width:33%;">id</th>
				    		  <th style="width:33%;">商品类型名</th>
			                  <th style="width:33%;">操作</th>
				    		</tr>
				    		</thead>
				            <tbody>
				            <c:forEach items="${list}" var="l">
				    	    <tr>
				    		  <td>${l.id}</td>
				    		  <td>${l.typename}</td>
				    		 
				    		 <td> 
				    		    <a href="${pageContext.request.contextPath }/admin/deleteAType?id=${l.id}" class="btn btn-default">删除</a>
				    		    <a href="${pageContext.request.contextPath}/admin/toUpdateType?id=${l.id}" class="btn btn-default">修改</a>  
				    		  </td>
				    		</tr>
				            </c:forEach>
				    	    </tbody>
				    	</table>
				    	                     
				    </div>
			    </div>
			</div>    
	</div>	
			
		
	<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
	<script src="https://unpkg.com/bootstrap-table@1.14.2/dist/bootstrap-table.min.js"></script>
	</body>
</html>