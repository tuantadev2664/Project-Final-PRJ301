<%-- 
    Document   : adminHome
    Created on : Jul 7, 2024, 12:07:44 AM
    Author     : ADMIN
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page contentType="text/html" pageEncoding="UTF-8"
        import ="model.Account"
        import ="model.Address"
        import ="java.util.List"
        import ="java.util.ArrayList"%>

<head>
    <title>Giao diện quản lí bán hàng</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: white;
            color: black;
        }

        header {
            background-color: gray;
            color: white;
            padding: 10px;
            display: flex;
            align-items: center;
            justify-content: center; /* Căn chỉnh các phần tử theo chiều ngang */

        }

        header img {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            margin-right: 10px;
        }

        nav {
            background-color: white;
            width: 20%;
            height: 100vh;
            padding: 10px;
            float: left;

        }

        nav ul {
            list-style-type: none;
            padding: 0;
            margin: 0;
            justify-content: center;
        }

        nav li {
            margin-bottom: 10px;
        }

        .content {
            margin-left: 20%;
            padding: 10px;
            display: none; /* Ẩn tất cả các phần tử .content ban đầu */
        }

        .content h2 {
            margin-top: 0;
        }

        .content p {
            margin-bottom: 10px;
        }

        .content td th{
            text-align: center;

        }

        .button {
            width: 100%;
            height: 50px;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            font-family: Arial, sans-serif;
            font-weight: bold;
            background-color: black;
            color: white;
            cursor: pointer;
            transition: background-color 0.3s;
            text-align: center;
        }

        .button:hover {
            background-color: black;
        }

        .logout-button {
            padding: 10px 20px;
            font-family: Arial, sans-serif;
            font-weight: bold;
            background-color: black;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .function-button {
            background-color: black;
            border: none;
            color: white;
            padding: 8px 16px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 14px;
            margin: 4px 2px;
            cursor: pointer;
            border-radius: 4px;
        }


        .edit-button,
        .delete-button {
            background-color: transparent;
            border: none;
            padding: 0;
            font-size: inherit;
            cursor: pointer;
        }

        .edit-button {
            color: #1E90FF;
        }

        .delete-button {
            color: red;
        }

        .edit-button:hover,
        .delete-button:hover {
            color: #737373;
            text-decoration: none;
        }




        .action-buttons {
            display: flex;
            gap: 10px;
        }

        .nav-button {
            display: block;
            width: 100%;
            padding: 15px 20px; /* tăng padding để nút to ra */
            font-size: 16px; /* tăng font size cho nút */
            background-color: black;
            color: white;
            border: none;
            border-radius: 5px;
            text-align: center;
            justify-content: center;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .nav-button:hover {
            transform: scale(0.95);
        }

        .logout-button {
            background-color: #333;
            color: #fff;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .logout-button:hover {
            background-color: #555;
        }

        h1 {
            text-align: center;
            font-size: 48px;
            font-weight: bold;
            align-items: center;
        }

        .action-buttons {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .button-container {
            margin-bottom: 20px;
        }

        .customer-table {
            width: 90%;
            border-collapse: collapse;
            font-family: Arial, sans-serif;
        }

        .customer-table th, .customer-table td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        .add-button {
            background-color: #000;
            color: #fff;
            padding: 12px 24px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            transition: all 0.3s ease;
            margin-bottom: 20px;
        }

        .add-button:hover {
            background-color: #fff;
            color: #000;
            transform: scale(1.1);
        }




    </style>
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

            // Add event listeners to the buttons
            manageUserBtn.addEventListener('click', function () {
                showContent(manageUserDiv);
                setButtonColor(manageUserBtn, '#808080');
                setButtonColor(manageProductBtn, '#FFFFFF');
                setButtonColor(manageOrderBtn, '#FFFFFF');
                setButtonColor(statisticBtn, '#FFFFFF');
            });

            manageProductBtn.addEventListener('click', function () {
                showContent(manageProductDiv);
                setButtonColor(manageProductBtn, '#808080');
                setButtonColor(manageUserBtn, '#FFFFFF');
                setButtonColor(manageOrderBtn, '#FFFFFF');
                setButtonColor(statisticBtn, '#FFFFFF');
            });

            manageOrderBtn.addEventListener('click', function () {
                showContent(manageOrderDiv);
                setButtonColor(manageOrderBtn, '#808080');
                setButtonColor(manageUserBtn, '#FFFFFF');
                setButtonColor(manageProductBtn, '#FFFFFF');
                setButtonColor(statisticBtn, '#FFFFFF');
            });

            statisticBtn.addEventListener('click', function () {
                showContent(statisticDiv);
                setButtonColor(statisticBtn, '#808080');
                setButtonColor(manageUserBtn, '#FFFFFF');
                setButtonColor(manageProductBtn, '#FFFFFF');
                setButtonColor(manageOrderBtn, '#FFFFFF');
            });

            function showContent(contentDiv) {
                var allContentDivs = document.querySelectorAll('.content');
                for (var i = 0; i < allContentDivs.length; i++) {
                    allContentDivs[i].style.display = 'none';
                }
                contentDiv.style.display = 'block';
            }

            function setButtonColor(button, color) {
                button.style.color = color;
                button.style.cursor = (color === '#808080') ? 'not-allowed' : 'pointer';
            }
        });
//
//        document.getElementById('manage-user-btn').addEventListener('click', function () {
//            window.location.href = 'manageaccountfffffff';
//        });
//
//        document.getElementById('manage-product-btn').addEventListener('click', function () {
//            window.location.href = 'manageproduct';
//        });
        
        function editAccount(id) {
            window.location.href = 'manageaccountupdate?id=' + id;
        }

        function deleteAccount(id) {
            if (confirm("Are you sure you want to delete this cusount?")) {
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


        var includeSectionVisible = false;
        function toggleIncludePage() {
            var includeSection = document.getElementById("includeSection");
            includeSectionVisible = !includeSectionVisible;
            var allContentDivs = document.querySelectorAll('.content');
            for (var i = 0; i < allContentDivs.length; i++) {
                allContentDivs[i].style.display = 'none';
            }
            if (includeSectionVisible) {
                includeSection.style.display = "block";
            } else {
                includeSection.style.display = "none";
            }
        }
    </script>

</head>

<body>
    <header>
        <h1>ADMIN</h1>
    </header>
    <nav>
        <ul>
            <li><button id="manage-user-btn" class="nav-button">Quản lý khách hàng</button></li>
            <li><button id="manage-product-btn" class="nav-button">Quản lý sản phẩm</button></li>
            <li><button id="manage-order-btn" class="nav-button">Quản lý đơn hàng</button></li>
            <li><button id="statistic-btn" class="nav-button">Thống kê</button></li>
            <li><button id="statistic-btn" class="nav-button"><a href="listsample" style="color:white; text-decoration: none">Trang chủ</a></button></li>
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
                    <th></th>
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
                            <div class="action-buttons d-flex justify-content-center">
                                <button class="function-button edit-button" onclick="editAccount('${cus.id}')">Chỉnh sửa khách hàng</button>
                                <button class="function-button delete-button" onclick="deleteAccount('${cus.id}')">Xóa</button>
                            </div>
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
                    <th style="text-align:center">Product Image</th>
                    <th></th>
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
                        <td style="text-align:center"><img src="${pro.productImagesLarge.get(0)}" alt="Product Image" style="width:50%; text-align: center"></td>
                        <td>
                                <button class="function-button edit-button">Chỉnh sửa</button>
                                <button class="function-button delete-button" onclick="deleteProduct('${pro.productCode}')">Xóa</button>
                            </div>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>         
    </div>

    <div class="content" id="manage-order">
        <div>Chỉ xem đơn hàng</div>             
    </div>

    <div class="content" id="statistic">
        <div>Thống kê (làm nếu dư thời gian)</div>             
    </div>

    <!--<div id="includeSection" style="display: none;">
    <jsp:include page="adminAccountAdd.jsp" />
</div>-->





</body>

</html>
