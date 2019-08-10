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
 
	     <title>商品管理</title>
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
				    		<a class="btn btn-default"  href="${pageContext.request.contextPath}/admin/toAddGoods"><spring:message code="add"></spring:message></a>
				    	</div>
				    		<table id="mytab" class="table table-bordered table-hover" data-toggle="table"></table>
				    	<!-- 
				    	<table id="mytab" class="table table-bordered table-hover">
				    	    <thead>
				    		<tr>
				    		  <th>id</th>
				    		  <th>商品名</th>
				    		  <th>图片</th>
				    		  <th>原价</th>
				    		  <th>现价</th>
				    		  <th>描述</th>
				    		  <th>库存</th>
				    		  <th>商品类型id</th>
				    		  <th>操作</th>
				    		</tr>
				    		</thead>
				            <tbody>
				            <c:forEach items="${list}" var="l">
				    	    <tr>
				    		  <td>${l.id}</td>
				    		  <td>${l.gname}</td>
				    		  <td>${l.gpic }</td>
				    		  <td>${l.goprice }</td>
				    		  <td>${l.gnprice }</td>
				    		  <td>${l.gdescribe }
				    		  <td>${l.gstore }</td>
				    		  <td>${l.goodstype_id}</td>
				    		 <td> 
				    		    <a href="${pageContext.request.contextPath }/admin/deleteAGoods?id=${l.id}" class="btn btn-default">删除</a>
				    		    <a href="${pageContext.request.contextPath}/admin/toUpdateAGoods?id=${l.id}" class="btn btn-default">修改</a>  
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
			
	<script>
   $("#mytab").bootstrapTable({ // 对应table标签的id
	  method:'post',
	  contentType: "application/x-www-form-urlencoded",
      dataType:"json",
      url: "${pageContext.request.contextPath}/admin/getGoodsList", // 获取表格数据的url
      cache: false, // 设置为 false 禁用 AJAX 数据缓存， 默认为true
      striped: true,  //表格显示条纹，默认为false
      sortable:true,
     // dataField:"res",
      pagination: true, // 在表格底部显示分页组件，默认false
      pageList: [10, 20], // 设置页面可以显示的数据条数
      pageSize: 10, // 页面数据条数
      showRefresh:true,
      search:true,
      showHeader:true,
      showFooter:true,
     // queryParamsType:'limit',
     // queryParams:queryParams,
      pageNumber: 1, // 首页页码
      sidePagination: 'client', // 设置为前端分页     
     // 服务器端分页指的是根据设定的每页记录数和当前要显示的页码，发送数据到服务器进行查询
      locale:"zh-CN",
      queryParams:function (params) {  //请求服务器数据时发送的参数，可以在这里添加额外的查询参数，返回false则终止请求

          return {
           //  limit:params.limit, // 每页要显示的数据条数
             //offset:params.offset, //页码
             // page:(params.offset/params.limit)+1,
              sort: params.sort, // 要排序的字段
              sortOrder: params.order // 排序规则
              //当前页码，采用服务器端所需参数
             // dataId: $("#dataId").val() // 额外添加的参数
          }
       
      },
      sortName: 'id', // 要排序的字段
      sortOrder: 'asc', // 排序规则
      columns: [
           {
              field: 'id', // 返回json数据中的name
              title: 'id', // 表格表头显示文字
              align: 'center', // 左右居中
              valign: 'middle', // 上下居中
              sortable:true
          }, {
              field: 'gname',
              title: '名称',
              align: 'center',
              valign: 'middle',
              sortable:true
          }, {
              field: 'gpic',
              title: '图片',
              align: 'center',
              valign: 'middle',
          },{
        	field:'goprice',
        	title:'原价',
        	align:'center',
        	valign:'middle',
        	sortable:true
          },{
        	field:'gnprice',
        	title:'现价',
        	align:'center',
        	valign:'middle',
        	sortable:true
          },{
        	field:'gdescribe',
        	title:'描述',
        	align:'center',
        	valign:'middle',
          },{
        	field:'gstore',
        	title:'库存',
        	align:'center',
        	valign:'middle',
        	sortable:true
          },{
        	field:'goodstype_id',
        	title:'类型',
        	align:'center',
        	valign:'middle',
        	sortable:true
          },{
              title: "操作",
              align: 'center',
              valign: 'middle',
              width: 160, // 定义列的宽度，单位为像素px
              formatter: option
          }
      ],
      onLoadSuccess: function(){  //加载成功时执行
            console.info("加载成功");
      },
      onLoadError: function(){  //加载失败时执行
            console.info("加载数据失败");
      }
      
});
   
   function option(value, row, index){
	   var htm = '<a href="javascript:;" class="btn btn-default" '
           + ' onclick="delUser('+row.id+')">删除</a><a href="javascript:;"  class="btn btn-default" onclick="updUser('
           + value + ')">修改</a>'
         return htm;
   }
   
   function delUser(id){
	   var message=confirm("删除？"+id);
	   if(message){
		   $.ajax({
			   url:'${pageContext.request.contextPath }/admin/deleteAGoods?id='+id,
			   type:'get',
			   success:function(data){
				  // alter("删除成功");
				   $("#mytab").bootstrapTable('refresh');
			   },
			   error:function(data){
				   //alter("删除成功");
			   },
		   })
	   }
   }
   
   
</script>	

	</body>
</html>