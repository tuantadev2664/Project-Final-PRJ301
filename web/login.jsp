<%-- 
    Document   : Login.jsp
    Created on : May 30, 2024, 9:09:45 AM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/stylelogin.css">
        <link rel="stylesheet" href="css/styleheaderlogin.css">
        <link rel="stylesheet" href="css/bootstrapheaderlogin.css">
        <style>
        </style>
    </head>
    <body>
        <div id="header_tab">
            <jsp:include page="header.jsp"/>
        </div>

        <div style="margin-top: 10px" class="container">
            <div class="eag-content-acc">
                <h1 class="title-head"><span>Đăng nhập tài khoản</span></h1>
                <div class="row">
                    <div class="col-lg-8">
                        <div class="page-login margin-bottom-30">
                            <div id="login">
                                <form method="post" action="/project-final-prj301/LoginServlet" id="customer_login" accept-charset="UTF-8"><input name="FormType" type="hidden" value="customer_login"><input name="utf8" type="hidden" value="true"><input name="ReturnUrl" type="hidden" value="/account">
                                    <div class="form-signup">
                                        <%
                                            String errorMessage = (String) request.getAttribute("errorMessage");
                                            if (errorMessage != null) {
                                        %>
                                        <div class="alert alert-danger" role="alert" style="margin-top: 10px">
                                            <%= errorMessage %>
                                        </div>
                                        <%
                                            }
                                        %>
                                    </div>
                                    <div class="form-signup clearfix">
                                        <fieldset class="form-group">
                                            <label>Email:<span class="ega-red-color">*</span> </label>
                                            <input style="
                                                   height:4rem;
                                                   padding:.5rem 1rem;
                                                   font-size:1.25rem;
                                                   line-height:1.5;
                                                   border-radius:.3rem;
                                                   border: 2px solid black;
                                                   font-size: 15px" type="email" class="form-control form-control-lg ega-input-valid" value="" name="email" id="customer_email" placeholder="Email">
                                            <div class="eg-error-form" style="color:#a94442;display: none">
                                                Email không hợp lệ!
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



                                        <div class="pull-xs-left" style="margin-top: 25px;">
                                            <input style="color: white; background-color: black; font-size: 20px" class="btn ega-btn" type="submit" value="Đăng nhập">
                                            <a href="register.jsp" class="btn" style="font-size: 20px" style="margin-left: 20px;">
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
                                <div class="action_bottom">
                                    <input style="color: white; background-color: black; font-size: 15px" class="btn ega-btn-round" type="submit" value="Lấy lại mật khẩu">

                                </div>
                            </form>
                        </div>

                    </div>
                    <div class="col-xs-12 col-sm-6">
                        <div id="social_login_widget"></div>
                    </div>
                </div>
            </div>

        </div>


        <div id="footer_tab">
            <jsp:include page="footer.jsp"/>
        </div>    </body>
</html>
