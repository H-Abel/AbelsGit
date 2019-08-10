<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
		<meta charset="UTF-8">
		<title>个人中心</title>
		 <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
	    <style type="text/css">
	    	.col-sub{
	    		width: 150px;
	    		background-color:#f8f8f8;
	    		padding: 20px;
	    		margin-top: 40px;
	    		float: left;
	    	}
	    	.mt-menu-tree dd{
	    		list-style: none;
	    	}
	    	.base-info{
	    		float: left;
	    		padding-top: 15px;
	    		padding-left: 15px;
	    		padding-bottom: 10px;
	    		width: 39%;
	    	}
	    	.user-stuff{
	    		float: right;
	    		list-style: none;
	    		position: relative;
	    		width: 61%;
	    	}
	    	.main{
	    		float: right;
	    		margin-top: 40px;
	    		width: 940px;
	    		padding: 20px;
	    	}
	    	.li-1{
	    		float: left;
	    		width: 33%;
	    		padding-top: 15px;
	    		padding-left: 15px;
	    		text-align: center;
	    	}
	    	.li-2{
	    		float: right;
	    		width: 33%;
	    		padding-top: 15px;
	    		padding-left: 15px;
	    		text-align: center;
	    	}
	    	.li-3{
	    		float: right;
	    		width: 33%;
	    		padding-top: 15px;
	    		padding-left: 15px;
	    		text-align: center;
	    	}
	    	.name{
	    		float: right;
	    		margin-top: -3px;
	    		margin-left: 15px;
	    		width: 70%;
	    	}
	    	.my-count{
	    		margin-top:0px;
	    		height: 52px;
	    		padding: 0px;
	    		border-style: solid;
	    		border-width: 1px;
	    		border-color: gainsboro;
	    		position: relative;
	    		top: -20px;
	    	} 
	    	.lil{
	    		width: 20%;
	    		list-style: none;
	    		float: left;
	    		text-align: center;
	    		border-style: none solid none none;
	    		border-width: 1px;
	    	    margin-top: 15px;
	    	    border-color: gainsboro;
	    	}
	    	.you-like{
	    		position: relative;
	    		margin-top: -15px;
	    	}
	    	a{
	    		color: #333;
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
					 <a class="navbar-brand" href="#"><strong>网上商城</strong><small></small></a>
				</div>
				
					<ul class="nav navbar-nav navbar-right">
						<li>
							 <a href="#"></a>
						</li>
						<li>
							<a href="${pageContext.request.contextPath}/user/loginOut">注销</a>
						</li>
						<li>
							<a href="${pageContext.request.contextPath}/cart/selectCart"><span class="glyphicon glyphicon-shopping-cart"></span>购物车&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
						</li>
					</ul>
				
					<form class="navbar-form navbar-right" role="search" method="post" action="${pageContext.request.contextPath}/goods/search">
						<div class="form-group">
							<input class="form-control" type="text" name="key"/>
						</div> <button class="btn btn-default" type="submit"><span class="glyphicon glyphicon-search"></span>搜索</button>
					</form>
				</nav>
			</div>	
		
		</div>
	    </div>
	
	<!--头部导航栏结束-->
		<div class="container">
			<div class="clearfix">
				<div class="col-md-12">
					<div class="content">
						<div class="col-sub">
							<aside class="mt-menu">
								<div class="mt-menu-tree">
									<dl class="mt-menu-item">
										<dt class="fs14">个人中心</dt>
										<dd><a href="${pageContext.request.contextPath }/order/myOrders">我的订单</a></dd>
										<dd><a href="#">我的收藏</a></dd>
										<dd><a href="#">我的积分</a></dd>
										<dd><a href="#">评价管理</a></dd>
										<dd><a href="#">我的足迹</a></dd>
									</dl>
									<dl class="mt-menu-item">
										<dt class="fs14">账户管理</dt>
										
										<dd><a href="${pageContext.request.contextPath }/user/toResetPassword">修改密码</a></dd>	
									</dl>
								</div>
							</aside>
						</div>
						<div class="main">
							<div class="user-info">
								<div class="navbar navbar-default">
									<div class="base-info">
										<img src="${pageContext.request.contextPath}/img/lo3.jpg"style="width: 50px;height: 30px;" />
									    <div class="name">${user.name}</div>
									</div>
									<ul class="user-stuff">
										<li class="li-1">我的收货地址</li>
										<li class="li-2">我的优惠信息</li>
										<li class="li-3">我的支付宝</li>
									</ul>
									
								</div>
								<div class="my-count">
									<ul style="padding: 0px; margin: 0px;">
										<li class="lil"><a>待付款</a></li>
										<li class="lil"><a>待发货</a></li>
										<li class="lil"><a>待收货</a></li>
										<li class="lil"><a>待评价</a></li>
										<li class="lil"><a>退款</a></li>
									</ul>
								</div>
							</div>
							<div class="you-like">
								<!--页头--->
	  <div class="row clearfix">
		<div class="col-md-12 column">
			<div class="page-header">
				<h4>
					猜你喜欢
				</h4>
			</div>
		</div>
	</div>

	<!--
                 商品展示
    -->
   <div class="row clearfix">
		<div class="col-md-12 column">
			<div class="row">
			<c:forEach items="${list}" var="l" begin="1" end="18" step="3">
				<div class="col-md-4 col-sm-4">
					<div class="thumbnail">
						<img alt="图片无法加载" src="${pageContext.request.contextPath}/logos/${l.gpic}" />
						<div class="caption">
							<h3>
								${l.gname}
							</h3>
							<p>
								${l.gdescribe}<br>
								<span style="text-decoration:line-through;">原价：￥${l.goprice}</span>现价：￥${l.gnprice}
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
						</div>
					</div>
				</div>
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
		<div class="row-content  col-md-3">
			<h4>联系我们</h4>
			<ul class="list-unstyled">
			<li><span>订购热线：8888888</span></li>
			<li><span>在线客服</span></li>
			<li><span>7*24小时在线订购</span></li>
			<li><span>e-mail：888888@qq.com</span></li>
		</ul>
		</div>
	</div>
	
	<div class="foot" style="text-align: center;">
		<p>IPC经营许可证：324-234234|32452342-345&nbsp;|公网备号：34534-345234-333</p>
		<p>中国鲜花领先品牌，鲜花速递专家</p>
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