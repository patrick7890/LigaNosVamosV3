<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${sesUsu==null}">
    <c:redirect url="/Index.jsp"></c:redirect>
</c:if>
<%-- 
    Document   : estadoEquipo
    Created on : 10-09-2018, 15:49:11
    Author     : Lennon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body><jsp:useBean id="li" class="DAO.DAOIntegrantes" scope="page" ></jsp:useBean>
        <c:set  var="lista"  value="${li.listarTodo()}"/>
        <jsp:useBean id="equ" class="DAO.DAOEquipo" scope="page" ></jsp:useBean>
        <c:set  var="equipo"  value="${equ.listarTodo()}"/>
        <c:set var="correo" value="${sesUsu.getCorreoUsuario()}"/> 
        <c:set  var="equipoUsu"  value="${equ.listarEquipoUsuario(correo)}"/>

        <c:choose>
            <c:when test="${sesUsu.getTipoUsuario().getIdTipoUsuario()>2}">
                <jsp:include page="../Menus/menu_Usuario.jsp"></jsp:include>
                    <div class="container">
                        <div class="row">
                            <table class="table table-hover">
                                <thead>

                                <th>Nombre</th>
                                <th>Liga</th>
                                <th>Tipo de Liga</th>
                                <th>Estado</th>

                                <th colspan="2">Accion</th>
                                </thead>
                            <c:forEach var="list" items="${equipoUsu}">
                                <form action="../ProcesoEquipo" method="GET">
                                    <tr>
                                        <td>${list.getUsuario().getNombreUsuario()}</td>
                                        <td>${list.getNombreEquipo()}</td>
                                        <td>${list.getLiga().getNombreLiga()}</td>
                                        <td>${list.getTipoLiga().getDescripcion()}</td>
                                        <td> 
                                            <c:choose >
                                                <c:when test="${list.getEstadoEquipo() == 1}">
                                                    <p style="color: green" > activo</p>
                                                </c:when>
                                                <c:when test="${list.getEstadoEquipo() == 0}">
                                                    <p style="color: red" > inactivo</p>
                                                </c:when>
                                            </c:choose>
                                        </td>
                                    </tr>
                                </form>
                                </td>
                                </tr>
                            </c:forEach>
                        </table>
                    </div>
                </div>
            </c:when>
            <c:when test="${sesUsu.getTipoUsuario().getIdTipoUsuario()<=2}">
                <jsp:include page="../Menus/menu_Admin.jsp"></jsp:include>

                    <div class="container">
                        <div class="row">
                            <table class="table table-hover">
                                <thead>

                                <th>Pertenece A</th>
                                <th>Nombre</th>
                                <th>Liga</th>
                                <th>Tipo de Liga</th>
                                <th>Estado</th>

                                <th colspan="2">Accion</th>
                                </thead>
                            <c:forEach var="list" items="${equipo}">
                                <form action="../ProcesoEquipo" method="GET">
                                    <tr>
                                        <td>${list.getUsuario().getNombreUsuario()}</td>
                                        <td>${list.getNombreEquipo()}</td>
                                        <td>${list.getLiga().getNombreLiga()}</td>
                                        <td>${list.getTipoLiga().getDescripcion()}</td>
                                        <td> 
                                            <select  class="form-control" name="ddlEstado">
                                                <option value="1" ${list.getEstadoEquipo() == 1? 'selected' : ''}>Activo</option>
                                                <option value="0" ${list.getEstadoEquipo() == 0? 'selected' : ''}>Inactivo</option>
                                            </select>
                                        </td>
                                    <input type="hidden" name="txtNombreEquipo"value="${list.getNombreEquipo()}"></td>
                                    <input type="hidden" name="liga"value="${list.getLiga().getNombreLiga()}"></td>
                                    <input type="hidden" name="tipo"value="${list.getTipoLiga().getIdtipoLiga()}"></td>
                                    <input type="hidden" name="usu"value="${list.getUsuario().getCorreoUsuario()}"></td>
                                    <td><button class="btn btn-primary" name="btnAccion" value="Actualizar">Actualizar</button></td>
                                    </tr>
                                </form>
                            </c:forEach>
                        </table>
                    </div>
                </div>
            </c:when>
        </c:choose>
        <c:if test="${mensaje!=null}" >
            ${mensaje}
        </c:if>
        <c:remove var="mensaje" />
    </body>
</html>
