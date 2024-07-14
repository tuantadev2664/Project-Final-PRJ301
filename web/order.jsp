<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Manage Orders</title>
    <style>
        table {
            border-collapse: collapse;
            width: 100%;
        }
        th, td {
            border: 1px solid black;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
    <h1>Orders</h1>
    <c:forEach items="${orders}" var="order">
        <h2>Order ID: ${order.orderId}</h2>
        <table>
            <tr>
                <th>Account ID</th>
                <th>Order Date</th>
                <th>Name</th>
                <th>Phone</th>
                <th>Email</th>
                <th>City</th>
                <th>District</th>
                <th>Ward</th>
                <th>Address</th>
                <th>Quantity</th>
                <th>Total</th>
            </tr>
            <tr>
                <td>${order.accountId}</td>
                <td>${order.orderDate}</td>
                <td>${order.name}</td>
                <td>${order.phone}</td>
                <td>${order.email}</td>
                <td>${order.city}</td>
                <td>${order.district}</td>
                <td>${order.ward}</td>
                <td>${order.address}</td>
                <td>${order.quantity}</td>
                <td>${order.total}</td>
            </tr>
        </table>

        <h3>Order Details</h3>
        <table>
            <tr>
                <th>Product ID</th>
                <th>Color</th>
                <th>Size</th>
                <th>Quantity</th>
            </tr>
            <c:forEach items="${orderDetailsMap[order.orderId]}" var="orderDetail">
                <tr>
                    <td>${orderDetail.productId}</td>
                    <td>${orderDetail.color}</td>
                    <td>${orderDetail.size}</td>
                    <td>${orderDetail.quantity}</td>
                </tr>
            </c:forEach>
        </table>
    </c:forEach>
</body>
</html>