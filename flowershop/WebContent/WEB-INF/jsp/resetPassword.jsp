<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<title>重置密码</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
	</head>
	<body>	
    <div class="container">
	 	<div class="clearfix">
	 		
	 		<div class="col-md-12 column">
	 			<div class="page-header">
	 				<h3>修改密码</h3>
	 			</div>
	 		</div>
	 	</div>
    <form action="${pageContext.request.contextPath}/user/resetPassword" method="post"> 	
        <div class="row">
   	      <div class="col-md-12 column">
            <div class="col-md-4 col-sm-4">
            </div>
            <div class="col-md-4 col-sm-4">
               <div class="form-group">
       旧&nbsp;&nbsp;密&nbsp;&nbsp;码：<input type="password" name="oldpassword" class="form-control">
               </div>
             </div>
             <div class="col-md-4 col-sm-4"> 
             </div>
          </div>
         </div>
 
        <div class="row">
   	      <div class="col-md-12 column">
           <div class="col-md-4 col-sm-4">
         
           </div>
         <div class="col-md-4 col-sm-4">
          <div class="form-group">
新&nbsp;&nbsp;密&nbsp;&nbsp;码：<input type="password" name="newpassword" class="form-control">
          </div>
         </div>
       <div class="col-md-4 col-sm-4">
        
       </div>
   </div>
 </div>
 
 <div class="row">
   	<div class="col-md-12 column">
     <div class="col-md-4 col-sm-4">
         
     </div>
     <div class="col-md-4 col-sm-4">
        <div class="form-group">
        <input type="submit" value="提交" class="btn btn-default">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       	<input type="reset" value="重置" class="btn btn-default">
       </div>
     </div>
     <div class="col-md-4 col-sm-4">
        
     </div>
   </div>
 </div>
 </form>
 </div>
	<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>		
	
</body>
</html>