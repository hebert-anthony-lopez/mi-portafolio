<%-- 
    Document   : inicio
    Created on : 4 feb. 2025, 17:06:52
    Author     : Hebert Lopez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>  

<%
    if (session.getAttribute("login") != null) //check login session user not access or back to index.jsp page
    {
        response.sendRedirect("../virtualBiblio/portal.jsp");
    }
%>

<%
    try {
        //load driver //create connection
        Class.forName("com.mysql.jdbc.Driver"); //load driver //create connection
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bdbiblioteca", "root", "");

        //create statement
        PreparedStatement pstmt = null; //create statement
        //sql select query 
        pstmt = con.prepareStatement("select * from usuario where username=? AND password=?");

        if (request.getParameter("btn_login") != null) //check login button click event not null
        {
            String usuariS, password;
            usuariS = request.getParameter("txt_username"); //txt_email
            password = request.getParameter("txt_password"); //txt_password

            pstmt.setString(1, usuariS);
            pstmt.setString(2, password);
            try (ResultSet rs = pstmt.executeQuery()) //execute query and store in resultset object rs.
            {
                if (rs.next()) {
                    String dbusuariS, dbpassword;
                    dbusuariS = rs.getString("username");
                    dbpassword = rs.getString("password");

                    if (usuariS.equals(dbusuariS) && password.equals(dbpassword)) {
                        session.setAttribute("login", dbusuariS); //session name is login and store fetchable database email address
                        response.sendRedirect("../virtualBiblio/portal.jsp"); //after login success redirect to welcome.jsp page
                    }
                } else {
                    request.setAttribute("errorMsg", "Credenciales inválidas. Inténtelo nuevamente.");
                }
            }
        }
        con.close(); //close connection	
    } catch (Exception e) {
        out.println(e);
        request.setAttribute("errorMsg", "Error en la base de datos");
    }
%>

<!DOCTYPE html>
<html>
    
    
    <head>
        <title>UNFV|Logueo</title>
        <link rel="shortcut icon" href="../imagenes/inicio/unfvIcon.png"/>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link rel="stylesheet" type="text/css" href="../estilos/portada/opciones.css" media="screen"/>
        <link href="../estilos/sesion/registro.css?v=4.0" rel="stylesheet" type="text/css" media="screen"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />

        <script>
            function validate()
            {           
                var usuario = document.myform.txt_username;
                var password = document.myform.txt_password;

                
                if (usuario.value == null || usuario.value == "") //check email textbox not blank
                {
                    window.alert("Por favor, ingrese su usuario"); //alert message
                    email.focus();
                    return false;
                }
                if (password.value == null || password.value == "") //check password textbox not blank
                {
                    window.alert("Debe ingresar una contraseña para continuar."); //alert message
                    password.focus();
                    return false;
                }
            }
        </script>

    </head>
    <body>
        <div class="cabecera">
            <a href="../index.html">
                <img class="logoIzq" src="../imagenes/inicio/Escudo_UNFV.png" alt="UNFV"/>
            </a>

            <img class="logoDer" src="../imagenes/inicio/Escudo_FIIS.png" alt="FIIS"/>
        </div>

        <div class="login-contenedor">

            <div class="form-contenedor">
                <h1 id="titulo">Iniciar Sesión</h1>

                <form class="form-register" method="post" name="myform" onsubmit="return validate();">

                    <div class="input-contenedor">
                        <p class="advertencia">				   		
                        <%
                            if (request.getAttribute("errorMsg") != null) {
                                out.println(request.getAttribute("errorMsg")); //error message for email or password 
                            }
                        %>
                        </p>
                        <div class="input-campo">
                            <i class="fa-solid fa-user-check"></i>
                            <input type="text" name="txt_username" id="usera" placeholder="Ingrese su usuario">
                        </div>
                        <div class="input-campo">
                            <i class="fa-solid fa-lock"></i>
                            <input type="password" name="txt_password" id="password" placeholder="Ingrese su contraseña">
                        </div>
                        <div class="input-campoche">
                            <input class="escoger" type="checkbox" name="Permanecer conectado" ><span>Permanecer conectado</span>
                        </div>
                        <p>Olvidaste tu contraseña
                            <a href="contraPerdida.html">click aqui</a>
                        </p>
                        
                    </div>
                    <!--Botones -->
                    <div class="boton-campo">
                        <button id="iniciar" type="submit" name="btn_login" value="Login" class="disable">Login Usuario</button>
                    </div>
                    
                    <p>¿No tienes una cuenta? 
                            <a href="login.jsp">Registrarme</a>
                    </p>
                        
                    <div class="boton-campo">
                        <a href="#">
                            <!-- href="../inicio_sesion_admin/index_admin.jsp" -->
                            <button   type="button">Login Admin</button>
                        </a>
                    </div>
                    
                    
                </form>
                
                
            </div>
                        
        </div>

        <footer>
            <div class="footer-principal">
                <div class="pie-colum1">
                    <p>DIRECCIÓN: Jr. Carlos Gonzáles 285 Urb. Maranga - San Miguel</p>
                    <p>CENTRAL TELEFÓNICA: (+51) 748 0888</p>
                    <p>©Biblioteca digital UNFV.</p>
                </div> 
            </div>

            <div class="pie-copy">
                <p>Copyright &COPY;2025; Diseñado por
                    <span class="diseñado">Lopez Hebert</span>
                </p>
            </div>
        </footer>

    </body>
</html>



