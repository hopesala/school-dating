<%@ page contentType="text/html;charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import ="com.ht.servlet.*"%>
<%@ page import="java.sql.*"%>
<!-- 新 Bootstrap 核心 CSS 文件 -->
<link href="http://apps.bdimg.com/libs/bootstrap/3.0.3/css/bootstrap.min.css" 

rel="stylesheet">

<!-- 可选的Bootstrap主题文件（一般不使用） -->
<script src="http://apps.bdimg.com/libs/bootstrap/3.0.3/css/bootstrap-

theme.min.css"></script>

<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="http://apps.bdimg.com/libs/jquery/2.0.0/jquery.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="http://apps.bdimg.com/libs/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'Mybook.jsp' starting page</title>
    
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
  <STYLE TYPE="text/css">
<!-- 
BODY {background-image: URL(image/spring.jpg); 
background-position: center; 
background-repeat: no-repeat; 
background-attachment: fixed;} 
--> 
</STYLE>
  <div style="margin:0 auto;width:700px;">
  <table class="table"><br>
  <caption><font color="red" size="50">查询结果</font></caption>
  <thead>
  <tr>
  <th>日期</th>
  <th>时间</th>
  <th>事件</th>
  <th>总人数</th>
  <th>已预约人数</th>
  <th>老师姓名</th>
  <th>操作</th>
  </tr>
  </thead>
    <%
     dbconnection d = new dbconnection();
     Connection t = d.getConnection();
	 Statement stmt,stmt1,stmt2;
	 stmt=null;
	 	try {
			stmt = t.createStatement();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	 stmt1=null;
	 	try {
			stmt1 = t.createStatement();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	 stmt2=null;
	 	try {
			stmt2 = t.createStatement();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	 Student st=(Student)request.getSession().getAttribute("account");
	 String studentid=st.getStudentid();
	 String teachertimeid=null;
	 ResultSet rs=null;
	 ResultSet rs1=null;
	  ResultSet rs2=null;
	 String sql="select * from studenttime where studentid=\""+studentid+"\";";
		try {
		rs=stmt.executeQuery(sql);
		while(rs.next())
		{
		%>
		<tr>
		<% 
			teachertimeid=rs.getString(2);
		    String sql1="select * from teachertime where teachertimeid=\""+teachertimeid+"\";"; 
		try {
		rs1=stmt1.executeQuery(sql1);
			
		if(rs1.next())
		{	   
	        %>
	   <td><%=rs1.getString(8)+'.'+rs1.getString(9)+'.'+rs1.getString(2) %></td>
       <td><%=rs1.getString(6) %></td>
       <td><%if(rs1.getString(7)==null) {
       out.print(rs1.getString(10));
       } else {
          out.print(rs1.getString(7));
         }
         %></td>        
          <td><%=rs1.getString(4) %></td>
           <td><%=rs1.getString(5) %></td>
              
		<% 
		
		
		
		
		String sql2="select * from teacher where teacherid=\""+rs1.getString(3)+"\";"; 
		try {
		rs2=stmt2.executeQuery(sql2);
		if(rs2.next())
		{	   
	    %>		    
		 <td><%=rs2.getString(4) %></td>
		 <td><a href="Mybookdele.jsp?name=<%=teachertimeid%>"> 取消</a> </td> 
		 </tr>
		<% 	
		}
		}catch (Exception E) {
		E.printStackTrace();	
	     }
		}
		}catch (Exception E) {
		E.printStackTrace();	
	     }
		}
		}catch (Exception E) {
		E.printStackTrace();	
	     }
	     %>
	     </table>
	    <div style="margin:0 auto;width:200px;">
   <button type="button" class="btn btn-primary btn-lg" onclick="window.location.href='success.jsp'" style="width: 216px; ">
      返回登录页面
   </button>
   </div>
	     </div>
  </body>
</html>
