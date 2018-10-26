<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${sesUsu==null}">
    <c:if test="${sesUsu.getTipoUsuarioIdTipoUsuario().getIdTipoUsuario()>2}">
        <c:redirect url="/Index.jsp"></c:redirect>
    </c:if>
    <c:redirect url="/Index.jsp"></c:redirect>
</c:if>



<%-- 
    Document   : IniciarTorneo
    Created on : 26-oct-2018, 0:07:06
    Author     : Patricio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <link href="../Recursos/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>


    </head>
    <body>
        <sql:setDataSource var = "nosvamos" driver = "com.mysql.jdbc.Driver"
                           url = "jdbc:mysql://localhost:3306/nosvamosv2?zeroDateTimeBehavior=convertToNull"
                           user = "juan"  password = "123456"/>
        <h1>${idliga}</h1>
        <sql:query var="equipoUsu" dataSource="${nosvamos}">
            SELECT * FROM Equipo e 
            LEFT JOIN Liga on e.liga_liga_id=liga_id
            WHERE liga_id='${idliga}'
        </sql:query>
        <div class="container">
            <div class="row">
                <form action="../ProcesoMatch" method="GET">
                    <table class="table text-center" >
                        <tr>
                            <td>
                                <table class="table table-hover" >
                                    <thead>
                                    <th>Equipo</th>
                                    <th>Match</th>
                                    </thead>
                                    <c:forEach var="list" items="${equipoUsu.rows}" varStatus="e">
                                        <tr>
                                            <td><input class="form-control" name="txtEquipo${e.count}" readonly="" value="${list.nombre_equipo}"/></td>
                                            <td>${match==null?'Sin match':match}</td>
                                        </tr>
                                        <c:if test="${e.count==8}">
                                        </table>
                                    </td>

                                    <td>
                                        <table class="table table-hover" >
                                            <thead>
                                            <th>Equipo</th>
                                            <th>Match</th>
                                            </thead>

                                        </c:if>
                                    </c:forEach>
                                </table>
                            </td>

                        </tr>
                        <tr>
                            <td colspan="2">
                                <button type="submit" name="btnAccion" value="generar">Generar</button>
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>

    </body>
</html>
