<%@ page contentType="text/html; charset=UTF-8" import="controller.*, model.*, java.util.*, dao.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <div class="container">

            <a class="btn btn-primary btn-sm" href="home.jsp">Add more</a>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Ma SP</th>
                        <th>Ten SP</th>
                        <th>Gia</th>
                        <th>So Luong</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    
                    <c:set var="o" value="${requestScope.Cart}"/>
                    <c:forEach items="${o.listItem}" var="i" >
                        <tr>
                            <td>${i.product.productCode}</td>
                            <td>${i.product.productName}</td>
                            <td>${i.product.productPrice}</td>
                            <td>${i.quantity}</td>
                            <td><a class="btn btn-danger btn-sm" href="ProductServlet?action=Remove&index=${i}">Remove</a></td>
                        </tr>
                    </c:forEach>

                </tbody>
            </table>

        </div>
        <jsp:include page="footer.jsp"/>
    </body>
</html>