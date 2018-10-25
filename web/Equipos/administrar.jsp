<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
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
    <c:set  var="lista"  value="${li.listarTodo()}"/>
    <sql:setDataSource var = "nosvamos" driver = "com.mysql.jdbc.Driver"
                       url = "jdbc:mysql://localhost:3306/nosvamosv2?zeroDateTimeBehavior=convertToNull"
                       user = "juan"  password = "123456"/>



    <body>
        <c:choose>
            <c:when test="${sesUsu.getTipoUsuarioIdTipoUsuario().getIdTipoUsuario()>2}">
                <sql:query var="equipoUsu" dataSource="${nosvamos}">
                    SELECT * FROM Equipo where correo_usuario=${sesUsu.getCorreoUsuario()}
                </sql:query>
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
                            <c:forEach var="list" items="${equipoUsu.rows}">
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
            <c:when test="${sesUsu.getTipoUsuarioIdTipoUsuario().getIdTipoUsuario()<=2}">
                <jsp:include page="../Menus/menu_Admin.jsp"></jsp:include>
                <sql:query var="equipo" dataSource="${nosvamos}">
                    SELECT * FROM Equipo e 
                    LEFT JOIN Usuario on  e.usuario_usuario_id=usuario_id
                    LEFT JOIN Liga on e.liga_liga_id=liga_id
                    LEFT JOIN Tipo_liga on e.tipo_liga_idtipo_liga=idtipo_liga
                </sql:query>
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
                            <c:forEach var="list" items="${equipo.rows}">
                                <form action="../ProcesoEquipo" method="GET">
                                    <tr>
                                        <td>${list.nombre_usuario}</td>
                                        <td>${list.nombre_equipo}</td>
                                        <td>${list.nombre_liga !=null?list.nombre_liga:'Sin Liga'}</td>
                                        <td>${list.descripcion}</td>
                                        <td> 
                                            <select  class="form-control" name="ddlEstado">
                                                <option value="1" ${list.estado_equipo == 1? 'selected' : ''}>Activo</option>
                                                <option value="0" ${list.estado_equipo == 0? 'selected' : ''}>Inactivo</option>
                                            </select>
                                        </td>
                                    <input type="hidden" name="txtNombreEquipo"value="${list.nombre_equipo}"></td>
                                    <input type="hidden" name="liga"value="${list.liga_liga_id}"></td>
                                    <input type="hidden" name="tipo"value="${list.tipo_liga_idtipo_liga}"></td>
                                    <input type="hidden" name="usu"value="${list.usuario_usuario_id}"></td>
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
