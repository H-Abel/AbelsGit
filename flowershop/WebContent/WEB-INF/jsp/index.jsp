<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>未登录商城</title>
         <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
        <style type="text/css">
        	.pc_imgBox{
        	display: block;
            height: 400px;
            width: 100%;
            background-size: cover;
            background-position:  center;
            background-repeat: no-repeat;
           }
           
          
           .title{
           	 font-family: courier;
           	 background-color: #e0f7fa;
           	 margin-top: 0px;
           	 margin-bottom: 0px;
             
           
           }
           .body{
           	 margin: 0px;
           }
           .foot{
           	 text-align: center;
           }
        </style>
	</head>
	<body>
	<!-- 导航栏 -->
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
							 <a href="${pageContext.request.contextPath}/user/toLogin">登录</a>
						</li>
						<li>
							<a href="${pageContext.request.contextPath}/user/toRegister">注册</a>
						</li>
						<li>
							<a href="${pageContext.request.contextPath}/cart/selectCart"><span class="glyphicon glyphicon-shopping-cart"></span>购物车&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
						</li>
					</ul>
					<form class="navbar-form navbar-right" role="form" action="${pageContext.request.contextPath}/goods/search" method="post">
						<div class="form-group">
							<input class="form-control" type="text" name="key"/>
						</div> <button class="btn btn-default" type="submit"><span class="glyphicon glyphicon-search"></span>搜索</button>
					</form>
					</nav>
				</div>
		</div>
	<!-- 导航栏结束 -->
	
	<div class="container">
	
		<!--轮播 -->
	<div class="row clearfix">
		<div class="col-md-12 column">
			<div class="carousel slide" id="mycarousel">
				<!--轮播指标 -->
				<ol class="carousel-indicators">
					<li class="active" data-target="#mycarousel" data-slide-to="0">
					</li>
					<li data-target="#mycarousel" data-slide-to="1">
					</li>
					<li data-target="#mycarousel" data-slide-to="2">
					</li>
				</ol>
				<!-- 轮播（Carousel）项目 -->
				<div class="carousel-inner">
					<div class="item active">
						<span class="pc_imgBox">
						<img alt="网上花店" src="../img/lo3.jpg" />
					    </span>
						<div class="carousel-caption">
							
						</div>
					</div>
					<div class="item">
						<span class="pc_imgBox">
						<img alt="网上花店" src="../img/lo.jpg" />
						</span>
						<div class="carousel-caption">
						
						</div>
					</div>
					<div class="item">
						<span class="pc_imgBox">
						<img alt="网上花店" src="../img/lo4.jpg" />
						</span>
						<div class="carousel-caption">
							
						</div>
					</div>
				</div> 
				<!-- 轮播（Carousel）导航 -->
				<a class="left carousel-control" href="#mycarousel" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a> 
				<a class="right carousel-control" href="#mycarousel" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
			</div>
		</div>
	</div>
	<!-- 轮播结束 -->
	
	<!--页头-手机-->
	<div class="row clearfix">
		<div class="col-md-12 column">
			<div class="page-header">
				<h3>
					手机专区<small>Phone</small>
				</h3>
			</div>
		</div>
	</div>

	<!--
                 商品展示
    -->
    <div class="row clearfix">
		<div class="col-md-12 column">
			<div class="row">
			<c:forEach items="${list1}" var="l1">
			
				<div class="col-md-3 col-sm-3">
					<div class="thumbnail">
						<img alt="图片无法加载" src="${pageContext.request.contextPath}/logos/${l1.gpic}" />
						<div class="caption">
							<h3>
								${l1.gname}
							</h3>
							<p>
								${l1.gdescribe}<br>
								<span style="text-decoration:line-through">原价:￥${l1.goprice}</span>,现价:￥${l1.gnprice}
							</p>
							<p>
								<a class="btn btn-primary" href="${pageContext.request.contextPath}/cart/selectCart">加入购物车</a>
							</p>
						</div>
					</div>
				</div>
			</c:forEach>
		
			</div>
		</div>
	</div>
	
	<!--页头-食品-->
	<div class="row clearfix">
		<div class="col-md-12 column">
			<div class="page-header">
				<h3>
					食品专区<small>Food</small>
				</h3>
			</div>
		</div>
	</div>
	<!--
                 商品展示2
    -->
    <div class="row clearfix">
		<div class="col-md-12 column">
			<div class="row">
			<c:forEach items="${list2}" var="l2">
				<div class="col-md-3 col-sm-3">
					<div class="thumbnail">
						<img alt="图片无法加载" src="${pageContext.request.contextPath}/logos/${l2.gpic}" />
						<div class="caption">
							<h3>
								${l2.gname}
							</h3>
							<p>
								${l2.gdescribe}<br>
								<span style="text-decoration:line-through;">原价：￥${l2.goprice}</span>现价：￥${l2.gnprice}
							</p>
							<p>
								 <a class="btn btn-primary" href="${pageContext.request.contextPath}/cart/selectCart">加入购物车</a>
							</p>
						</div>
					</div>
				</div>
				</c:forEach>		
		</div>
	</div>
	</div>
	
	<!--页头-服装-->
	<div class="row clearfix">
		<div class="col-md-12 column">
			<div class="page-header">
				<h3>
					服装专区<small>Close</small>
				</h3>
			</div>
		</div>
	</div>
	
	<!--
                 商品展示3
    -->
    <div class="row clearfix">
		<div class="col-md-12 column">
			<div class="row">
			<c:forEach items="${list3}" var="l3">
				<div class="col-md-3 col-sm-3">
					<div class="thumbnail">
						<img alt="图片无法加载" src="${pageContext.request.contextPath}/logos/${l3.gpic}" />
						<div class="caption">
							<h3>
								${l3.gname}
							</h3>
							<p>
								${l3.gdescribe}<br>
								<span style="text-decoration:line-through;">原价：￥${l3.goprice}</span>现价：￥${l3.gnprice}
							</p>
							<p>
								  <a class="btn btn-primary" href="${pageContext.request.contextPath}/cart/selectCart">加入购物车</a>
							</p>
						</div>
					</div>
				</div>
				</c:forEach>		
		</div>
	</div>
	</div>

<!--尾部-->
<div class="row clearfix">
		<div class="col-md-12 column">
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
</div>
 <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>



</body>
</html>