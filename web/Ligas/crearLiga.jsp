<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${sesUsu==null}">
    <c:if test="${sesUsu.getTipoUsuario().getIdTipoUsuario()>2}">
        <c:redirect url="/Index.jsp"></c:redirect>
    </c:if>
    <c:redirect url="/Index.jsp"></c:redirect>
</c:if>
<%-- 
    Document   : crearLiga
    Created on : 01-09-2018, 23:12:48
    Author     : Lennon
--%>

<%@page import="dto.TipoLiga"%>
<%@page import="java.util.List"%>
<%@page import="DAO.DAOLiga"%>
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

        <!--inicio del contenido-->
        <div class="container">
            <div class="row justify-content-md-center">
                <div class="col-sm-6">
                    <form action="../ProcesoLiga" method="GET" enctype = "multipart/form-data">
                        <div class="card" style="">
                            <div class="card-body">
                                <h1 class="text-center">Registro de Usuarios</h1>
                                <hr>
                                <div class="form-group">
                                    <label>Nombre De La Liga: </label>
                                    <input type="text" name="txtNombreLiga" placeholder="Ej:Internacional" minlength="4" class="form-control"/>
                                </div>
                                <div class="form-group">
                                    <label>Fecha De Inicio :    </label>
                                    <input type="date" class="form-control" name="dateFechaIni" />
                                </div>

                                <div class="form-group">
                                    <label>Fecha De Termino :  </label>
                                    <input type="date" class="form-control" name="dateFechaTer" />
                                </div>
                                <div class="form-group">
                                    <label>Luagar: </label>
                                    <input type="text" name="txtLugar" placeholder="" minlength="4" class="form-control"/>
                                </div>
                                <div class="form-group">
                                    <label>Tipo Liga: </label>
                                    <jsp:useBean id="li" class="DAO.DAOLiga" scope="page" ></jsp:useBean>
                                    <c:set  var="lista"  value="${li.ListarTipo()}"/>
                                    <select class="form-control" name="ddlTipo">
                                        <option>Elige Una Opcion</option>
                                        <c:forEach var="list" items="${lista}">
                                            <option value="${list.getIdtipoLiga()}">
                                                <c:out value="${list.getDescripcion()}"/>
                                            </option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="form-group text-center">
                                    <button class="btn btn-primary" type="submit"  name="btnAccion" value="Registar"><i class="far fa-fw fa-save"></i>Registar</button>
                                </div>
                            </div>
                        </div>
                    </form>
                    <c:if test="${mensaje!=null}" >
                        ${mensaje}
                    </c:if>
                    <c:remove var="mensaje" />

                </div>
            </div>

        </div>
        <!--fin del contenido-->






    </body>
</html>
