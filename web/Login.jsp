<%-- 
    Document   : Login
    Created on : 01-09-2018, 19:11:49
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
        <jsp:include page="Menus/menu.jsp"></jsp:include>

            <!--inicio del contenido-->
            <div class="container">
                <div class="row justify-content-md-center">
                    <div class="col-sm-6">
                        <form action="ProcesoUsuario" method="POST">
                            <div class="card" style="margin-top: 20%">
                                <div class="card-body">
                                    <h1 class="text-center">Login</h1>
                                    <hr>
                                    <div class="form-group">
                                        <label>Correo: </label>
                                        <input type="email" value="${correo}" name="txtCorreo" placeholder="example@example.com" class="form-control"/>
                                </div>
                                <div class="form-group">
                                    <label>Contraseña: </label>
                                    <input type="password" name="txtPass" placeholder="***********" minlength="4" class="form-control"/>
                                </div>
                                <div class="form-group text-center">
                                    <button class="btn btn-primary btn-lg " type="submit"  name="btnAccion" value="Acceder">Acceder</button>
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
    </body>
</html>
