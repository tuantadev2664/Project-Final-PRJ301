<%-- 
    Document   : list
    Created on : May 30, 2024, 3:15:51 AM
    Author     : FPTSHOP
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link type="image/x-icon" href="images/Premium Vector _ Men's fashion store logo design template_vector illustration.jpg" rel="icon">


        <link rel="stylesheet" href="css/bootstrapheader.css"> 
        <link rel="stylesheet" href="css/styleheader.css">


        <script language="javascript" type="text/javascript" src="https://monatabluelight.com/templates/default/js/jquery.min.js"></script>
        <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&amp;display=swap" rel="stylesheet">

        <link rel="stylesheet" type="text/css" media="screen" href="https://monatabluelight.com/templates/default/css/jquery.fancybox.min.css?v=1717149127"> 
        <link rel="stylesheet" type="text/css" media="screen" href="https://monatabluelight.com/templates/default/css/bootstrap.css?v=1717149127"> 
        <link rel="stylesheet" type="text/css" media="screen" href="https://monatabluelight.com/templates/default/css/style.css?v=1717149127"> 


    </head>
    <body>
        <div class="col-lg-9">
            <div class="block-banner-default">
            </div>                
            <div class="row row-products">
                <c:forEach items="${listP}" var="o">
                    <div class="col-lg-4 col-md-4 col-6 col-6">
                        <div class="product-item">
                            <a class="thumb" href="detail?productCode=${o.productCode}" title="${o.productName}">
                                <!--https://monatabluelight.com/tee-tele-bear-pd267.html-->
                                <img class="img-fluid" src="${o.productImagesLarge.get(0)}" data-src="${o.productImagesLarge.get(0)}" data-hover="${((o.productImagesLarge.get(1)!= null)?o.productImagesLarge.get(1): o.productImagesLarge.get(0))}" alt="${o.productName}">
                            </a>
                            <h4 class="heading">
                                <a href="detail?productCode=${o.productCode}" title="${o.productName}">${o.productName}</a>
                            </h4>
                            <!--https://monatabluelight.com/tee-tele-bear-pd267.html-->
                            <div class="info">${o.productStatus}</div>
                            <div class="price" >
                                &nbsp; ${o.productPrice} &nbsp;&nbsp;
                                <span>${((o.productOldPrice != "N/A")? o.productOldPrice: "")} </span>
                            </div>
                        </div>
                    </div><!--end: .col-lg-3-->
                </c:forEach>
            </div><!-- /.row-products-->


            <nav aria-label="Page navigation example">
                <ul class="pagination">
                    <c:if test="${tagH > 1}">
                        <li class="page-item">
                            <c:choose>
                                <c:when test="${not empty param.categoryID}">
                                    <a class="page-link" href="category?categoryID=${param.categoryID}&index=${tagH-1}">
                                        ←
                                    </a>
                                </c:when>
                                <c:otherwise>
                                    <a class="page-link" href="list?index=${tagH - 1}">
                                        ←
                                    </a>
                                </c:otherwise>
                            </c:choose>  
                        </li>
                    </c:if>
                    <c:forEach begin="1" end="${endP}" var="u">
                        <li class="page-item ${tagH==u?"active":""}">
                            <c:choose>
                                <c:when test="${not empty param.categoryID}">
                                    <a class="page-link" href="category?categoryID=${param.categoryID}&index=${u}">
                                        ${u}
                                    </a>
                                </c:when>
                                <c:otherwise>
                                    <a class="page-link" href="list?index=${u}">
                                        ${u}
                                    </a>
                                </c:otherwise>
                            </c:choose>
                        </li>
                    </c:forEach>
                    <c:if test="${tagH < endP}">
                        <li class="page-item">
                            <c:choose>
                                <c:when test="${not empty param.categoryID}">
                                    <a class="page-link" href="category?categoryID=${param.categoryID}&index=${tagH+1}">
                                        →
                                    </a>
                                </c:when>
                                <c:otherwise>
                                    <a class="page-link" href="list?index=${tagH + 1}">
                                        →
                                    </a>
                                </c:otherwise>
                            </c:choose>     
                        </li>
                    </c:if>
                </ul>
            </nav>  
        </div><!-- /.col-lg-9-->

        <script language="javascript" type="text/javascript" src="https://monatabluelight.com/modules/products/assets/js/cat.js?v=1716981831"></script>
        <script language="javascript" type="text/javascript" src="https://monatabluelight.com/templates/default/js/bootstrap.min.js?v=1716981831"></script>
        <script language="javascript" type="text/javascript" src="https://monatabluelight.com/templates/default/js/library.js?v=1716981831"></script>
        <script language="javascript" type="text/javascript" src="https://monatabluelight.com/templates/default/js/slick.min.js?v=1716981831"></script>
    </body>
</html>
