<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${sesUsu==null}">
    <c:redirect url="/Index.jsp"></c:redirect>
</c:if>
<%-- 
    Document   : administar
    Created on : 08-09-2018, 15:15:11
    Author     : Patricio
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <c:set  var="correo"  value="${sesUsu.getCorreoUsuario()}"/>
        <c:set  var="equipo"  value="${equ.listarEquipoUsuario(correo)}"/>
        <c:set  var="et"  value="${equ.listarTodo()}"/>

        <c:choose>
            <c:when test="${sesUsu.getTipoUsuario().getIdTipoUsuario()>2}">
                <jsp:include page="../Menus/menu_Usuario.jsp"></jsp:include>
                    <div class="container">
                        <div class="row">
                            <table class="table table-hover">
                                <thead>
                                <th>Rut</th>
                                <th>Nombre</th>
                                <th>Nick</th>
                                <th>Equipo</th>
                                <th colspan="2">Accion</th>
                                </thead>
                                
                            <c:forEach var="list" items="${lista}">
                                <tr>
                                    <td>${list.getRutIntegrante()}</td>
                                    <td><input class="form-control" value="${list.getNombreIntegrante()}"/></td>
                                    <td><input class="form-control" value="${list.getNick()}"/></td>
                                    <td>${list.getEquipo().getNombreEquipo()}</td>
                                    <td><button class="btn btn-primary" value="${list.getRutIntegrante()}">Actualizar</button></td>
                                    <td><button class="btn btn-danger" value="${list.getRutIntegrante()}">Eliminar</button></td>
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
                                <th>Rut</th>
                                <th>Nombre</th>
                                <th>Nick</th>
                                <th>Equipo</th>
                                <th>estado</th>
                                <th colspan="2">Accion</th>
                                </thead>
                            <c:forEach var="list" items="${lista}">

                                <tr>
                                <form action="../ProcesoIntegrantes" method="GET">
                                    <td><input class="form-control" name="txtRut" value="${list.getRutIntegrante()}"/></td>
                                    <td><input class="form-control" name="txtNombre" value="${list.getNombreIntegrante()}"/></td>
                                    <td><input class="form-control" name="txtNick" value="${list.getNick()}"/></td>
                                    <td>
                                        <select class="form-control" name="ddlEquipo">
                                            <c:forEach var="lista" items="${et}">
                                                <option value="${lista.getNombreEquipo()}">${lista.getNombreEquipo()}</option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                    <td><select class="form-control" name="ddlEstado">
                                            <option value="1">Activo</option>
                                            <option value="0">Inactivo</option>
                                        </select>
                                    </td>
                                    <input type="hidden" value="${list.getRutIntegrante()}"/>
                                    <td><button class="btn btn-primary" name="btnAccion" value="Actualizar">Actualizar</button></td>
                                    <td><button class="btn btn-danger" name="btnAccion" value="Eliminar">Eliminar</button></td>
                                </form>
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
