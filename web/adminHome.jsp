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
            background-color: black;
            color: white;
            padding: 10px;
            display: flex;
            align-items: center;
            justify-content: space-between; /* Căn chỉnh các phần tử theo chiều ngang */

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
        }

        .button:hover {
            background-color: gray;
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

        .logout-button:hover {
            background-color: gray;
        }

        .function-button {
            background-color: grey;
            color: white;
            border: none;
            border-radius: 5px;
            padding: 5px 10px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .function-button:hover {
            background-color: darkgrey;
        }


        .action-buttons {
            display: flex;
            gap: 10px;
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

            manageUserBtn.addEventListener('click', function () {
                showContent(manageUserDiv);
            });

            manageProductBtn.addEventListener('click', function () {
                showContent(manageProductDiv);
            });

            manageOrderBtn.addEventListener('click', function () {
                showContent(manageOrderDiv);
            });

            statisticBtn.addEventListener('click', function () {
                showContent(statisticDiv);
            });

            function showContent(contentDiv) {
                var allContentDivs = document.querySelectorAll('.content');
                // Ẩn tất cả các phần tử .content
                for (var i = 0; i < allContentDivs.length; i++) {
                    allContentDivs[i].style.display = 'none';
                }
                // Hiển thị phần tử được chọn
                contentDiv.style.display = 'block';
            }
        });

        document.getElementById('manage-user-btn').addEventListener('click', function () {
            window.location.href = 'manageaccount'; // Đường dẫn tới servlet manageacc.java
        });


        function editAccount(id) {
            window.location.href = 'manageaccountupdate?id=' + id;
        }

        function deleteAccount(id) {
            if (confirm("Are you sure you want to delete this account?")) {
                window.location.href = 'manageaccountdelete?id=' + id;
            }
        }
        
        var includeSectionVisible = false;
        function toggleIncludePage() {
            var includeSection = document.getElementById("includeSection");
            includeSectionVisible = !includeSectionVisible;

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
        <button class="logout-button">Logout</button>
    </header>

    <nav>
        <ul>
            <li><button id="manage-user-btn" class="button">Quản lý khách hàng</button></li>
            <li><button id="manage-product-btn" class="button">Quản lý sản phẩm</button></li>
            <li><button id="manage-order-btn" class="button">Quản lý đơn hàng</button></li>
            <li><button id="statistic-btn" class="button">Thống kê</button></li>
        </ul>
    </nav>

    <div class="content" id="manage-user">
        <h2>Danh sách khách hàng</h2>
        <button type="submit" class="function-button" onclick="toggleIncludePage()">Thêm mới</button>
        <table border="1" width="90%" >
            <tr>
                <th>ID</th>
                <th>Username</th>
                <th>Password</th>
                <th>Fullname</th>
                <th>Email</th>
                <th>Phone</th>
                <th>Role</th>
                <th>Function</th>
            </tr>
            <% 
                List<Account> list = (List<Account>)request.getAttribute("data");
                for (Account acc : list){
                    int id = acc.getId();
                    String username = acc.getUsername();
                    String password = acc.getPassword();
                    String fullname = acc.getFullname();
                    String email = acc.getEmail();
                    String phone = acc.getPhone();
                    int role = acc.getRole();              
            %>
            <tr>
                <td><%= id %></td>
                <td><%= username %></td>
                <td><%= password %></td>
                <td><%= fullname %></td>
                <td><%= email %></td>
                <td><%= phone %></td>
                <td><%= role %></td>
                <td>
                    <div class="action-buttons">
                        &nbsp;&nbsp;&nbsp;
                        <button class="function-button" onclick="editAccount('<%= id %>')">Sửa</button> &nbsp;
                        <button class="function-button" onclick="deleteAccount('<%= id %>')">Xóa</button>
                    </div>
                </td>
            </tr>
            <%
                }
            %>
        </table>
    </div>

    <div class="content" id="manage-product">
        <div>Xem, thêm, sửa, xóa sản phẩm</div>             
    </div>

    <div class="content" id="manage-order">
        <div>Chỉ xem đơn hàng</div>             
    </div>

    <div class="content" id="statistic">
        <div>Thống kê (làm nếu dư thời gian)</div>             
    </div>

    <div id="includeSection" style="display: none;">
        <jsp:include page="adminAccountAdd.jsp" />
    </div>
    
    
    
    

</body>

</html>
