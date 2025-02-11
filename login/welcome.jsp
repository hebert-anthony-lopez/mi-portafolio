<%-- 
    Document   : welcome
    Created on : 5 feb. 2025, 16:20:20
    Author     : Hebert Lopez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bienvenido: <%=session.getAttribute("login")%></title>
    </head>
    <body>
        
        <ul>
        <li><a href="http://onlyxscript.blogspot.in/2018/01/login-and-register-using-jsp-mysql.html">Back to Toturial</a></li>
    </ul>

    <div class="main-content">
	
	<center>
	
	<%
	if(session.getAttribute("login")==null || session.getAttribute("login")==" ") //check condition unauthorize user not direct access welcome.jsp page
	{
		response.sendRedirect("inicio.jsp"); 
	}
	%>
	
	<h1> Bienvenido, <%=session.getAttribute("login")%> </h1>

	<h2><a href="loginout.jsp">Logout</a></h2>
    
	</center>
		
    </div>
    </body>
</html>
