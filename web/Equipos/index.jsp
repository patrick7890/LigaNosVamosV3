<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${sesUsu==null}">
    <c:redirect url="/Index.jsp"></c:redirect>
</c:if>
<%-- 
    Document   : index
    Created on : 08-09-2018, 14:40:41
    Author     : Patricio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <c:choose>
            <c:when test="${sesUsu.getTipoUsuarioIdTipoUsuario().getIdTipoUsuario()>2}">
                <jsp:include page="../Menus/menu_Usuario.jsp"></jsp:include>
            </c:when>
            <c:when test="${sesUsu.getTipoUsuarioIdTipoUsuario().getIdTipoUsuario()<=2}">
                <jsp:include page="../Menus/menu_Admin.jsp"></jsp:include>
            </c:when>
        </c:choose>

        <div class="container">
            <sql:setDataSource var = "nosvamos" driver = "com.mysql.jdbc.Driver"
                               url = "jdbc:mysql://localhost:3306/nosvamosv2?zeroDateTimeBehavior=convertToNull"
                               user = "juan"  password = "123456"/>
            
            <sql:query var="lista" dataSource="${nosvamos}">
                    SELECT * FROM Equipo e JOIN Liga l on e.liga_liga_id=l.liga_id where usuario_usuario_id='${sesUsu.getUsuarioId()}'
                </sql:query>
            <div class="row">
                <c:forEach var="list" items="${lista.rows}">
                    <div class=" col-12 col-sm-12 col-md-6 col-xl-4 mt-2 " style="height: 100px" >

                        <div class="thumbnail group group-thumbnail"  style="height: 100px" >
                            <style>
                                .group-thumbnail{
                                    background-image: url('../Recursos/img/Dota.PNG');
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
                                <a href="administar.jsp">    <h4 class="text-truncate" >${list.nombre_equipo}</h4></a>
                            </div>
                            <div class="text-center">
                                <span style=" color: white"><p>Liga actual :</p>
                                    <c:choose>
                                        <c:when test="${list.nombre_liga!=null}">
                                            <a href="/LigaNosVamosV3/ProcesoLiga?btnAccion=null&idLiga=${list.liga_id}"><c:out value="${list.nombre_liga}"/></a>
                                        </c:when>
                                        <c:when test="${list.nombre_liga==null}">
                                            <p>Ninguna</p>
                                        </c:when>
                                    </c:choose> 
                                </span>
                            </div>

                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </body>
</html>
