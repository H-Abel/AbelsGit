<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>管理员登录</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
	<style type="text/css">
		.mid{
			
			height: 600px;
			
			margin-top: 0px;
			background: url(../img/bg.jpg);
			background-repeat: no-repeat;
			background-size: 100% ;
			
			
		}
		.foot{
			text-align: center;
		}
		.min{
		    position: absolute;
		  
		  
		    margin-top: 250px;
		    margin-left: 1000px;
		}
	</style>
</head>
<body>
<div class="container">
	 	<div class="clearfix">
	 		<div class="col-md-12 column">
	 			<div class="page-header">
	 				<h3>管理员登录</h3>
	 			</div>
	 		</div>
	 	</div>
</div>

<div class="mid">
	<div class="min">
	<form action="${pageContext.request.contextPath}/admin/adminLogin" method="post">
		<fieldset>
		<legend>adminLogin</legend>
	    <p>
		<label>用户名：</label>
		<input type="text" name="adminId" id="name"/>
		</p>
		<p>
		<label>密&nbsp;&nbsp;&nbsp;&nbsp;码：</label>
		<input type="password" name="adminPassword" />
		</p>
		<p>
		<input type="submit" value="login"/>
		</p>
		</fieldset>
	</form>
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
    <script type="text/javascript">
         //用josn格式校验数据
    </script>
	<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>		
	
</body>
</html>