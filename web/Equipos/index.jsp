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
            <c:when test="${sesUsu.getTipoUsuario().getIdTipoUsuario()>2}">
                <jsp:include page="../Menus/menu_Usuario.jsp"></jsp:include>
            </c:when>
            <c:when test="${sesUsu.getTipoUsuario().getIdTipoUsuario()<=2}">
                <jsp:include page="../Menus/menu_Admin.jsp"></jsp:include>
            </c:when>
        </c:choose>

        <div class="container">
            <jsp:useBean id="li" class="DAO.DAOEquipo" scope="page" ></jsp:useBean>
            <c:set  var="usu"  value="${sesUsu.getCorreoUsuario()}"/>
            <c:set  var="lista"  value="${li.listarEquipoUsuario(usu)}"/>
            <div class="row">
                <c:forEach var="list" items="${lista}">
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
                                <a href="administar.jsp">    <h4 class="text-truncate" >${list.getNombreEquipo()}</h4></a>
                            </div>
                            <div class="text-center">
                                <span style=" color: white"><p>Liga actual :</p>
                                    <c:choose>
                                        <c:when test="${list.getLiga().getNombreLiga()!=null}">
                                            <a href="/LigaNosVamos/Ligas/listaEquipos.jsp?${list.getLiga().getNombreLiga()}"><c:out value="${list.getLiga().getNombreLiga()}"/></a>
                                        </c:when>
                                        <c:when test="${list.getLiga().getNombreLiga()==null}">
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
