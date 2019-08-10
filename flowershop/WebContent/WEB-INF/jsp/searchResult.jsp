<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>搜索结果</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
		 
		<style type="text/css">
		   .foot{
		      text-align:center;
		   }
		</style>
</head>
<body>
<div class="row clearfix">
		<div class="col-md-12 column">
			<!--role属性标识这是一个导航容器-->
			<nav class="navbar navbar-default" role="navigation">
				<div class="navbar-header">
					 <button class="navbar-toggle" type="button" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"> 
					 	<span class="sr-only">Toggle navigation</span>
					 	<span class="icon-bar"></span>
					 	<span class="icon-bar"></span>
					 	<span class="icon-bar"></span>
					 </button> 
					 <a class="navbar-brand" href="#">网上商城</a>
				</div>
				
					<ul class="nav navbar-nav navbar-right">
						<li>
							 <a href="${pageContext.request.contextPath}/user/indexLogin">登录</a>
						</li>
						<li>
							<a href="${pageContext.request.contextPath}/user/indexRegister">注册</a>
						</li>
						<li>
							<a href="#"><span class="glyphicon glyphicon-shopping-cart"></span>购物车&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
						</li>
					</ul>
					<form class="navbar-form navbar-right" role="search" action="${pageContext.request.contextPath}/goods/search" method="post">
						<div class="form-group">
							<input class="form-control" type="text" name="key"/>
						</div> <button class="btn btn-default" type="submit"><span class="glyphicon glyphicon-search"></span>搜索</button>
					</form>
					</nav>
				</div>
		</div>
		<!-- 导航栏结束 -->
		
	
		<!-- 显示列表 -->
		<div class="container">
		<div class="row">
			<c:forEach items="${searchList}" var="sr">
				<div class="col-md-4 col-sm-4">
					<div class="thumbnail">
						<img alt="300x200" src="D:/javaeeProject/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/flowershop/logos/${sr.gpic}"/>
						<div class="caption">
							<h3>
								${sr.gname}
							</h3>
							<p>
								${sr.gdescribe},${sr.gnprice}
							</p>
							<p>
								  <a class="btn" href="${pageContext.request.contextPath}/cart/addCart">加入购物车</a>
							</p>
						</div>
					</div>
				</div>
		  </c:forEach>	
		</div>
		</div>	
		<!-- 显示列表结束 -->
		<!--尾部-->
<div class="row clearfix">
		<div class="col-md-12 col-sm-12 column">
			<div class="page-header">
			
			</div>
		</div>
</div>

<footer class="footer navbar-fix-bottom">
	<div class="container">
		<div class="row-content col-md-3 col-sm-3">
			<h4>客户服务</h4>
			<ul class="list-unstyled">
			<li><a href="#">订单查询</a></li>
			<li><a href="#">隐私条款</a></li>
			<li><a href="#">常见问题</a></li>
			<li><a href="#">售后服务</a></li>
		</ul>
		</div>
		<div class="row-content col-md-3 col-sm-3">
			<h4>热门咨询</h4>
			<ul class="list-unstyled">
			<li><a href="#">购物流程</a></li>
			<li><a href="#">配送方式</a></li>
			<li><a href="#">配送范围</a></li>
			<li><a href="#">订购演示</a></li>
		</ul>
		</div>
		<div class="row-content col-md-3 col-sm-3">
			<h4>线下直营</h4>
			<ul class="list-unstyled">
			<li><a href="#">北京店</a></li>
			<li><a href="#">深圳店</a></li>
			<li><a href="#">武汉店</a></li>
			<li><a href="#">更多城市</a></li>
		</ul>
		</div>
		<div class="row-content  col-md-3 col-sm-3">
			<h4>联系我们</h4>
			<ul class="list-unstyled">
			<li><span>订购热线：8888888</span></li>
			<li><span>在线客服</span></li>
			<li><span>7*24小时在线订购</span></li>
			<li><span>e-mail：888888@qq.com</span></li>
		</ul>
		</div>
	</div>
	
	<div class="foot">
		<p>IPC经营许可证：324-234234|32452342-345&nbsp;|公网备号：34534-345234-333</p>
		<p>网上商城</p>
	</div>
	<!--尾部下划线-->
	<div class="row clearfix">
		<div class="col-md-12 column">
			<div class="page-header">
			
			</div>
		</div>
</div>
</footer>

 <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
		

</body>
</html>