<%-- 
    Document   : banner2
    Created on : May 30, 2024, 2:14:29 PM
    Author     : FPTSHOP
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product | group 5</title>
        
        
        <link type="image/x-icon" href="images/Premium Vector _ Men's fashion store logo design template_vector illustration.jpg" rel="icon">
        
        
        <link rel="stylesheet" href="css/bootstrapheader.css"> 
        <link rel="stylesheet" href="css/styleheader.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        
        <style>
    html,
    body {
      position: relative;
      height: 100%;
    }

    body {
      background: #eee;
      font-family: Helvetica Neue, Helvetica, Arial, sans-serif;
      font-size: 14px;
      color: #000;
      margin: 0;
      padding: 0;
    }

    swiper-container {
      width: 100%;
      height: 100%;
    }

    swiper-slide {
      text-align: center;
      font-size: 18px;
      background: #fff;
      display: flex;
      justify-content: center;
      align-items: center;
    }

    swiper-slide img {
      display: block;
      width: 100%;
      height: 100%;
      object-fit: cover;
    }
  </style>
    </head>
    <body>
        <div class="container">
            <div class="block-heading">
                <div class="heading">
                    New Arrival            
                </div>
            </div>
            <div>
                <swiper-container class="mySwiper" pagination="true" pagination-clickable="true" slides-per-view="3"
                                  space-between="30" free-mode="true">


                    <c:forEach items="${listP}" var="o">
                        <swiper-slide>
                            <div>
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
                                    
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                </div>
                            </div>
                            
                        </swiper-slide>
                    </c:forEach>

                </swiper-container>
            </div>
        </div>


    <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-element-bundle.min.js"></script>
    </body>
</html>
