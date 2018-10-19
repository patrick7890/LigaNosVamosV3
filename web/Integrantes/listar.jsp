<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${sesUsu==null}">
    <c:redirect url="/Index.jsp"></c:redirect>
</c:if>
<%-- 
    Document   : listar
    Created on : 01-09-2018, 22:05:06
    Author     : Lennon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>



        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <!--Menu -->
        <jsp:include page="../Menus/menu_Usuario.jsp"></jsp:include>          

        
        1
        
        <div class="row">
            <div class=" col-12 col-sm-12 col-md-6 col-xl-4 mt-2 ">
                <a href="https://tumangaonline.me/groups/108/Last-Heaven-Fansub">
                    <div class="thumbnail group group-thumbnail-108">
                        <style>
                            .group-thumbnail-108::before{
                                background-image: url('https://img1.tumangaonline.me/images/groups/banner/108_57129db80cf01.jpg');
                            }
                        </style>
                        <div class="thumbnail-title">
                            <h4 class="text-truncate" title="Last Heaven Fansub">Last Heaven Fansub</h4>
                        </div>
                        <span class="followers"><i class="fas fa-users fa-fw"></i><span>5094</span></span>
                        <span class="book-type badge badge-scanlation">SCANLATION</span>
                    </div>
                </a>
            </div>
        </div>
        
        
        
    </body>
</html>
