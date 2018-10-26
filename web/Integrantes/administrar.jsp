<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
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
    <body>


        <sql:setDataSource var = "nosvamos" driver = "com.mysql.jdbc.Driver"
                           url = "jdbc:mysql://localhost:3306/nosvamosv2?zeroDateTimeBehavior=convertToNull"
                           user = "juan"  password = "123456"/>

        <sql:query var="lista" dataSource="${nosvamos}">
            SELECT * FROM integrantes i JOIN equipo e on i.equipo_equipo_id=e.equipo_id WHERE e.usuario_usuario_id = ${sesUsu.getUsuarioId()}
        </sql:query>

        <sql:query var="lisa" dataSource="${nosvamos}">
            SELECT * FROM integrantes i JOIN equipo e on i.equipo_equipo_id=e.equipo_id
        </sql:query>
        <sql:query var="et" dataSource="${nosvamos}">
            SELECT * FROM equipo 
        </sql:query>

        <c:choose>
            <c:when test="${sesUsu.getTipoUsuarioIdTipoUsuario().getIdTipoUsuario()>2}">
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

                            <c:forEach var="list" items="${lista.rows}">
                                <form action="../ProcesoIntegrantes" method="GET">
                                    <tr>
                                        <td><input class="form-control" name="txtRut" value="${list.rut_integrante}"/></td>
                                        <td><input class="form-control" name="txtNombre" value="${list.nombre_integrante}"/></td>
                                        <td><input class="form-control" name="txtNick" value="${list.Nick}"/></td>
                                        <td>${list.nombre_equipo}</td>
                                    <input type="hidden" name="id" value="${list.Integrante_Id}"/>
                                    <input type="hidden" name="ddlEquipo" value="${list.equipo_id}"/>
                                    <input type="hidden" name="ddlEstado" value="${list.estado_equipo}"/>
                                    <td><button class="btn btn-primary" name="btnAccion" value="Actualizar">Actualizar</button></td>
                                    <td><button class="btn btn-danger" name="btnAccion" value="Eliminar">Eliminar</button></td>
                                    </tr>
                                </form>
                            </c:forEach>
                        </table>
                    </div>
                </div>
            </c:when>
            <c:when test="${sesUsu.getTipoUsuarioIdTipoUsuario().getIdTipoUsuario()<=2}">
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
                            <c:forEach var="list" items="${lisa.rows}">

                                <tr>
                                <form action="../ProcesoIntegrantes" method="GET">
                                    <td><input class="form-control" name="txtRut" value="${list.rut_integrante}"/></td>
                                    <td><input class="form-control" name="txtNombre" value="${list.nombre_integrante}"/></td>
                                    <td><input class="form-control" name="txtNick" value="${list.Nick}"/></td>
                                    <td>
                                        <select class="form-control" name="ddlEquipo">
                                            <c:forEach var="lista" items="${et.rows}">
                                                <option value="${lista.equipo_id}" ${lista.equipo_id == list.equipo_equipo_id? 'selected' : ''}>${lista.nombre_equipo}</option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                    <td><select class="form-control" name="ddlEstado">
                                            <option value="1" ${list.estado_equipo == 1? 'selected' : ''}>Activo</option>
                                            <option value="0" ${list.estado_equipo == 0? 'selected' : ''}>Inactivo</option>
                                        </select>
                                    </td>
                                    <input type="hidden" name="id" value="${list.Integrante_Id}"/>
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
