<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		 <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
		 <link rel="stylesheet" href="https://unpkg.com/bootstrap-table@1.14.2/dist/bootstrap-table.min.css">
		 <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
	     <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
	     
	     <title>管理主页</title>

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
					 <a class="navbar-brand" href="#"><strong>后台管理</strong><small></small></a>
				</div>
				
					<ul class="nav navbar-nav navbar-right">
						<li>
							 <a href="#"></a>
						</li>
						<li>
							<a href="#"></a>
						</li>
						<li>
							<a href="${pageContext.request.contextPath}/admin/loginOut"><span class="">安全退出</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
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
	
	        	<div class="col-md-12 column">
	 			<div class="page-header">
	 				<h3>欢迎${admin.adminId}号管理员</h3>
	 			</div>
	 		</div>
			<div class="clearfix">
				<div class="col-md-12">
					<div class="content">
		      <div style="text-align: center;"><h3>请选择要进行的操作</h3></div>
	
			<div class="clearfix">
				<div class="col-md-12 col-sm-12">
					<div style="text-align: center;">
					<div class="col-md-3 col-sm-3" ><a href="${pageContext.request.contextPath}/admin/goodsManage" class="active">商品管理</a></div>
					<div class="col-md-3 col-sm-3"><a href="${pageContext.request.contextPath}/admin/typeManage">类型管理</a></div>
					<div class="col-md-3 col-sm-3"><a href="${pageContext.request.contextPath}/admin/userManage">用户管理</a></div>
					<div class="col-md-3 col-sm-3"><a href="${pageContext.request.contextPath}/admin/orderManage">订单管理</a></div>
                    </div>
			    </div>
			</div> 
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