<%-- 
    Document   : Home.jsp
    Created on : May 30, 2024, 10:35:58 AM
    Author     : FPTSHOP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product | group 5</title>
        
        
        <link type="image/x-icon" href="images/Premium Vector _ Men's fashion store logo design template_vector illustration.jpg" rel="icon">
        
        
        <link rel="stylesheet" href="css/bootstrapheader.css"> 
        <link rel="stylesheet" href="css/styleheader.css">
        
    </head>
    <body >
        <div id="header_tab">
            <jsp:include page="header.jsp"/>
        </div>
        <div class="clr"></div>
        
        <div id='banner_tab'>
            <jsp:include page="banner.jsp"/>
            <jsp:include page="banner1.jsp"/>
            <jsp:include page="banner2.jsp"/>
            <jsp:include page="banner3.jsp"/>
        </div>
            
        <div id="footer_tab">
            <jsp:include page="footer.jsp"/>
        </div>
        <div class="clr"></div>
    </body>
</html>
