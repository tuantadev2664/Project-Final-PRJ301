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
            .button {
                display: inline-block; /* Hiển thị dạng khối nội tuyến */
                background-color: black; /* Màu nền */
                color: #fff; /* Màu chữ */
                text-align: center; /* Căn giữa chữ */
                text-decoration: none; /* Xóa gạch chân */
                padding: 10px 20px; /* Khoảng đệm */
                font-size: 16px; /* Kích thước chữ */
                border-radius: 5px; /* Bo góc */
                transition: all 0.3s ease; /* Hiệu ứng chuyển đổi */
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); /* Hiệu ứng bóng đổ */
                cursor: pointer; /* Con trỏ chuột */
            }

            /* Hover effect */
            .button:hover {
                background-color: black; /* Màu nền khi di chuột */
                color: #fff; /* Màu chữ khi di chuột */
                transform: scale(1.05); /* Hiệu ứng thu phóng */
                box-shadow: 0 6px 8px rgba(0, 0, 0, 0.2); /* Hiệu ứng bóng đổ khi di chuột */
            }

            /* Active effect */
            .button:active {
                background-color: #004085; /* Màu nền khi nhấn */
                transform: scale(0.98); /* Thu nhỏ khi nhấn */
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); /* Giảm bóng đổ khi nhấn */
            }
            h3 {
                font-weight: normal
            }
            ul {
                list-style-type: none;
                padding: 0;
            }
            li {
                display: flex;
                margin: 5px 0px 5px 20px;
            }
        </style>
    </head>
    <body>
        <div id="header_tab">
            <jsp:include page="header.jsp"/>
        </div>
        <div class="container">
            <div class="eag-content-acc">
                <div class="row">
                    <div class="col-xs-12 col-sm-12 col-md-12">
                        <div class="row">
                            <div class="col-xs-12 col-sm-12 col-lg-12">
                                <div style="margin-top: 10px" class="page-title">
                                    <!-- <h3 class="title-head">Thông tin tài khoản</h3> -->                                   
                                </div>
                                <div class="form-signup">
                                    <p style="font-size: 20px"><i>Xin chào, ${account.fullname}</i></p>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12 col-sm-12 col-lg-8">
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        Thông tin khách hàng
                                    </div>
                                    <div class="panel-body">
                                        <ul class="ega-address-info">
                                            <c:set var="account" value="${sessionScope.account}"/>
                                            <div>
                                                <li class="row">
                                                    <div class="col-md-6" style="display: flex"> 
                                                        <h3 style="margin-left: 20px">Full name: </h3> <h3 style="font-weight: normal; margin-left: 5px " > ${account.fullname} </h3>
                                                    </div>
                                                    <div class="col-md-6" style="display: flex">
                                                        <h3>Gender: </h3>
                                                        <h3 style="font-weight: normal; margin-left: 5px ">${account.gender}</h3>
                                                    </div>
                                                </li>
                                            </div>
                                            <div>
                                                <li class="row">
                                                    <div class="col-md-6" style="display: flex"> 
                                                        <h3 style="margin-left: 20px">Email: </h3> <h3 style="font-weight: normal; margin-left: 5px">${account.email}</h3>                                                    </div>
                                                    <div class="col-md-6" style="display: flex">
                                                        <h3>Birthday: </h3> <h3 style="font-weight: normal; margin-left: 5px">${account.formatDate}</h3>
                                                    </div>
                                                </li>
                                            </div>
                                            <div>
                                                <li class="row">
                                                    <div class="col-md-12" style="display: flex">
                                                        <h3 style="margin-left: 20px">Phone number: </h3> 
                                                        <h3 style="font-weight: normal; margin-left: 5px">
                                                            ${account.phone}
                                                        </h3>
                                                    </div>
                                                </li>
                                            </div>
                                            <c:set var="listAddress" value="${requestScope.listAddress}"/>
                                            <div style="display: flex" >
                                                <li>
                                                    <a href="address.jsp" 
                                                       class="button">
                                                        Sổ địa chỉ (${fn:length(listAddress)})
                                                    </a>
                                                </li>
                                                <li>
                                                    <a href="/apps/kiem-tra-don-hang" class="button">
                                                        Thay đổi thông tin cá nhân
                                                    </a>
                                                </li>
                                                <li>
                                                    <a href="https://www.messenger.com/t/iamtiss" class="button">
                                                        Chat hỗ trợ
                                                    </a>
                                                </li>
                                                <br>
                                                <li>
                                                    <a href="${pageContext.request.contextPath}/logout" class="button">
                                                        Đăng xuất
                                                    </a>
                                                </li>
                                            </div>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <div id="footer_tab">
            <jsp:include page="footer.jsp"/>
        </div>
    </body>
</html>
