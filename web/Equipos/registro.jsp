<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${sesUsu==null}">
    <c:redirect url="/Index.jsp"></c:redirect>
</c:if>
<%--
Document   : registro
Created on : 04-sep-2018, 14:30:53
Author     : Duoc
--%>
<%@page import="dto.TipoLiga"%>
<%@page import="java.util.List"%>
<%@page import="DAO.DAOLiga"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registrar Equipos</title>
    </head>
    <body>
        <c:choose>
            <c:when test="${sesUsu.getTipoUsuario().getIdTipoUsuario()>2}">
                <jsp:include page="../Menus/menu_Usuario.jsp"></jsp:include>
            </c:when>
            <c:when test="${sesUsu.getTipoUsuario().getIdTipoUsuario()<=2}">
                <jsp:include page="../Menus/menu_Admin.jsp"></jsp:include>
            </c:when>
        </c:choose>

        <!--inicio del contenido-->
        <div class="container">
            <div class="row justify-content-md-center">
                <div class="col-sm-6">
                    <form action="../ProcesoEquipo" method="GET" enctype="multipart/form-data" >
                        <div class="card" style="">
                            <div class="card-body">
                                <h1 class="text-center">Registro De Equipo</h1>
                                <hr>
                                <div class="form-group">
                                    <label>Nombre De Equipo: </label>
                                    <input type="text" name="txtNombre" placeholder="Ej:Juan" minlength="4" class="form-control"/>
                                    <input type="hidden" name="txtNombreUsu" value="${sesUsu.getCorreoUsuario()}"/>
                                </div>

                               <!-- <div class="form-group " >
                                    <label>Ingrese la Imagen de Equipo </label>
                                    <input class="btn btn-default" type="file" name="selec"  onchange="loadFile(event)" />
                                </div>


                                <div class="form-group" >
                                    <img id="output"/>
                                    <script>
                                        var loadFile = function (event) {
                                            var output = document.getElementById('output');
                                            output.src = URL.createObjectURL(event.target.files[0]);
                                        };
                                    </script>
                                </div>-->

                                <div class="form-group">
                                    <label>Tipo Liga: </label>
                                    <jsp:useBean id="li" class="DAO.DAOLiga" scope="page" ></jsp:useBean>
                                    <c:set  var="lista"  value="${li.ListarTipo()}"/>
                                    <select class="form-control" name="ddlTipo">
                                        <option>Elige Una Opcion</option>
                                        <c:forEach var="list" items="${lista}">
                                            <option value="${list.getIdtipoLiga()}">
                                                <c:out value="${list.getDescripcion()}"/>
                                            </option>
                                        </c:forEach>

                                    </select>
                                </div>
                                <div class="form-group ">
                                    <button class="btn btn-primary" type="submit"  name="btnAccion" value="Registar"><i class="far fa-fw fa-save"></i>Registar</button>
                                </div>
                            </div>
                        </div>
                    </form>
                    <c:if test="${mensaje!=null}" >
                        ${mensaje}
                    </c:if>
                    <c:remove var="mensaje" />
                </div>
            </div>
        </div>
        <!--fin del contenido-->


    </body>
</html>
