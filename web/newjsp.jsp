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
        <h1>Hello World!</h1>
        <img id="product-image" class="img-fluid" src="${listP.productImagesOrigin.get(1)}">
         <img src="${listP.productColorList.get(0).getColorLinkString()}">
          <img src="${listP.productColorList.get(1).getColorLinkString()}">
          
          <h1 class="detail-name">
                        ${listP.productName}
                        <span>[${listP.productSale}]</span>
                    </h1>
                    
                    <div class="row code-status">
                        <div class="col-md-6">Mã sản phẩm: 
                            <b id="product-code">${listP.productCode}</b>
                        </div>
                        <div class="col-md-6">Tình trạng: 
                            <b>${listP.productStatus}</b>
                        </div>
                    </div>
                    
                    <div class="detail-price">
                          ${listP.productPrice}                                  
                    </div>
                    
                    <div class="detail-summary">
                        <c:forEach items="${listP.productDescription}" var="o2">
                        <p>${o2}</p>
                        </c:forEach>      
                    </div>
                        
                        
                        <div >
                            <div >Size</div>
                           
                            <c:forEach items="${listP.productSize}" var="o3">
       
                                <button  value="">${o3}</button>
                            </c:forEach>
                        </div>
                    
    </body>
</html>
