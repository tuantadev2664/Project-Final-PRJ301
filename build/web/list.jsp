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
<<<<<<< HEAD
                <div class="col-lg-4 col-md-4 col-6 col-6">
                    <div class="product-item">
                        <a class="thumb" href="detail?productCode=${o.productCode}" title="${o.productName}">
                            <!--https://monatabluelight.com/tee-tele-bear-pd267.html-->
                            <img class="img-fluid" src="${o.productImages.get(0)}" data-src="${o.productImages.get(0)}" data-hover="${((o.productImages.get(1)!= null)?o.productImages.get(1): o.productImages.get(0))}" alt="${o.productName}">
                        </a>
                        <h4 class="heading">
                            <a href="detail?productCode=${o.productCode}" title="${o.productName}">${o.productName}</a>
                        </h4>
                        <!--https://monatabluelight.com/tee-tele-bear-pd267.html-->
                        <div class="info">${o.productStatus}</div>
                        <div class="price" >
                            &nbsp; ${o.productPrice} &nbsp;&nbsp;
                            <span>${((o.productOldPrice != "N/A")? o.productOldPrice: "")} </span>
=======
                    <div class="col-lg-4 col-md-4 col-6 col-6">
                        <div class="product-item">
                            <a class="thumb" href="" title="${o.productName}">
                                <!--https://monatabluelight.com/tee-tele-bear-pd267.html-->
                                <img class="img-fluid" src="${o.productImages.get(0)}" data-src="${o.productImages.get(1)}" data-hover="${o.productImages.get(2)}" alt="Tee Tele Bear">
                            </a>
                            <h4 class="heading"><a href="" title="${o.productName}">${o.productName}</a></h4>
                            <!--https://monatabluelight.com/tee-tele-bear-pd267.html-->
                            <div class="info">${o.productStatus}</div>
                            <div class="price">
                                ${o.productPrice} &nbsp;&nbsp;
                                <span>${((o.productOldPrice != "N/A")? o.productOldPrice : "")} </span>
                            </div>
>>>>>>> 4d2f0dc5eec0371035864b04a98d44ccbe1a115f
                        </div>
                    </div><!--end: .col-lg-3-->
                </c:forEach>
            </div><!-- /.row-products-->


            <nav aria-label="Page navigation example">
                <ul class="pagination">
                    <c:forEach begin="1" end="${endP}" var="u">
                        <li class="page-item ${tagH==u?"active":""}">
                            <a class="page-link" href="list?index=${u}">
                                ${u}
                            </a>
                        </li>
                    </c:forEach>
                    <li class="page-item">
                        <b>..</b>
                    </li>
                    <li class="page-item">
                        <a class="page-link" title="Next page" href="/san-pham/page-2.html">
                            →
                        </a>
                    </li>
                </ul>
            </nav>    
        </div><!-- /.col-lg-9-->

        <script language="javascript" type="text/javascript" src="https://monatabluelight.com/modules/products/assets/js/cat.js?v=1716981831"></script>
        <script language="javascript" type="text/javascript" src="https://monatabluelight.com/templates/default/js/bootstrap.min.js?v=1716981831"></script>
        <script language="javascript" type="text/javascript" src="https://monatabluelight.com/templates/default/js/library.js?v=1716981831"></script>
        <script language="javascript" type="text/javascript" src="https://monatabluelight.com/templates/default/js/slick.min.js?v=1716981831"></script>
    </body>
</html>
