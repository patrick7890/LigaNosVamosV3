<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${sesUsu==null}">
    <c:redirect url="/Index.jsp"></c:redirect>
</c:if>
<%-- 
    Document   : administrar
    Created on : 08-09-2018, 11:40:21
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
        <c:choose>
            <c:when test="${sesUsu.getTipoUsuario().getIdTipoUsuario()>2}">
                <jsp:include page="../Menus/menu_Usuario.jsp"></jsp:include>
            </c:when>
            <c:when test="${sesUsu.getTipoUsuario().getIdTipoUsuario()<=2}">
                <jsp:include page="../Menus/menu_Admin.jsp"></jsp:include>
            </c:when>
        </c:choose>
        <div class="row justify-content-md-center">
            <div class="container">

                <table class="table table-hover">
                    <thead>
                    <th>Nombre</th>
                    <th>password</th>
                    <th>Tipo</th>
                    <th>Correo</th>
                    <th colspan="2">Accion</th>
                    </thead>
                    <c:forEach var="list" items="${listaUsu}">
                        <tr>
                        <form method="GET" action="../ProcesoUsuario">
                            <td> <input type="text" class="form-control" name="txtNombre" value="${list.getNombreUsuario()}"/></td>
                            <td> <input type="password" class="form-control" name="txtPass" value="${list.getPassUsuario()}"/></td>
                            <td> <select readonly="" class="form-control" name="ddlTipo" ><option value="${list.getTipoUsuario().getIdTipoUsuario()}"><c:out value="${list.getTipoUsuario().getDescripcion()}"/></option>></select></td>
                            <td> <input readonly="" type="text" class="form-control" name="txtCorreo" value="${list.getCorreoUsuario()}"/></td>
                            <input type="hidden" name="idUsu" value="${list.getNombreUsuario()}"/>
                            <td><button type="submit" class="btn btn-primary" name="btnAccion" value="Actualizar">Actualizar</button></td>
                            <td><button type="submit" class="btn btn-danger" name="btnAccion" value="Eliminar">Eliminar</button></td>
                        </form>

                        </tr>
                    </c:forEach>
                </table>
                <form method="GET" action="../ProcesoUsuario">
                    <button type="submit" value="Listar" name="btnAccion" class="btn btn-success">Listar</button>
                </form>
                <c:if test="${mensaje!=null}" >
                    ${mensaje}
                </c:if>
                <c:remove var="mensaje" />
            </div>
        </div>
    </body>
</html>
