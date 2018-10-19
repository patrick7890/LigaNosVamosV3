<%-- 
    Document   : listaEquipos
    Created on : 08-09-2018, 15:48:20
    Author     : Patricio
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="text/javascript">
            var str = window.location.search;
        </script>
    </head>
    <body>


        <c:choose>
            <c:when test="${sesUsu.getTipoUsuario().getIdTipoUsuario()>2}">
                <jsp:include page="../Menus/menu_Usuario.jsp"></jsp:include>
            </c:when>
            <c:when test="${sesUsu.getTipoUsuario().getIdTipoUsuario()<=2}">
                <jsp:include page="../Menus/menu_Admin.jsp"></jsp:include>
            </c:when>
            <c:when test="${sesUsu==null}">
                <jsp:include page="../Menus/menu.jsp"></jsp:include>
            </c:when>
        </c:choose>
        <div class="form-group" style="margin: 1%">
            <jsp:useBean id="li" class="DAO.DAOEquipo" scope="page" ></jsp:useBean>
            <c:set  var="lista"  value="${li.listarTodo()}"/>
            <div class="row">
                <c:forEach var="list" items="${lista}">
                    <div class=" col-12 col-sm-12 col-md-6 col-xl-4 mt-2 " style="height: 100px" >
                        <form>
                            <a href="/LigaNosVamos/Equipos/administrar.jsp?${list.getNombreEquipo()}">
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
                                        <h4 class="text-truncate" title="${list.getNombreEquipo()}" ><c:out value="${list.getNombreEquipo()}"/></h4>
                                    </div>
                                </div>
                            </a>
                        </form>
                    </div>
                </c:forEach>
            </div>
        </div>




    </body>
</html>
