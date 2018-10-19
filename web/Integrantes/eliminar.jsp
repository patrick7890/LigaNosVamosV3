<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${sesUsu==null}">
    <c:redirect url="/Index.jsp"></c:redirect>
</c:if>
<%-- 
    Document   : eliminar
    Created on : 01-09-2018, 21:13:09
    Author     : Lennon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Eliminar Integrantes</title>
    </head>
    <body>

        <!--inicio del contenido-->
        <div class="container">
            <div class="row justify-content-center">
                <form method="post" action="../ProcesoIntegrantes" enctype="multipart/form-data">
                    <input type="file" name="txtImg" accept="image/*" onchange="loadFile(event)"/>

                    <input type="submit" value="enviar">
                </form>
                <img id="output"/>
                <script>
                    var loadFile = function (event) {
                        var output = document.getElementById('output');
                        output.src = URL.createObjectURL(event.target.files[0]);
                    };
                </script>
            </div>
        </div>
        <!--fin del contenido-->


    </body>
</html>
