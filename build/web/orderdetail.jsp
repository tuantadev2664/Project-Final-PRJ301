<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Order Detail</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            body {
                background-color: #f8f9fa;
            }
            .order-detail-container {
                background-color: #ffffff;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0,0,0,0.1);
                padding: 20px;
                margin-top: 50px;
            }
            h1 {
                color: #333;
                margin-bottom: 20px;
            }
            .table-responsive {
                margin-top: 20px;
            }
            .table {
                background-color: #ffffff;
            }
            .table th {
                background-color: #333;
                color: #ffffff;
            }
            .back-button {
                margin-top: 20px;
            }
            .btn-dark {
                background-color: #333;
                border-color: #333;
            }
            .btn-dark:hover {
                background-color: #555;
                border-color: #555;
            }
            .table td {
                vertical-align: middle;
                text-align: center;
            }
            
        </style>
    </head>
    <body>
        <div class="container order-detail-container">
            <h1 class="text-center">Order Detail</h1>
            <div class="table-responsive">
                <table class="table table-striped table-hover">
                    <thead>
                        <tr class="text-center">
                            <th>Product ID</th>
                            <th>Color</th>
                            <th>Size</th>
                            <th>Quantity</th>
                            <th>Image</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${orderDetailsMap}" var="detail">
                            <tr>
                                <td class="align-middle">${detail.productId}</td>
                                <td class="align-middle">${detail.color}</td>
                                <td class="align-middle">${detail.size}</td>
                                <td class="align-middle">${detail.quantity}</td>


                                <td class="align-middle">
                                    <img src="${detail.img}" alt="Product Image" style="width: 200px; height: 150px; object-fit: cover;">
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
            <div class="text-center back-button">
                <a href="manageaccount" class="btn btn-dark">Back to Home</a>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>