<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page contentType="text/html" pageEncoding="UTF-8"
        import ="model.Account"
        import ="model.Address"
        import ="java.util.List"
        import ="java.util.ArrayList"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Giao diện quản lí bán hàng</title>
    <style>
        :root {
            --primary-color: #000000;
            --secondary-color: #ffffff;
            --accent-color: #808080;
            --background-color: #f0f0f0;
            --text-color: #333333;
        }

        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: var(--background-color);
            color: var(--text-color);
            display: flex;
            flex-direction: column;
        }

        header {
            background-color: var(--primary-color);
            color: var(--secondary-color);
            padding: 20px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }

        header h1 {
            text-align: center;
            font-size: 36px;
            margin: 0;
        }

        .main-container {
            display: flex;
            flex-grow: 1;
        }

        nav {
            background-color: var(--primary-color);
            width: 250px;
            height: 100vh;
            padding: 20px;
            box-shadow: 2px 0 5px rgba(0,0,0,0.1);
        }

        nav ul {
            list-style-type: none;
            padding: 0;
            margin: 0;
        }

        nav li {
            margin-bottom: 15px;
        }

        .nav-button {
            display: block;
            width: 100%;
            padding: 15px 20px;
            font-size: 16px;
            background-color: transparent;
            color: var(--secondary-color);
            border: 2px solid var(--secondary-color);
            border-radius: 5px;
            cursor: pointer;
            transition: all 0.3s ease;
            text-align: center;
        }

        .nav-button:hover, .nav-button.active {
            background-color: var(--secondary-color);
            color: var(--primary-color);
            transform: scale(0.98);
        }

        .content {
            flex-grow: 1;
            padding: 20px;
            display: none;
        }

        .content h2 {
            margin-top: 0;
            color: var(--primary-color);
        }

        .customer-table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0 15px;
            margin-top: 20px;
        }

        .customer-table th {
            background-color: var(--primary-color);
            color: var(--secondary-color);
            padding: 15px;
            text-align: left;
        }

        .customer-table td {
            background-color: var(--secondary-color);
            padding: 15px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }

        .customer-table tbody tr:hover {
            background-color: var(--accent-color);
            color: var(--secondary-color);
            transition: all 0.3s ease;
        }

        .function-button {
            background-color: var(--primary-color);
            color: var(--secondary-color);
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .function-button:hover {
            background-color: var(--accent-color);
            transform: translateY(-2px);
            box-shadow: 0 2px 5px rgba(0,0,0,0.2);
        }

        .edit-button {
            background-color: var(--accent-color);
        }

        .delete-button {
            background-color: #404040;
        }

        .add-button {
            background-color: var(--primary-color);
            margin-bottom: 20px;
            font-weight: bold;
            font-size: 16px;
            padding: 12px 24px;
        }

        .vieworder-button {
            background-color: var(--primary-color);
        }

        .vieworder-button:hover {
            background-color: var(--accent-color);
        }
    </style>
</head>
<body>
    <header>
        <h1>MANAGE PAGE FOR ADMIN</h1>
    </header>
    
    <div class="main-container">
        <nav>
            <ul>
                <li><button id="manage-user-btn" class="nav-button">Quản lý khách hàng</button></li>
                <li><button id="manage-product-btn" class="nav-button">Quản lý sản phẩm</button></li>
                <li><button id="manage-order-btn" class="nav-button">Quản lý đơn hàng</button></li>
                <li><button id="statistic-btn" class="nav-button">Thống kê</button></li>
            </ul>
        </nav>

        <div class="content" id="manage-user">
            <h2>Danh sách khách hàng</h2>
            <button class="function-button add-button" onclick="addAccount()">Thêm khách hàng</button>
            <table class="customer-table">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Username</th>
                        <th>Fullname</th>
                        <th>Email</th>
                        <th>Phone</th>
                        <th>Role</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${data}" var="cus">
                        <tr>
                            <td>${cus.id}</td>
                            <td>${cus.username}</td>
                            <td>${cus.fullname}</td>
                            <td>${cus.email}</td>
                            <td>${cus.phone}</td>
                            <td>${cus.role}</td>
                            <td>
                                <button class="function-button edit-button" onclick="editAccount('${cus.id}')">Chỉnh sửa</button>
                                <button class="function-button delete-button" onclick="deleteAccount('${cus.id}')">Xóa</button>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>

        <div class="content" id="manage-product">
            <h2>Danh sách sản phẩm</h2>
            <button class="function-button add-button" onclick="addProduct()">Thêm sản phẩm</button>
            <table class="customer-table">
                <thead>
                    <tr>
                        <th>Product Code</th>
                        <th>Product Name</th>
                        <th>Product Status</th>
                        <th>Product Price</th>
                        <th>Product Old Price</th>
                        <th>Product Image</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${allP}" var="pro">
                        <tr>
                            <td>${pro.productCode}</td>
                            <td>${pro.productName}</td>
                            <td>${pro.productStatus}</td>
                            <td>${pro.productPrice}</td>
                            <td>${pro.productOldPrice}</td>
                            <td><img src="${pro.productImagesLarge.get(0)}" alt="Product Image" style="width:50px; height:50px;"></td>
                            <td>
                                <button class="function-button edit-button">Chỉnh sửa</button>
                                <button class="function-button delete-button" onclick="deleteProduct('${pro.productCode}')">Xóa</button>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>         
        </div>

        <div class="content" id="manage-order">
            <h2>Danh sách đơn hàng</h2>
            <table class="customer-table">
                <thead>
                    <tr>
                        <th>Order ID</th>
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
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${orders}" var="order">
                        <tr>
                            <td>${order.orderId}</td>
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
                            <td>
                                <button class="function-button vieworder-button" onclick="showOrderDetails('${order.orderId}')">Chi tiết</button>
                            </td>
                        </tr>
                    </c:forEach>  
                </tbody>
            </table>
        </div>

        <div class="content" id="statistic">
            <h2>Thống kê</h2>
            <p>Thống kê (làm nếu dư thời gian)</p>             
        </div>
    </div>
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            var manageUserBtn = document.querySelector('#manage-user-btn');
            var manageProductBtn = document.querySelector('#manage-product-btn');
            var manageOrderBtn = document.querySelector('#manage-order-btn');
            var statisticBtn = document.querySelector('#statistic-btn');

            var manageUserDiv = document.querySelector('#manage-user');
            var manageProductDiv = document.querySelector('#manage-product');
            var manageOrderDiv = document.querySelector('#manage-order');
            var statisticDiv = document.querySelector('#statistic');

            function showContent(contentDiv) {
                var allContentDivs = document.querySelectorAll('.content');
                for (var i = 0; i < allContentDivs.length; i++) {
                    allContentDivs[i].style.display = 'none';
                }
                contentDiv.style.display = 'block';
            }

            function setActiveButton(button) {
                var allButtons = document.querySelectorAll('.nav-button');
                for (var i = 0; i < allButtons.length; i++) {
                    allButtons[i].classList.remove('active');
                }
                button.classList.add('active');
            }

            manageUserBtn.addEventListener('click', function () {
                showContent(manageUserDiv);
                setActiveButton(manageUserBtn);
            });

            manageProductBtn.addEventListener('click', function () {
                showContent(manageProductDiv);
                setActiveButton(manageProductBtn);
            });

            manageOrderBtn.addEventListener('click', function () {
                showContent(manageOrderDiv);
                setActiveButton(manageOrderBtn);
            });

            statisticBtn.addEventListener('click', function () {
                showContent(statisticDiv);
                setActiveButton(statisticBtn);
            });

            // Show manage user content by default
            showContent(manageUserDiv);
            setActiveButton(manageUserBtn);
        });

        function editAccount(id) {
            window.location.href = 'manageaccountupdate?id=' + id;
        }

        function deleteAccount(id) {
            if (confirm("Are you sure you want to delete this account?")) {
                window.location.href = 'manageaccountdelete?id=' + id;
            }
        }

        function deleteProduct(id) {
            if (confirm("Are you sure you want to delete this product?")) {
                window.location.href = 'deleteproduct?id=' + id;
            }
        }

        function addAccount() {
            window.location.href = 'manageaccountadd';
        }

        function addProduct() {
            window.location.href = 'addproduct';
        }

        function showOrderDetails(orderId) {
            window.location.href = 'manageorderdetail?id=' + orderId;
        }
    </script>
</body>
</html>