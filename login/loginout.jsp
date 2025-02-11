<%-- 
    Document   : loginout
    Created on : 5 feb. 2025, 16:17:12
    Author     : Hebert Lopez
--%>

<% 
session.invalidate(); //destroy session
response.sendRedirect("inicio.jsp");
%>

