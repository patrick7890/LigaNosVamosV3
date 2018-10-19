<%-- 
    Document   : menu_Admin
    Created on : 01-09-2018, 20:27:46
    Author     : Lennon
--%>

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
                        Usuarios
                    </button>
                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuButton">
                        <a class="dropdown-item" href="/LigaNosVamosV3/Usuario/registro.jsp">Crear Usuario</a>
                        <a class="dropdown-item" href="/LigaNosVamosV3/Usuario/administrar.jsp">administrar Usuario</a>
                    </div>
                </div>
            </li> 
            <li class="nav-item">
                <div class="btn-group">
                    <button class="btn btn-dark dropdown-toggle" type="busecondary droptton" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Equipos
                    </button>
                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuButton">
                        <a class="dropdown-item" href="/LigaNosVamosV3/Equipos/registro.jsp">Crear Equipos</a>
                        <a class="dropdown-item" href="/LigaNosVamosV3/Equipos/administrar.jsp">administrar Equipos</a>
                    </div>
                </div>
            </li> 
            <li class="nav-item">
                <div class="btn-group">
                    <button class="btn btn-dark dropdown-toggle" type="busecondary droptton" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Ligas
                    </button>
                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuButton">
                        <a class="dropdown-item" href="/LigaNosVamosV3/Ligas/crearLiga.jsp">Crear Liga</a>
                        <a class="dropdown-item" href="#">administrar Liga</a>
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
<!--<style>
    body{
        background-image: url(../Recursos/img/for2.jpg); 
        background-size: contain;
    }
</style>-->
<div id="foot">
    <footer>
        <div class="row text-center">
            <div class="col-sm-12">
                <h4>© Todos los derechos reservados.</h4>
            </div>
        </div>
    </footer>
</div>