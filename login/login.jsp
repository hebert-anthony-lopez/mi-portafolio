<%-- 
    Document   : login
    Created on : 4 feb. 2025, 16:40:50
    Author     : Hebert Lopez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>  

<%
    try {
        Class.forName("com.mysql.jdbc.Driver"); // Cargar el driver
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bdbiblioteca", "root", ""); // Crear conexión

        if (request.getParameter("btn_register") != null) { // Verificar si se hizo clic en el botón
            String firstname, celular, direccion, user, password, email;
            int edadInt = 0; // Definir edad con valor por defecto

            user = request.getParameter("txt_username");
            password = request.getParameter("txt_password");
            firstname = request.getParameter("txt_firstname");
            celular = request.getParameter("txt_celular");
            direccion = request.getParameter("txt_direccion");
            email = request.getParameter("txt_email");

            // Obtener la edad y validarla
            String edad = request.getParameter("txt_edad");
            if (edad != null && !edad.trim().isEmpty()) {
                try {
                    edadInt = Integer.parseInt(edad);
                } catch (NumberFormatException e) {
                    out.println("Error: La edad debe ser un número válido.");
                    return;
                }
            }

            // Preparar la consulta SQL
            PreparedStatement pstmt = con.prepareStatement("INSERT INTO usuario(username, password, nombre, edad, celular, direccion, email) VALUES (?, ?, ?, ?, ?, ?, ?)");
            pstmt.setString(1, user);
            pstmt.setString(2, password);
            pstmt.setString(3, firstname);
            pstmt.setInt(4, edadInt); // Insertar edad como número
            pstmt.setString(5, celular);
            pstmt.setString(6, direccion);
            pstmt.setString(7, email);

            pstmt.executeUpdate(); // Ejecutar la consulta

            request.setAttribute("successMsg", "Registro exitoso. Bienvenido a UNVF."); // Mensaje de éxito

            con.close(); // Cerrar conexión
        }
    } catch (Exception e) {
        out.println("Error en la base de datos: " + e.getMessage());
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
        <link href="../estilos/sesion/login.css?v=3.0" rel="stylesheet" type="text/css" media="screen"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />

        <script>
            function validate()
            {
                var nombre = document.myform.txt_firstname;
                var edad = document.myform.txt_edad;
                var celular = document.myform.txt_celular;
                var direccion = document.myform.txt_direccion;
                var email = document.myform.txt_email;
                var usuario = document.myform.txt_username;
                var password = document.myform.txt_password;

                if (nombre.value == null || nombre.value == "") //check email textbox not blank
                {
                    window.alert("Por favor, ingrese su nombre completo"); //alert message
                    email.focus();
                    return false;
                }
                if (edad.value == null || edad.value == "") //check email textbox not blank
                {
                    window.alert("Por favor, ingrese su edad"); //alert message
                    email.focus();
                    return false;
                }
                if (celular.value == null || celular.value == "") //check email textbox not blank
                {
                    window.alert("Por favor, ingrese su número de celular"); //alert message
                    email.focus();
                    return false;
                }
                if (direccion.value == null || direccion.value == "") //check email textbox not blank
                {
                    window.alert("Por favor, ingrese su dirección"); //alert message
                    email.focus();
                    return false;
                }
                if (email.value == null || email.value == "") //check email textbox not blank
                {
                    window.alert("Por favor, ingrese su correo institucional"); //alert message
                    email.focus();
                    return false;
                }
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
                <h1 id="titulo">Registro</h1>

                <form class="form-register" method="post" name="myform" onsubmit="return validate();">

                    <div class="input-contenedor">
                        <div class="input-campo" id="name">
                            <i class="fa-solid fa-user"></i>
                            <input type="text" name="txt_firstname" id="fname" placeholder="Ingrese su nombre">
                        </div>   
                        <div class="input-campo">
                            <i class="fa-solid fa-calendar"></i>
                            <input type="number" name="txt_edad" id="edada" placeholder="Ingrese su edad">
                        </div>
                        <div class="input-campo">
                            <i class="fa-solid fa-phone"></i>
                            <input type="text" name="txt_celular" id="celulara" maxlength="9" placeholder="Ingrese su celular">
                        </div>
                        <div class="input-campo">
                            <i class="fa-solid fa-location-dot"></i>
                            <input type="text" name="txt_direccion" id="direcciona" placeholder="Ingrese su direccion">
                        </div>
                        <div class="input-campo">
                            <i class="fa-solid fa-envelope"></i>
                            <input type="text" name="txt_email" id="emaila" placeholder="Ingrese su correo">
                        </div>
                        <div class="input-campo">
                            <i class="fa-solid fa-user-check"></i>
                            <input type="text" name="txt_username" id="usera" placeholder="Ingrese su usuario">
                        </div>
                        <div class="input-campo">
                            <i class="fa-solid fa-lock"></i>
                            <input type="password" name="txt_password" id="password" placeholder="Ingrese su contraseña">
                        </div>
                        <p>Olvidaste tu contraseña
                            <a href="contraPerdida.html">click aqui</a>
                        </p>
                        <p>¿Tienes una cuenta? 
                            <a href="inicio.jsp">Ingresa</a>
                    </p>
                    </div>
                    <!--Botones -->
                    <div class="boton-campo">
                        <button id="registrar" type="submit" name="btn_register" value="Register">Registro</button>
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
