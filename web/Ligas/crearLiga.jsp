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


<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
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

        <!--inicio del contenido-->
        <div class="container">
            <div class="row justify-content-md-center">
                <div class="col-sm-6">
                    <form action="../ProcesoLiga" method="GET" enctype = "multipart/form-data">
                        <div class="card" style="">
                            <div class="card-body">
                                <h1 class="text-center">Registro de Ligas</h1>
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
                                    <sql:setDataSource var = "nosvamos" driver = "com.mysql.jdbc.Driver"
                                                       url = "jdbc:mysql://localhost:3306/nosvamosv2?zeroDateTimeBehavior=convertToNull"
                                                       user = "juan"  password = "123456"/>
                                    <sql:query var="Lista" dataSource="${nosvamos}">
                                        SELECT * FROM TIPO_LIGA
                                    </sql:query>
                                    <select class="form-control" name="ddlTipo">
                                        <option>Elige Una Opcion</option>
                                        <c:forEach var="list" items="${Lista.rows}">
                                            <option value="${list.idtipo_liga}">
                                                <c:out value="${list.descripcion}"/>
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
