<%-- 
    Document   : portal
    Created on : 5 feb. 2025, 15:19:13
    Author     : Hebert Lopez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="shortcut icon" href="../imagenes/inicio/unfvIcon.png"/>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>BIENVENIDO | <%=session.getAttribute("login")%> </title>

        <link rel="stylesheet" type="text/css" href="../estilos/portada/opciones.css" media="screen"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href="../estilos/sesion/portales.css" rel="stylesheet" type="text/css"/>

        <script language="javascript">
            var presentacion = "Hola, bienvenido a la biblioteca virtual de la UNFV";
            alert(presentacion);
        </script>

    </head>
    <body>
        <div class="cabecera">
            <a href="../index.html">
                <img class="logoIzq" src="../imagenes/inicio/Escudo_UNFV.png" alt="UNFV"/>
            </a>

            <img class="logoDer" src="../imagenes/inicio/Escudo_FIIS.png" alt="FIIS"/>
        </div>

        <div class="bodyCont">
            <div class="navegacion">
                <ul>
                    <li class="lista">
                        <a href="#">
                            <span class="icono"><i class="fa-solid fa-home"></i></span>
                            <span class="titulo">Inicio</span>
                        </a>
                        
                    </li>
                    <li class="lista">
                        <a href="#">
                            <span class="icono"><i class="fa-solid fa-circle-info"></i></span>
                            <span class="titulo">Información</span>
                        </a>
                    </li>
                    <li class="lista">
                        <a href="#">
                            <span class="icono"><i class="fa-solid fa-book"></i></span>
                            <span class="titulo">Libros</span>
                        </a>
                    </li>
                    <li class="lista">
                        <a href="#">
                            <span class="icono"><i class="fa-solid fa-scale-balanced"></i></span>
                            <span class="titulo">Reglamento</span>
                        </a>
                    </li>
                    <li class="lista">
                        <a href="../login/loginout.jsp">
                            <span class="icono"><i class="fa-solid fa-right-from-bracket"></i></span>
                            <span class="titulo">Salir</span>
                        </a>
                    </li>
                    
                    <div class="indicador"></div>
                </ul>

            </div>
            
            <script>
                const list = document.querySelectorAll('.lista');
                function activoClass() {
                    list.forEach((item) =>
                        item.classList.remove('activo'));
                    this.classList.add('activo');
                }
                list.forEach((item) =>
                    item.addEventListener('click', activoClass));
            </script>
        </div>
    </body>
</html>
