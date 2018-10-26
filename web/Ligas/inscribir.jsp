<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${sesUsu==null}">
    <c:redirect url="/Index.jsp"></c:redirect>
</c:if>
<%-- 
    Document   : registrarseLiga
    Created on : 10-09-2018, 17:42:28
    Author     : Lennon
--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<%@page import="java.util.List"%>

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

        <sql:query var="equ" dataSource="${nosvamos}">
            SELECT * FROM equipo
        </sql:query>
        <jsp:useBean id="now" class="java.util.Date" />
        <fmt:formatDate var="date" value="${now}" pattern="yyyy-MM-dd" />
        <sql:query var="liga" dataSource="${nosvamos}">
            SELECT * FROM Liga l  JOIN Tipo_liga t on l.tipo_liga_idtipo_liga=t.idtipo_liga where  fecha_termino>='${date}'
        </sql:query>
        <c:choose>
            <c:when test="${sesUsu.getTipoUsuarioIdTipoUsuario().getIdTipoUsuario()>2}">
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
                            <c:forEach var="list" items="${liga.rows}">
                                <sql:query var="equipoUsu" dataSource="${nosvamos}">
                                    SELECT * FROM equipo where usuario_usuario_id=${sesUsu.getUsuarioId()} 
                                    AND tipo_liga_idtipo_liga=${list.tipo_liga_idtipo_liga}
                                    AND estado_equipo=1
                                </sql:query>
                                <form action="../ProcesoEquipo" method="GET" >
                                    <tr>
                                        <td> ${list.nombre_liga}</td>

                                        <td>${list.Descripcion}</td>
                                        <td>
                                            <c:if test="${equipoUsu.rowCount>0}">
                                                <select name="ddlEquipo">


                                                    <c:forEach var="lista" items="${equipoUsu.rows}" varStatus="e">
                                                        <option value="${lista.equipo_id}">${lista.nombre_equipo} </option>
                                                    </c:forEach>

                                                </select> 
                                            </c:if>
                                            <c:if test="${equipoUsu.rowCount==0}">
                                                <p>No Clasifica</p>
                                            </c:if>
                                        </td>
                                    <input type="hidden" value="${list.liga_id}" name="idLiga" />
                                    <td><button class="btn btn-primary" value="Inscribir" name="btnAccion">Inscribir</button></td>
                                    </tr>
                                    <input type="hidden" value="${sesUsu.getUsuarioId()}" name="idUsu" />
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
