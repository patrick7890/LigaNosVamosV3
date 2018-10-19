<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${sesUsu==null}">
    <c:redirect url="/Index.jsp"></c:redirect>
</c:if>
<%-- 
    Document   : registrarseLiga
    Created on : 10-09-2018, 17:42:28
    Author     : Lennon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:useBean id="equ" class="DAO.DAOEquipo" scope="page" ></jsp:useBean>
        <jsp:useBean id="liga" class="DAO.DAOLiga" scope="page" ></jsp:useBean>
        <c:set  var="equipo"  value="${equ.listarTodo()}"/>
        <c:set  var="li"  value="${liga.listarTodo()}"/>
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
                                <th>Tipo de Liga</th>
                                <th>Equipo</th>
                                <th></th>
                                </thead>
                            <c:forEach var="list" items="${li}">
                                <form action="../ProcesoEquipo" method="GET" >
                                    <tr>
                                        <td> ${list.getNombreLiga()}</td>

                                        <td>${list.getTipoLiga().getDescripcion()}</td>
                                        <td> <select name="ddlEquipo">
                                                <c:forEach var="lista" items="${equipoUsu}" >
                                                    <option value="${lista.getNombreEquipo()}">${lista.getNombreEquipo()} </option>
                                                </c:forEach>
                                            </select> 
                                        </td>
                                    <input type="hidden" value="${list.getNombreLiga()}" name="txtNombreLiga" />
                                    <input type="hidden" value="${list.getTipoLiga().getIdtipoLiga()}" name="txtTipoLiga" />
                                    <td><button class="btn btn-primary" value="Inscribir" name="btnAccion">Inscribir</button></td>
                                    </tr>
                                    <input type="hidden" value="${sesUsu.getCorreoUsuario()}" name="correo" />
                                </form>
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
                                <th>Nombre</th>
                                <th>Liga</th>
                                <th>Tipo de Liga</th>
                                <th>Estado</th>
                                <th colspan="2">Accion</th>
                                </thead>
                            <c:forEach var="list" items="${equipo}">
                                <tr>
                                    <td> <input type="text" value=" ${list.getNombreEquipo()}" name="txtNombreEquipo" </td>
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
                                    <td><button class="btn btn-primary" value="${list.getNombreEquipo()}">Actualizar</button></td>
                                    <td><button class="btn btn-danger" value="${list.getNombreEquipo()}">Eliminar</button></td>
                                </tr>
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
