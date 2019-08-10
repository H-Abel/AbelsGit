<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>确认订单 </title>
		 <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
		 <style type="text/css">
		   .haha{
		      border:0;
		      background-color:transparent;
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
					 <a class="navbar-brand" href="#"><strong>网上商城</strong></a>
				</div>
				
					<ul class="nav navbar-nav navbar-right">
						<li>
							 <a href="#"></a>
						</li>
						<li>
							<a href="${pageContext.request.contextPath }/user/loginOut">注销</a>
						</li>
						<li>
							<a href="${pageContext.request.contextPath }/cart/selectCart"><span class="glyphicon glyphicon-shopping-cart">购物车</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
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

	<!--头部导航栏结束-->
	<div class="container">
		<div class="row clearfix">
		<div class="col-md-12 column">
			<div class="page-header">
				<span>订单信息<span class="badge"></span></span>
			</div>
		</div>
	    </div>
	    <!--全部商品结束-->
	    <div class="clearfix">
	    	<div class="col-md-12 column">
	    		<table class="table">
	    			<thead>
	    				<tr>
	    					<th>商品信息</th>
	    					<th></th>
	    					<th>单价</th>
	    					<th>购买数量</th>
	    					<th>小计</th>
	    				</tr>
	    			</thead>
	    			<tbody>
	    				<div class="col-md-12 column">
	    				<c:forEach items="${cartList}" var="cartgoods">
	    				<tr>
	    						
	    						<td style="width:100px;"><img src="${pageContext.request.contextPath}/logos/${cartgoods.gpic}" width="80px" height="80px"/></td>
	    						<td>${cartgoods.gname}</td>   					
	    					    <td>${cartgoods.gnprice}</td>	    					    					
	    					    <td>${cartgoods.shoppingnum}</td>	    					
	    						<td>${cartgoods.smallsum}</td>	    					
	    				</tr>
	    				</c:forEach>
	    				</div>
	    			</tbody>
	    		</table>
	    	</div>
	    </div>

	<!--购物车列表结束-->
	<!-- 结账开始 -->
			
	<form action="${pageContext.request.contextPath}/order/orderSubmit" method="post">	
		<div class="clearfix">
		<div class="col-md-12 column">		
				 <div class="navbar-right">
				<strong>应付款:</strong>&nbsp;<input type="text" value="${total}" name="amount" readonly="readonly" class="haha">元
				</div>		
		</div>
		</div>
	<!-- 结账结束 -->
	<div style="text-align:center">
	    <input type="submit" class="btn btn-default" value="提交订单">
	</div>
	</form> 
	
	<!-- 尾部下划线 -->
	<div class="row clearfix">
	   <div class="col-md-12 column">
	      <div class="page-header"></div>
	   </div>
	</div>
</div>
<!-- 尾部开始 -->
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