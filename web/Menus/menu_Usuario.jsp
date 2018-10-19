<%-- 
    Document   : menu_Usuario
    Created on : 01-09-2018, 20:27:46
    Author     : Lennon
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="/LigaNosVamosV3/Recursos/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<link href="/LigaNosVamosV3/Recursos/fontawesome/css/all.min.css" rel="stylesheet" type="text/css"/>
<script src="/LigaNosVamosV3/Recursos/js/jquery-3.2.0.min.js" type="text/javascript"></script>
<script src="/LigaNosVamosV3/Recursos/js/bootstrap.min.js" type="text/javascript"></script>
<link href="/LigaNosVamosV3/Recursos/css/estilo.css" rel="stylesheet" type="text/css"/>

<nav class="navbar navbar-expand-md bg-dark navbar-dark">
    <!-- Brand -->
    <a class="navbar-brand" href="/LigaNosVamosV3/Index.jsp">Home</a>
    <!-- Toggler/collapsibe Button -->
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
        <span class="navbar-toggler-icon"></span>
    </button>
    <!-- Navbar links -->
    <div class="collapse navbar-collapse" id="collapsibleNavbar">
        <ul class="navbar-nav ml-auto">
            <li class="nav-item">
                <div class="btn-group">
                    <button class="btn btn-dark dropdown-toggle" type="busecondary droptton" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Liga
                    </button>
                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuButton">
                        <a class="dropdown-item" href="/LigaNosVamosV3/Ligas/inscribir.jsp">Postular</a>
                    </div>
                </div>
            </li> 
            <li class="nav-item">
                <div class="btn-group">
                    <button class="btn btn-dark dropdown-toggle" type="busecondary droptton" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Mi Equipo
                    </button>
                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuButton">
                        <a class="dropdown-item" href="/LigaNosVamosV3/Equipos/registro.jsp">Crear Equipo</a>
                        <a class="dropdown-item" href="/LigaNosVamosV3/Equipos/administrar.jsp">Administar Equipo</a>
                        <a class="dropdown-item" href="/LigaNosVamosV3/Integrantes/registro.jsp">Registrar Integrantes</a>
                        <a class="dropdown-item" href="/LigaNosVamosV3/Integrantes/administrar.jsp">Administar Integrantes</a>

                    </div>
                </div>
            </li> 
            <li class="nav-item">
                <div class="btn-group">
                    <button class="btn btn-dark dropdown-toggle" type="busecondary droptton" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        ${sesUsu.getNombreUsuario()}
                    </button>
                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuButton">
                        <form method="GET" action="/LigaNosVamosV3/ProcesoUsuario">
                            <button  type="submit" class="dropdown-item" name="btnAccion" value="Cerrar Sesion">Cerrar Sesion</button>
                        </form>
                    </div>
                </div>
            </li> 
        </ul>
    </div> 
</nav>
<div id="foot">
    <footer>
        <div class="row text-center">
            <div class="col-sm-12">
                <h4>© Todos los derechos reservados.</h4>
            </div>
        </div>
    </footer>
</div>