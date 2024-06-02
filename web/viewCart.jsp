<%@ page contentType="text/html; charset=UTF-8" import="controller.*, Model.*, java.util.*, dao.*" %>

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
    <div class="container">
        <h2>Products</h2>
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
                <% 
                for (int i = 0; i < ProductServlet.listCart.size(); i++) {
                    Cart cart = ProductServlet.listCart.get(i);
                %>
                <tr>
                    <td><%= cart.getProduct().getId() %></td>
                    <td><%= cart.getProduct().getName() %></td>
                    <td><%= cart.getProduct().getPrice() %></td>
                    <td><%= cart.getQuantity() %></td>
                    <td><a class="btn btn-danger btn-sm" href="ProductServlet?action=Remove&index=<%=i%>">Remove</a></td>
                </tr>
                <% 
                }
                %>
            </tbody>
        </table>
    </div>
</body>
</html>