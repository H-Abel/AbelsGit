<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<title>添加用户</title>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
		 <link rel="stylesheet" href="https://unpkg.com/bootstrap-table@1.14.2/dist/bootstrap-table.min.css">
		 <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
	     <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
  <div class="container">
     		<div class="clearfix">
	 		<div class="col-md-12 column">
	 			<div class="page-header">
	 				<h3>添加用户</h3>
	 			</div>
	 		</div>
	 	    </div>
	 	    <!-- 页头结束 -->
	 	    <div class="col-md-12 column">
	 	    	<div class="col-md-4" style="width: 20%;"></div>
	 	    	<div class="col-md-4" style="width: 60%;">
				    		            <form:form action="${pageContext.request.contextPath}/admin/addUser" method="post" role="form" modelAttribute="user" >
				    		              <div class="form-group">
				    		                 <label for="name">商品名称：</label>
				    		                 <form:input class="form-control" type="text" name="name" placeholder="请输入用户名" path="name"/>
				    		                
				    		              </div>
				    		              <div class="row">
				    		              <div class="col-md-6">
				    		                 <label for="password">密码：</label>
				    		                 <form:input class="form-control" type="text" name="password" path="password"/>
				    		               </div>
				    		              </div>

				    		              <div class="text-right">
				    		                 <input type="submit" class="btn btn-primary" value="确定"/>
				    		                 <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				    		              </div>
				    		            </form:form>
				    		            </div>
				    		            <div class="col-md-4" style="width: 20%;"></div>
				    		            
			</div>

     </div>


	<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
	<script src="https://unpkg.com/bootstrap-table@1.14.2/dist/bootstrap-table.min.js"></script>
</body>
</html>