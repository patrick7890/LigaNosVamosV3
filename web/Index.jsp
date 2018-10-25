<%-- 
    Document   : Index
    Created on : 01-09-2018, 19:11:58
    Author     : Patricio
--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Index</title>
        <!--<style>
            body{
                background-image: url(Recursos/img/for2.jpg); 
                background-size: contain;
            }
        </style>-->
    </head>
    <body>

        <c:choose>
            <c:when test="${sesUsu.tipoUsuarioIdTipoUsuario().getIdTipoUsuario()>2}">
                <jsp:include page="Menus/menu_Usuario.jsp"></jsp:include>
            </c:when>
            <c:when test="${sesUsu.tipoUsuarioIdTipoUsuario().getIdTipoUsuario()<=2}">
                <jsp:include page="Menus/menu_Admin.jsp"></jsp:include>
            </c:when>
            <c:when test="${sesUsu==null}">
                <jsp:include page="Menus/menu.jsp"></jsp:include>
            </c:when>
        </c:choose>
        <div class="form-group" style="margin: 1%">
            <sql:setDataSource var = "nosvamos" driver = "com.mysql.jdbc.Driver"
                               url = "jdbc:mysql://localhost:3306/nosvamosv2?zeroDateTimeBehavior=convertToNull"
                               user = "juan"  password = "123456"/>


            <sql:query var="ligas" dataSource="${nosvamos}">
                SELECT * FROM liga
            </sql:query>

            <div class="row">
                <c:forEach var="list" items="${ligas.rows}">
                    <div class=" col-12 col-sm-12 col-md-6 col-xl-4 mt-2 " style="height: 100px" >
                        <a href="ProcesoLiga?btnAccion=null&idLiga=${list.liga_id}">
                            <div class="thumbnail group group-thumbnail"  style="height: 100px" >
                                <style>
                                    .group-thumbnail{
                                        background-image: url('Recursos/img/Dota.PNG');
                                        background-size: cover;
                                        width: 60%;
                                        height: 60%;
                                        content: "";
                                        position: absolute;
                                        background-position: 50%;
                                        z-index: 0;
                                    }
                                </style>
                                <div class="thumbnail-title">
                                    <h4 class="text-truncate" title="${list.nombre_liga}" ><c:out value="${list.nombre_liga}"/></h4>
                                </div>
                                <span class="">${list.fecha_inicio}</span>
                                <span class="">${list.fecha_termino}</span>
                            </div>
                        </a>
                    </div>
                </c:forEach>
            </div>
        </div>

    </body>
</html>
