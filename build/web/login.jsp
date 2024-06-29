<%-- 
    Document   : Login.jsp
    Created on : May 30, 2024, 9:09:45 AM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/stylelogin.css">
        <link rel="stylesheet" href="css/styleheaderlogin.css">
        <link rel="stylesheet" href="css/bootstrapheaderlogin.css">
        <style>
            /*            .container:hover {
                        background-color: lightblue;
                        transform: scale(0.99);  Tăng kích thước nhẹ 
                    }*/
            /* Hiệu ứng khi di chuột qua */
            .btn:hover {
                background-color: gray;
                transform: scale(1.025); /* Tăng kích thước nhẹ */
            }

            /* Hiệu ứng khi nhấp vào */
            .btn:active {
                background-color: darkgray;
                transform: scale(0.95); /* Giảm kích thước nhẹ */
            }
        </style>

        <style>
        </style>
    </head>
    <body>
        <div id="header_tab">
            <jsp:include page="header.jsp"/>
        </div>

        <div style="margin-top: 10px;
             background-color: #F5F5F5;
             margin-top: 10px;
             width: 30%;
             height: 70%;
             padding-top: 15px;
             padding-bottom: 15px;
             border: 0.5px solid black;
             border-radius: 15px;
             " class="container">
            <div class="eag-content-acc">
                <h2 style="display: flex;
                    height: 60px;
                    margin: -15px -15px 15px -15px;
                    width: auto;
                    justify-content: center;
                    align-items: center;
                    background-color: black;
                    color: white;
                    border-top-left-radius: 14px;
                    border-top-right-radius: 14px;" class="title-head"><span>Đăng nhập tài khoản</span></h2>
                <h3 style="red">${sessionScope.notification}</h3>
                <div class="row">
                    <div style="
                         align-items: center;
                         " class="col-lg-12">
                        <div class="page-login margin-bottom-30">
                            <div id="login">
                                <form action="login" method="post" id="customer_login" accept-charset="UTF-8"><input name="FormType" type="hidden" value="customer_login"><input name="utf8" type="hidden" value="true"><input name="ReturnUrl" type="hidden" value="/account">
                                    <div class="form-signup">
                                        <c:if test="${requestScope.error != null}">
                                            <div class="alert alert-danger" role="alert" style="margin-top: 10px">
                                                ${requestScope.error}
                                            </div>
                                        </c:if>
                                    </div>
                                    <div class="form-signup clearfix">
                                        <fieldset class="form-group">
                                            <label>Username:<span class="ega-red-color">*</span> </label>
                                            <input style="
                                                   height:4rem;
                                                   padding:.5rem 1rem;
                                                   font-size:1.25rem;
                                                   line-height:1.5;
                                                   border-radius:.3rem;
                                                   border: 2px solid black;
                                                   font-size: 15px" type="username" class="form-control form-control-lg ega-input-valid" value="" name="username" id="customer_email" placeholder="Email">
                                            <div class="eg-error-form" style="color:#a94442;display: none">
                                                Username/Email không hợp lệ!
                                            </div>
                                        </fieldset>

                                        <fieldset class="form-group">
                                            <label>Mật khẩu:<span class="ega-red-color">*</span> </label>
                                            <input style="
                                                   height:4rem;
                                                   padding:.5rem 1rem;
                                                   font-size:1.25rem;
                                                   line-height:1.5;
                                                   border-radius:.3rem;
                                                   border: 2px solid black;
                                                   font-size: 15px" type="password" class="form-control form-control-lg ega-input-valid" value="" name="password" id="customer_password" placeholder="Mật khẩu">
                                            <div class="eg-error-form" style="color:#a94442;display: none">
                                                Mật khẩu trống!
                                            </div>
                                        </fieldset> 
                                        <input style="font-size: 50px" type="checkbox" name="rememberMe" value="yes"><span style="font-size: 15px"> Remember Me</span><br>


                                        <div class="col-lg-12" style="margin-top: 10px;
                                             display: flex;
                                             justify-content: center;
                                             align-items: center">
                                            <input style="color: white; background-color: black; font-size: 20px" class="btn ega-btn" type="submit" value="Đăng nhập">
                                            <a href="${pageContext.request.contextPath}/register" class="btn" style="font-size: 20px" style="margin-left: 20px;">
                                                Đăng ký
                                            </a>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div id="recover-password" style="margin: 10px 0" class="form-signup">
                            <span>
                                Bạn quên mật khẩu? Nhập địa chỉ email để lấy lại mật khẩu qua email.
                            </span>
                            <form method="post" action="/account/recover" id="recover_customer_password" accept-charset="UTF-8"><input name="FormType" type="hidden" value="recover_customer_password"><input name="utf8" type="hidden" value="true">
                                <div class="form-signup">

                                </div>
                                <div class="form-signup">

                                </div>

                                <div class="form-signup clearfix">

                                    <fieldset class="form-group" style="padding-top: 5px">

                                        <input style="
                                               height:4rem;
                                               padding:.5rem 1rem;
                                               font-size:1.25rem;
                                               line-height:1.5;
                                               border-radius:.3rem;
                                               border: 2px solid black;
                                               font-size: 15px" type="email" class="form-control form-control-lg ega-input-valid" value="" name="Email" id="recover-email" placeholder="Email">
                                        <div class="eg-error-form" style="color:#a94442;display: none">
                                            Email không hợp lệ!
                                        </div>
                                    </fieldset>
                                </div>
                                <div style="display: flex;
                                     justify-content: center;
                                     align-items: center" class="action_bottom">
                                    <input style="color: white; background-color: black; font-size: 15px" class="btn ega-btn-round" type="submit" value="Lấy lại mật khẩu">

                                </div>
                            </form>
                        </div>

                    </div>

                </div>
            </div>

        </div>


        <div id="footer_tab">
            <jsp:include page="footer.jsp"/>
        </div>    </body>
</html>
