<%@ page contentType="text/html;charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import ="com.ht.servlet.*"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>我的主页</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
<body>
  <jsp:include  page="MyJsp.jsp"/>

<hr>
     <%Teacher te=(Teacher)session.getAttribute("teacher");
  if(te==null)
	 {
	 %>
	 <div id="myAlert" class="alert alert-warning">
   <a href="#" class="close" data-dismiss="alert">&times;</a>
   <strong>警告！</strong>教师端未登录
   </div>
	 
	 <input type=button value=后退 onclick="window.history.go(-1)">
	 <%
	 }
	 else
	 {
	 %>

     <div style="margin:0 auto;width:600px;">
  <span class="glyphicon glyphicon-hand-right" style="color: rgb(200, 200, 200); font-size: 50px;"> 欢迎您【<%=te.getName() %>】老师</span>
   </div>
     <hr>
   <br>
   <div style="margin:0 auto;width:400px;">
   <span class="glyphicon glyphicon-plus" style="color: rgb(200, 160, 189); font-size: 40px;"></span>
    <button type="button" class="btn btn-primary btn-lg" onclick="window.location.href='Addbook.jsp'" style="width: 230px; ">
      添加空挡
   </button>
   <br>
   <span class="glyphicon glyphicon-list-alt" style="color: rgb(300, 104, 141); font-size: 40px;"></span>
   <button type="button" class="btn btn-success btn-lg" onclick="window.location.href='Mybookt.jsp'" style="width: 230px; ">
      我的空挡
   </button>
   <br>
   <span class="glyphicon glyphicon-chevron-left" style="color: rgb(400, 200, 141); font-size: 40px;"></span>
   <button type="button" class="btn btn-warming btn-lg" onclick="window.location.href='Logint.jsp'" style="width: 230px; ">
      返回
   </button>

   </div>
   
 
<%} %>
  </body>
</html>
