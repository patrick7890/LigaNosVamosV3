<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${sesUsu==null}">
    <c:redirect url="/Index.jsp"></c:redirect>
</c:if><%-- 
    Document   : registro
    Created on : 01-09-2018, 19:49:16
    Author     : Lennon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registrar Integrantes</title>
    </head>
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
                        <div class="row justify-content-center">
                            <form action="../ProcesoIntegrantes" method="GET" >
                                <table class="table table-hover">
                                    <thead>

                                    <th></th>
                                    <th>RUT</th>
                                    <th>Nombre</th>
                                    <th>Nick</th>

                                    </thead>
                                <c:forEach  varStatus="lis" begin = "1" end="5" >
                                    <tr>
                                        <td>Integrante ${lis.index}</td>
                                        <td> <input type="text" value="" name="txtRut${lis.index}"  /></td>
                                        <td> <input type="text" value="" name="txtNombre${lis.index}"  /></td>
                                        <td> <input type="text" value="" name="txtNick${lis.index}" /></td>

                                        <td>${list.getTipoLiga().getDescripcion()}</td>

                                    <input type="hidden" value="${list.getNombreLiga()}" name="txtNombreLiga" />
                                    <input type="hidden" value="${list.getTipoLiga().getIdtipoLiga()}" name="txtTipoLiga" />
                                    </tr>
                                </c:forEach>
                                <tr>
                                    <td>Integrante 6</td>
                                    <td> <input type="text" value="" name="txtRut6" /></td>
                                    <td> <input type="text" value="" name="txtNombre6" /></td>
                                    <td> <input type="text" value="" name="txtNick6" /></td>

                                    <td>${list.getTipoLiga().getDescripcion()}</td>

                                <input type="hidden" value="${list.getNombreLiga()}" name="txtNombreLiga" />
                                <input type="hidden" value="${list.getTipoLiga().getIdtipoLiga()}" name="txtTipoLiga" />
                                </tr>
                                <tr>
                                    <td>Integrante 7</td>
                                    <td> <input type="text" value="" name="txtRut7" /></td>

                                    <td> <input type="text" value="" name="txtNombre7" /></td>

                                    <td> <input type="text" value="" name="txtNick7" /></td>

                                    <td>${list.getTipoLiga().getDescripcion()}</td>

                                <input type="hidden" value="${list.getNombreLiga()}" name="txtNombreLiga" />
                                <input type="hidden" value="${list.getTipoLiga().getIdtipoLiga()}" name="txtTipoLiga" />
                                </tr>



                                <input type="hidden" value="${sesUsu.getCorreoUsuario()}" name="correo" />

                                </td>                    



                            </table>
                            <div class="text-center">

                                <select name="ddlEquipo">
                                    <c:forEach var="lista" items="${equipoUsu}" >
                                        <option value="${lista.getNombreEquipo()}">${lista.getNombreEquipo()} </option>
                                    </c:forEach>
                                </select> 
                                <button class="btn btn-primary" value="Registar" name="btnAccion">Inscribir</button>
                            </div>
                        </form>

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
