<%-- 
    Document   : account
    Created on : Jun 2, 2024, 1:26:13 AM
    Author     : DELL
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page contentType="text/html" pageEncoding="UTF-8"
        import ="model.Account"
        import ="model.Address"
        import ="java.util.List"
        import ="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/account.css"/>
        <link rel="stylesheet" href="css/bootstrapheaderlogin.css">
        <style>
            /* General Styles */
            body {
                font-family: Arial, sans-serif;
            }

            .container {
                width: 100%;
                max-width: 1200px;
                margin: 0 auto;
            }

            .row {
                display: flex;
                flex-wrap: wrap;
                margin: 0 -15px;
            }

            .col-xs-12 {
                width: 100%;
                padding: 0 15px;
            }

            .col-sm-12 {
                width: 100%;
                padding: 0 15px;
            }

            .col-lg-3, .col-lg-9 {
                padding: 0 15px;
            }

            .col-left-ac, .col-right-ac {
                margin-top: 20px;
            }

            /* Left Column Styles */
            .block-account {
                background-color: #f7f7f7;
                padding: 20px;
                border-radius: 5px;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            }

            .block-account .title-account {
                font-size: 20px;
                font-weight: bold;
                color: #333;
            }

            .block-account p {
                font-size: 16px;
                color: #333;
            }

            .block-account ul {
                list-style-type: none;
                padding: 0;
            }

            .block-account ul li {
                margin-bottom: 10px;
            }


            /* Button Styles */
            .button {
                display: inline-block;
                padding: 10px 20px;
                color: white;
                background-color: black;
                border: none;
                border-radius: 5px;
                text-decoration: none;
                font-size: 16px;
                text-align: center;
                transition: background-color 0.3s, transform 0.3s, box-shadow 0.3s;
            }

            .button:hover {
                background-color: black;
                color: #fff;
                transform: scale(1.05);
                box-shadow: 0 6px 8px rgba(0, 0, 0, 0.2);
            }

            .button:active {
                background-color: #004085;
                transform: scale(0.98);
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            }

            /* Button Styles */
            .button_address {
                display: inline-block;
                padding: 10px 25px; /* Tăng kích thước của button */
                color: white;
                background-color: black;
                border: none;
                border-radius: 5px;
                text-decoration: none;
                font-size: 16px; /* Tăng kích thước font chữ */
                text-align: center;
                transition: background-color 0.4s, transform 0.4s, box-shadow 0.4s;
            }

            .button_address:hover {
                background-color: white; /* Màu nền chuyển sang trắng */
                color: black; /* Màu chữ thay đổi khi di chuột vào */
                transform: scale(1.05); /* Hiệu ứng phóng to nhẹ */
                box-shadow: 0 0 10px rgba(0,0,0,0.3); /* Đổ bóng nhẹ */
            }

            .button_address:active {
                background-color: #004085; /* Màu nền khi button được nhấn */
                transform: scale(0.98); /* Hiệu ứng nhỏ lại */
                box-shadow: none; /* Bỏ đổ bóng */
            }

            .button_address[disabled] {
                background-color: #cccccc;
                pointer-events: none;
            }

            .button[disabled] {
                color: grey;
                cursor: not-allowed;
            }

            /* Right Column Styles */
            .title-head {
                font-size: 24px;
                font-weight: bold;
                color: #333;
            }

            .form-signup {
                background-color: #fff;
                padding: 20px;
                border-radius: 5px;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            }

            .form-signup .info-item {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 15px;
                padding: 10px 15px;
                border-bottom: 1px solid #e0e0e0;
            }

            .form-signup .info-item h3 {
                font-size: 18px;
                margin: 0;
            }

            .form-signup .info-item h3.label {
                font-weight: bold;
                color: #555;
            }

            .form-signup .info-item h3.value {
                font-weight: normal;
                color: #777;
            }

            .form-signup p {
                font-size: 16px;
                color: #333;
                margin-bottom: 10px;
            }

            .form-signup p strong {
                font-weight: bold;
            }

            .btn-add-addr {
                margin-bottom: 20px;
            }

            .address_info {
                border-top: 1px #ebebeb solid;
                padding-top: 16px;
                margin-top: 20px;
            }

            .address-group {
                margin-bottom: 20px;
            }

            .btn-address .btn-row {
                display: flex;
                justify-content: space-between;
            }

            .btn-edit-addr {
                padding: 10px 20px;
                font-size: 14px;
                font-weight: bold;
                border-radius: 5px;
                border: none;
                cursor: pointer;
                transition: background-color 0.3s, color 0.3s;
            }

            .btn-edit-addr.btn-edit {
                background-color: #007bff;
                color: #fff;
            }

            .btn-edit-addr.btn-edit:hover {
                background-color: #0056b3;
            }

            .btn-edit-addr.btn-delete {
                background-color: #dc3545;
                color: #fff;
            }

            .btn-edit-addr.btn-delete:hover {
                background-color: #c82333;
            }
        </style>
    </head>
    <body>
        <div id="header_tab">
            <jsp:include page="header.jsp"/>
        </div>
        <c:set var="account" value="${sessionScope.account}"/>
        <c:set var="listAddress" value="${requestScope.listAddress}"/>
        <section class="signup page_customer_account">
            <div class="container">
                <div class="row">
                    <div class="col-xs-12 col-sm-12 col-lg-3 col-left-ac">
                        <div class="block-account">
                            <h5 class="title-account margin-top-10">Trang tài khoản</h5>
                            <p>Xin chào, <span style="color: black;"> ${account.fullname}</span>&nbsp;!</p>

                            <ul>
                                <li><a class="button" href="#account-info" onclick="goToSection('account-info', this)" title="Thông tin tài khoản">Thông tin tài khoản</a></li>
                                <li><a class="button" href="#change-password" onclick="goToSection('change-password', this)">Đổi mật khẩu</a></li>
                                <li><a href="https://www.messenger.com/t/iamtiss" class="button">Chat hỗ trợ</a></li>
                                <li><a class="button" href="${pageContext.request.contextPath}/logout" title="Logout">Đăng xuất</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-12 col-lg-9 col-right-ac" id="account-info">
                        <h1 class="title-head margin-top-10">Thông tin tài khoản</h1>
                        <div class="form-signup name-account m992">
                            <div class="info-item">
                                <h3 class="label">Full name:</h3>
                                <h3 class="value">${account.fullname}</h3>
                            </div>                            
                            <div class="info-item">
                                <h3 class="label">Email:</h3>
                                <h3 class="value">${account.email}</h3>
                            </div>                            
                            <div class="info-item">
                                <h3 class="label">Phone number:</h3>
                                <h3 class="value">${account.phone}</h3>
                            </div>
                        </div>
                    </div>

                    <!-- Change Password Section -->
                    <div class="col-xs-12 col-sm-12 col-lg-9 col-right-ac" id="change-password" style="display: none;">
                        <h1 class="title-head margin-top-0">Đổi mật khẩu</h1>
                        <div class="page-login">
                            <form method="post" action="changepassword" id="change_customer_password" accept-charset="UTF-8" class="has-validation-callback">
                                <input name="FormType" type="hidden" value="change_customer_password">
                                <input name="utf8" type="hidden" value="true">
                                <input name="previousPage" type="hidden" value="<%= request.getRequestURL() %>?<%= request.getQueryString() %>">
                                <p>Để đảm bảo tính bảo mật vui lòng đặt mật khẩu với ít nhất 8 kí tự</p>
                                <div class="form-signup clearfix">
                                    <fieldset class="form-group">
                                        <label for="oldPass">Mật khẩu cũ <span class="error">*</span></label>
                                        <input style="font-size: 16px; /* Kích thước chữ lớn hơn */
                                               padding: 10px 10px; /* Khoảng cách giữa viền và văn bản */
                                               height: 40px; /* Chiều cao của input */
                                               border-radius: 5px; /* Độ cong viền */" type="password" placeholder="Mật khẩu cũ" name="OldPassword" id="OldPass" required="" class="form-control form-control-lg">
                                    </fieldset>
                                    <fieldset class="form-group">
                                        <label for="changePass">Mật khẩu mới <span class="error">*</span></label>
                                        <input style="font-size: 16px; /* Kích thước chữ lớn hơn */
                                               padding: 10px 10px; /* Khoảng cách giữa viền và văn bản */
                                               height: 40px; /* Chiều cao của input */
                                               border-radius: 5px; /* Độ cong viền */" type="password" placeholder="Mật khẩu mới" name="Password" id="changePass" required="" class="form-control form-control-lg">
                                    </fieldset>
                                    <fieldset class="form-group">
                                        <label for="confirmPass">Xác nhận lại mật khẩu <span class="error">*</span></label>
                                        <input style="font-size: 16px; /* Kích thước chữ lớn hơn */
                                               padding: 10px 10px; /* Khoảng cách giữa viền và văn bản */
                                               height: 40px; /* Chiều cao của input */
                                               border-radius: 5px; /* Độ cong viền */" type="password" placeholder="Xác nhận lại mật khẩu" name="ConfirmPassword" id="confirmPass" required="" class="form-control form-control-lg">
                                    </fieldset>
                                    <button class="button" onclick="enableActiveLink()"><i class="hoverButton"></i>Đặt lại mật khẩu</button>
                                </div>
                            </form>
                        </div>
                    </div>

                    <!-- Address Section -->
                    <div class="col-xs-12 col-sm-12 col-lg-9 col-right-ac" id="address-info" style="display: none;">
                        <h1 class="title-head margin-top-0">Sổ địa chỉ</h1>
                        <button class="button_address" onclick="addNewAddress()">Thêm mới địa chỉ</button>
                        <div id="view_address_26601108" class="customer_address col-xs-12 col-lg-12 col-md-12 col-xl-12">
                            <div class="address_info" style="border-top: 1px #ebebeb solid;padding-top: 16px;margin-top: 20px;">
                                <div class="address-group">
                                    <div class="address form-signup">
                                        <p><strong>Họ tên: </strong>Trần Việt Thắng</p>
                                        <p><strong>Địa chỉ: </strong>24 Tân Trà, Phường Phú Bài, Thị xã Hương Thủy, Thừa Thiên Huế, Vietnam</p>
                                        <p><strong>Số điện thoại:</strong> 01347831221</p>
                                    </div>
                                </div>
                                <div id="tool_address_26601108" class="btn-address">
                                    <p class="btn-row">
                                        <button class="btn-edit-addr btn btn-primary btn-edit" type="button" data-form="edit_address_26601108" aria-controls="edit_address_26601108">
                                            Chỉnh sửa địa chỉ
                                        </button>
                                        <button class="btn btn-dark-address btn-edit-addr btn-delete" type="button" onclick="Bizweb.CustomerAddress.destroy(26601108);
                                                return false"><span>Xóa</span></button>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <c:if test="${not empty message}">
            <script>
                alert('${message}');
                <c:remove var="message" scope="session" />
            </script>
        </c:if>

        <script>
            function goToSection(sectionId, element) {
                // Ẩn tất cả các phần
                document.getElementById('account-info').style.display = 'none';
                document.getElementById('change-password').style.display = 'none';
                document.getElementById('address-info').style.display = 'none';

                // Hiển thị phần được chọn
                document.getElementById(sectionId).style.display = 'block';

                // Disable tất cả các nút
                const buttons = document.querySelectorAll('.button');
                buttons.forEach(button => {
                    button.classList.remove('disabled');
                    button.removeAttribute('disabled');
                });

                // Disable nút hiện tại
                element.classList.add('disabled');
                element.setAttribute('disabled', 'true');
            }

        </script>
        <!--        <script>
                    // Function to switch to a section and mark it as active
                    function goToSection(sectionId, linkElement) {
                        // Hide all sections
                        var sections = document.querySelectorAll('.section');
                        sections.forEach(function (section) {
                            section.style.display = 'none';
                        });
        
                        // Show the selected section
                        document.getElementById(sectionId).style.display = 'block';
        
                        // Mark the clicked link as active
                        markActiveLink(linkElement);
                    }
        
                    // Function to mark a link as active
                    function markActiveLink(linkElement) {
                        // Disable the current active link
                        var currentActiveLink = document.querySelector('#nav-links .active');
                        if (currentActiveLink) {
                            currentActiveLink.classList.remove('active');
                        }
        
                        // Enable the clicked link as active
                        linkElement.classList.add('active');
                    }
        
                    // JavaScript to handle initial active tab when page loads
                    document.addEventListener('DOMContentLoaded', function () {
                        // Default to the first section (Thông tin tài khoản)
                        var defaultSection = 'account-info';
                        var defaultLink = document.querySelector('a[href="#' + defaultSection + '"]');
                        if (defaultLink) {
                            goToSection(defaultSection, defaultLink);
                        }
                    });
                </script>-->

        <div id="footer_tab">
            <jsp:include page="footer.jsp"/>
        </div>
    </body>
</html>