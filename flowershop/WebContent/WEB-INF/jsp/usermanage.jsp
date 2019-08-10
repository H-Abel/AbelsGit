<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 引入bootstrap样式 -->
<link href="https://cdn.bootcss.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
<!-- 引入bootstrap-table样式 -->
<link href="https://cdn.bootcss.com/bootstrap-table/1.11.1/bootstrap-table.min.css" rel="stylesheet">

<!-- jquery -->
<script src="https://cdn.bootcss.com/jquery/2.2.3/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

<!-- bootstrap-table.min.js -->
<script src="https://cdn.bootcss.com/bootstrap-table/1.11.1/bootstrap-table.min.js"></script>
<!-- 引入中文语言包 -->
<script src="https://cdn.bootcss.com/bootstrap-table/1.11.1/locale/bootstrap-table-zh-CN.min.js"></script>
	     
	     <title>用户管理</title>
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
				    		<a class="btn btn-default"  href="${pageContext.request.contextPath}/admin/toAddUser">添加用户</a>
				    	</div>
				    	<table id="mytab" class="table table-bordered table-hover" data-toggle="table"></table>
				    	<!-- 
				    	<table id="mytab" class="table table-bordered table-hover">
				    	    <thead>
				    		<tr>
				    		  <th style="width:25%;">id</th>
				    		  <th style="width:25%;">用户名</th>
				    		  <th style="width:25%;">密码</th>
				    		  <th style="width:25%;">操作</th>
				    		</tr>
				    		</thead>
				            <tbody>
				            <c:forEach items="${list}" var="l">
				    	    <tr>
				    		  <td>${l.id}</td>
				    		  <td>${l.name}</td>
				    		  <td>${l.password}</td>
				    		
				    		 <td> 
				    		    <a href="${pageContext.request.contextPath }/admin/deleteAUser?id=${l.id}" class="btn btn-default">删除</a>
				    		    <a href="${pageContext.request.contextPath}/admin/toUpdateUser?id=${l.id}" class="btn btn-default">修改</a>  
				    		  </td>
				    		</tr>
				            </c:forEach>
				    	    </tbody>
				    	</table>
				    	 -->               
				    </div>
			    </div>
			</div>    
	</div>	
	<script type="text/javascript">
	   $("#mytab").bootstrapTable({
		   method:'post',
		   contentType: "application/x-www-form-urlencoded",
		   dataType:"json",
		   url:"${pageContext.request.contextPath}/admin/getUserList",
		   cache:false,
		   striped:true,
		   sortable:true,
		   pagination:true,
		   pageList:[10,20],
		   pageSize:10,
		   showRefresh:true,
		   search:true,
		   pageNumber: 1,
		   sidePagination:'client',
		   locale:"zh-CN",
		   queryParams: function (params){
			   return {
				  // limit:params.limit,
				  // offset:params.offset,
	             sort: params.sort, // 要排序的字段
                 sortOrder: params.order // 排序规则
			   }
		   },
		   sortName: 'id', // 要排序的字段
		   sortOrder: 'asc', // 排序规则
		   columns:[
			{
			   title:'id',
			   field:'id',
			   align:'center',
			   valign:'middle',
			   sortable:true
		   },{
			 title:'姓名',
			 field:'name',
			 align:'center',
			 valign:'middle',
			 sortable:true
		   },{
			   title:'密码',
			   field:'password',
			   align:'center',
			   valign:'middle',
			   sortable:true
		   },{
			   title:'操作',
			   align:'center',
			   valign:'middle',
			   width:160,
			   formatter: function (value, row, index) {
	                  return '<button class="btn btn-primary btn-sm" οnclick="del(\'' + row.stdId + '\')">删除</button>';
	              }
		   }
		   ],
		   
		   onLoadSuccess: function(){  //加载成功时执行
	            console.info("加载成功");
	      },
	      onLoadError: function(){  //加载失败时执行
	            console.info("加载数据失败");
	      }
		   
	   });
	</script>
	</body>
</html>