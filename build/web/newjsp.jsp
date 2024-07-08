<%-- 
    Document   : newjsp
    Created on : Jun 10, 2024, 4:30:00 PM
    Author     : FPTSHOP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>


    </head>
    <body>
        <h1>here</h1>
        <c:forEach items="${listP}" var="o">
        <swiper-slide > 
            <div class="banner2-item">
                <div class="product-item">
<!--
                    <a class="thumb" href="detail?productCode=${o.productCode}" title="${o.productName}">
                        https://monatabluelight.com/tee-tele-bear-pd267.html
                        <img class="img-fluid" src="${o.productImagesLarge.get(0)}" data-src="${o.productImagesLarge.get(0)}" data-hover="${o.productImagesLarge.get(1)}" alt="Tee Tele Bear">
                    </a>
                    <h4 class="heading"><a href="detail?productCode=${o.productCode}" title="${o.productName}">${o.productName}</a></h4>
                    https://monatabluelight.com/tee-tele-bear-pd267.html
                    <div class="info">${o.productStatus}</div>
                    <div class="price">
                        ${o.productPrice} &nbsp;&nbsp;
                        <span>${((o.productOldPrice != "N/A")? o.productOldPrice : "")} </span>
                    </div>-->

                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </div>
            </div>

        </swiper-slide>
    </c:forEach>

</body>
</html>