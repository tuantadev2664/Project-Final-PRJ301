<%-- 
    Document   : account
    Created on : Jun 2, 2024, 1:26:13 AM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/account.css"/>
        <link rel="stylesheet" href="css/bootstrapheaderlogin.css">

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
                                    <h3 class="title-head">Thông tin tài khoản</h3>
                                </div>
                                <div class="form-signup">
                                    <p><i>Xin chào, Trần Minh Quang</i></p>
                                </div>

                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12 col-sm-12 col-lg-12">
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        Thông tin khách hàng
                                    </div>
                                    <div class="panel-body">
                                        <ul class="ega-address-info">
                                            <li>
                                                Trần Minh Quang
                                            </li>
                                            <li>

                                            </li>
                                            <li>

                                            </li>
                                            <li>
                                                <a href="address.jsp" style="display: inline-block;
                                                   padding: 6px 12px;
                                                   margin-bottom: 0;
                                                   font-size: 13px;
                                                   font-weight: 400;
                                                   line-height: 1.32857143;
                                                   text-align: center;
                                                   white-space: nowrap;
                                                   vertical-align: middle;
                                                   -ms-touch-action: manipulation;
                                                   touch-action: manipulation;
                                                   cursor: pointer;
                                                   -webkit-user-select: none;
                                                   -moz-user-select: none;
                                                   -ms-user-select: none;
                                                   user-select: none;
                                                   background-image: none;
                                                   border: 1px solid transparent;
                                                   background-color: black;
                                                   color: white" class="btn ega-btn">
                                                    Sổ địa chỉ (0)
                                                </a>
                                            </li>
                                            <li>
                                                <a href="/apps/kiem-tra-don-hang" class="btn ega-btn">
                                                    Tra đơn hàng nhanh
                                                </a>
                                            </li>

                                            <li>
                                                <a href="https://www.messenger.com/t/davies.vietnam" class="btn ega-btn">
                                                    Chat hỗ trợ
                                                </a>
                                            </li>


                                            <br>
                                            <li>
                                                <a href="/account/logout" class="btn ega-btn-round">
                                                    Đăng xuất
                                                </a>
                                            </li>
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
