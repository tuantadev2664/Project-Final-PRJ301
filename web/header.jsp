<%-- 
    Document   : header.jsp
    Created on : May 29, 2024, 9:37:04 PM
    Author     : FPTSHOP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head id="Head1" prefix="og: http://ogp.me/ns# fb:http://ogp.me/ns/fb# article:http://ogp.me/ns/article#">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product | group 5</title>


        <link type="image/x-icon" href="images/Premium Vector _ Men's fashion store logo design template_vector illustration.jpg" rel="icon">

        <!--        <link rel="stylesheet" type="text/css" media="screen" href="https://monatabluelight.com/templates/default/css/bootstrap.css?v=1716981831"> 
                <link rel="stylesheet" type="text/css" media="screen" href="https://monatabluelight.com/templates/default/css/style.css?v=1716981831"> -->

        <link rel="stylesheet" href="css/bootstrapheader.css"> 
        <link rel="stylesheet" href="css/styleheader.css"> 

        <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&amp;display=swap" rel="stylesheet">


        <script language="javascript" type="text/javascript" src="https://monatabluelight.com/templates/default/js/jquery.min.js"></script>


        <style type="text/css" data-fbcssmodules="css:fb.css.base css:fb.css.dialog css:fb.css.iframewidget css:fb.css.customer_chat_plugin_iframe">
            .fb_hidden{
                position:absolute;
                top:-10000px;
                z-index:10001
            }
            .fb_reposition{
                overflow:hidden;
                position:relative
            }
            .fb_invisible{
                display:none
            }
            .fb_reset{
                background:none;
                border:0;
                border-spacing:0;
                color:#000;
                cursor:auto;
                direction:ltr;
                font-family:'lucida grande', tahoma, verdana, arial, sans-serif;
                font-size:11px;
                font-style:normal;
                font-variant:normal;
                font-weight:normal;
                letter-spacing:normal;
                line-height:1;
                margin:0;
                overflow:visible;
                padding:0;
                text-align:left;
                text-decoration:none;
                text-indent:0;
                text-shadow:none;
                text-transform:none;
                visibility:visible;
                white-space:normal;
                word-spacing:normal
            }
            .fb_reset>div{
                overflow:hidden
            }
            @keyframes fb_transform{
                from{
                    opacity:0;
                    transform:scale(.95)
                }
                to{
                    opacity:1;
                    transform:scale(1)
                }
            }
            .fb_animate{
                animation:fb_transform .3s forwards
            }
            .fb_hidden{
                position:absolute;
                top:-10000px;
                z-index:10001
            }
            .fb_reposition{
                overflow:hidden;
                position:relative
            }
            .fb_invisible{
                display:none
            }
            .fb_reset{
                background:none;
                border:0;
                border-spacing:0;
                color:#000;
                cursor:auto;
                direction:ltr;
                font-family:'lucida grande', tahoma, verdana, arial, sans-serif;
                font-size:11px;
                font-style:normal;
                font-variant:normal;
                font-weight:normal;
                letter-spacing:normal;
                line-height:1;
                margin:0;
                overflow:visible;
                padding:0;
                text-align:left;
                text-decoration:none;
                text-indent:0;
                text-shadow:none;
                text-transform:none;
                visibility:visible;
                white-space:normal;
                word-spacing:normal
            }
            .fb_reset>div{
                overflow:hidden
            }
            @keyframes fb_transform{
                from{
                    opacity:0;
                    transform:scale(.95)
                }
                to{
                    opacity:1;
                    transform:scale(1)
                }
            }
            .fb_animate{
                animation:fb_transform .3s forwards
            }
            .fb_dialog{
                background:rgba(82, 82, 82, .7);
                position:absolute;
                top:-10000px;
                z-index:10001
            }
            .fb_dialog_advanced{
                border-radius:8px;
                padding:10px
            }
            .fb_dialog_content{
                background:#fff;
                color:#373737
            }
            .fb_dialog_close_icon{
                background:url(https://connect.facebook.net/rsrc.php/v3/yq/r/IE9JII6Z1Ys.png) no-repeat scroll 0 0 transparent;
                cursor:pointer;
                display:block;
                height:15px;
                position:absolute;
                right:18px;
                top:17px;
                width:15px
            }
            .fb_dialog_mobile .fb_dialog_close_icon{
                left:5px;
                right:auto;
                top:5px
            }
            .fb_dialog_padding{
                background-color:transparent;
                position:absolute;
                width:1px;
                z-index:-1
            }
            .fb_dialog_close_icon:hover{
                background:url(https://connect.facebook.net/rsrc.php/v3/yq/r/IE9JII6Z1Ys.png) no-repeat scroll 0 -15px transparent
            }
            .fb_dialog_close_icon:active{
                background:url(https://connect.facebook.net/rsrc.php/v3/yq/r/IE9JII6Z1Ys.png) no-repeat scroll 0 -30px transparent
            }
            .fb_dialog_iframe{
                line-height:0
            }
            .fb_dialog_content .dialog_title{
                background:#6d84b4;
                border:1px solid #365899;
                color:#fff;
                font-size:14px;
                font-weight:bold;
                margin:0
            }
            .fb_dialog_content .dialog_title>span{
                background:url(https://connect.facebook.net/rsrc.php/v3/yd/r/Cou7n-nqK52.gif) no-repeat 5px 50%;
                float:left;
                padding:5px 0 7px 26px
            }
            body.fb_hidden{
                height:100%;
                left:0;
                margin:0;
                overflow:visible;
                position:absolute;
                top:-10000px;
                transform:none;
                width:100%
            }
            .fb_dialog.fb_dialog_mobile.loading{
                background:url(https://connect.facebook.net/rsrc.php/v3/ya/r/3rhSv5V8j3o.gif) white no-repeat 50% 50%;
                min-height:100%;
                min-width:100%;
                overflow:hidden;
                position:absolute;
                top:0;
                z-index:10001
            }
            .fb_dialog.fb_dialog_mobile.loading.centered{
                background:none;
                height:auto;
                min-height:initial;
                min-width:initial;
                width:auto
            }
            .fb_dialog.fb_dialog_mobile.loading.centered #fb_dialog_loader_spinner{
                width:100%
            }
            .fb_dialog.fb_dialog_mobile.loading.centered .fb_dialog_content{
                background:none
            }
            .loading.centered #fb_dialog_loader_close{
                clear:both;
                color:#fff;
                display:block;
                font-size:18px;
                padding-top:20px
            }
            #fb-root #fb_dialog_ipad_overlay{
                background:rgba(0, 0, 0, .4);
                bottom:0;
                left:0;
                min-height:100%;
                position:absolute;
                right:0;
                top:0;
                width:100%;
                z-index:10000
            }
            #fb-root #fb_dialog_ipad_overlay.hidden{
                display:none
            }
            .fb_dialog.fb_dialog_mobile.loading iframe{
                visibility:hidden
            }
            .fb_dialog_mobile .fb_dialog_iframe{
                position:sticky;
                top:0
            }
            .fb_dialog_content .dialog_header{
                background:linear-gradient(from(#738aba), to(#2c4987));
                border-bottom:1px solid;
                border-color:#043b87;
                box-shadow:white 0 1px 1px -1px inset;
                color:#fff;
                font:bold 14px Helvetica, sans-serif;
                text-overflow:ellipsis;
                text-shadow:rgba(0, 30, 84, .296875) 0 -1px 0;
                vertical-align:middle;
                white-space:nowrap
            }
            .fb_dialog_content .dialog_header table{
                height:43px;
                width:100%
            }
            .fb_dialog_content .dialog_header td.header_left{
                font-size:12px;
                padding-left:5px;
                vertical-align:middle;
                width:60px
            }
            .fb_dialog_content .dialog_header td.header_right{
                font-size:12px;
                padding-right:5px;
                vertical-align:middle;
                width:60px
            }
            .fb_dialog_content .touchable_button{
                background:linear-gradient(from(#4267B2), to(#2a4887));
                background-clip:padding-box;
                border:1px solid #29487d;
                border-radius:3px;
                display:inline-block;
                line-height:18px;
                margin-top:3px;
                max-width:85px;
                padding:4px 12px;
                position:relative
            }
            .fb_dialog_content .dialog_header .touchable_button input{
                background:none;
                border:none;
                color:#fff;
                font:bold 12px Helvetica, sans-serif;
                margin:2px -12px;
                padding:2px 6px 3px 6px;
                text-shadow:rgba(0, 30, 84, .296875) 0 -1px 0
            }
            .fb_dialog_content .dialog_header .header_center{
                color:#fff;
                font-size:16px;
                font-weight:bold;
                line-height:18px;
                text-align:center;
                vertical-align:middle
            }
            .fb_dialog_content .dialog_content{
                background:url(https://connect.facebook.net/rsrc.php/v3/y9/r/jKEcVPZFk-2.gif) no-repeat 50% 50%;
                border:1px solid #4a4a4a;
                border-bottom:0;
                border-top:0;
                height:150px
            }
            .fb_dialog_content .dialog_footer{
                background:#f5f6f7;
                border:1px solid #4a4a4a;
                border-top-color:#ccc;
                height:40px
            }
            #fb_dialog_loader_close{
                float:left
            }
            .fb_dialog.fb_dialog_mobile .fb_dialog_close_icon{
                visibility:hidden
            }
            #fb_dialog_loader_spinner{
                animation:rotateSpinner 1.2s linear infinite;
                background-color:transparent;
                background-image:url(https://connect.facebook.net/rsrc.php/v3/yD/r/t-wz8gw1xG1.png);
                background-position:50% 50%;
                background-repeat:no-repeat;
                height:24px;
                width:24px
            }
            @keyframes rotateSpinner{
                0%{
                    transform:rotate(0deg)
                }
                100%{
                    transform:rotate(360deg)
                }
            }
            .fb_iframe_widget{
                display:inline-block;
                position:relative
            }
            .fb_iframe_widget span{
                display:inline-block;
                position:relative;
                text-align:justify
            }
            .fb_iframe_widget iframe{
                position:absolute
            }
            .fb_iframe_widget_fluid_desktop,.fb_iframe_widget_fluid_desktop span,.fb_iframe_widget_fluid_desktop iframe{
                max-width:100%
            }
            .fb_iframe_widget_fluid_desktop iframe{
                min-width:220px;
                position:relative
            }
            .fb_iframe_widget_lift{
                z-index:1
            }
            .fb_iframe_widget_fluid{
                display:inline
            }
            .fb_iframe_widget_fluid span{
                width:100%
            }
            .fb_mpn_mobile_landing_page_slide_out{
                animation-duration:200ms;
                animation-name:fb_mpn_landing_page_slide_out;
                transition-timing-function:ease-in
            }
            .fb_mpn_mobile_landing_page_slide_out_from_left{
                animation-duration:200ms;
                animation-name:fb_mpn_landing_page_slide_out_from_left;
                transition-timing-function:ease-in
            }
            .fb_mpn_mobile_landing_page_slide_up{
                animation-duration:500ms;
                animation-name:fb_mpn_landing_page_slide_up;
                transition-timing-function:ease-in
            }
            .fb_mpn_mobile_bounce_in{
                animation-duration:300ms;
                animation-name:fb_mpn_bounce_in;
                transition-timing-function:ease-in
            }
            .fb_mpn_mobile_bounce_out{
                animation-duration:300ms;
                animation-name:fb_mpn_bounce_out;
                transition-timing-function:ease-in
            }
            .fb_mpn_mobile_bounce_out_v2{
                animation-duration:300ms;
                animation-name:fb_mpn_fade_out;
                transition-timing-function:ease-in
            }
            .fb_customer_chat_bounce_in_v2{
                animation-duration:300ms;
                animation-name:fb_bounce_in_v2;
                transition-timing-function:ease-in
            }
            .fb_customer_chat_bounce_in_from_left{
                animation-duration:300ms;
                animation-name:fb_bounce_in_from_left;
                transition-timing-function:ease-in
            }
            .fb_customer_chat_bounce_out_v2{
                animation-duration:300ms;
                animation-name:fb_bounce_out_v2;
                transition-timing-function:ease-in
            }
            .fb_customer_chat_bounce_out_from_left{
                animation-duration:300ms;
                animation-name:fb_bounce_out_from_left;
                transition-timing-function:ease-in
            }
            .fb_invisible_flow{
                display:inherit;
                height:0;
                overflow-x:hidden;
                width:0
            }
            @keyframes fb_mpn_landing_page_slide_out{
                0%{
                    margin:0 12px;
                    width:100% - 24px
                }
                60%{
                    border-radius:18px
                }
                100%{
                    border-radius:50%;
                    margin:0 24px;
                    width:60px
                }
            }
            @keyframes fb_mpn_landing_page_slide_out_from_left{
                0%{
                    left:12px;
                    width:100% - 24px
                }
                60%{
                    border-radius:18px
                }
                100%{
                    border-radius:50%;
                    left:12px;
                    width:60px
                }
            }
            @keyframes fb_mpn_landing_page_slide_up{
                0%{
                    bottom:0;
                    opacity:0
                }
                100%{
                    bottom:24px;
                    opacity:1
                }
            }
            @keyframes fb_mpn_bounce_in{
                0%{
                    opacity:.5;
                    top:100%
                }
                100%{
                    opacity:1;
                    top:0
                }
            }
            @keyframes fb_mpn_fade_out{
                0%{
                    bottom:30px;
                    opacity:1
                }
                100%{
                    bottom:0;
                    opacity:0
                }
            }
            @keyframes fb_mpn_bounce_out{
                0%{
                    opacity:1;
                    top:0
                }
                100%{
                    opacity:.5;
                    top:100%
                }
            }
            @keyframes fb_bounce_in_v2{
                0%{
                    opacity:0;
                    transform:scale(0, 0);
                    transform-origin:bottom right
                }
                50%{
                    transform:scale(1.03, 1.03);
                    transform-origin:bottom right
                }
                100%{
                    opacity:1;
                    transform:scale(1, 1);
                    transform-origin:bottom right
                }
            }
            @keyframes fb_bounce_in_from_left{
                0%{
                    opacity:0;
                    transform:scale(0, 0);
                    transform-origin:bottom left
                }
                50%{
                    transform:scale(1.03, 1.03);
                    transform-origin:bottom left
                }
                100%{
                    opacity:1;
                    transform:scale(1, 1);
                    transform-origin:bottom left
                }
            }
            @keyframes fb_bounce_out_v2{
                0%{
                    opacity:1;
                    transform:scale(1, 1);
                    transform-origin:bottom right
                }
                100%{
                    opacity:0;
                    transform:scale(0, 0);
                    transform-origin:bottom right
                }
            }
            @keyframes fb_bounce_out_from_left{
                0%{
                    opacity:1;
                    transform:scale(1, 1);
                    transform-origin:bottom left
                }
                100%{
                    opacity:0;
                    transform:scale(0, 0);
                    transform-origin:bottom left
                }
            }
            @keyframes slideInFromBottom{
                0%{
                    opacity:.1;
                    transform:translateY(100%)
                }
                100%{
                    opacity:1;
                    transform:translateY(0)
                }
            }
            @keyframes slideInFromBottomDelay{
                0%{
                    opacity:0;
                    transform:translateY(100%)
                }
                97%{
                    opacity:0;
                    transform:translateY(100%)
                }
                100%{
                    opacity:1;
                    transform:translateY(0)
                }
            }
        </style>

    </head>
    <body style="padding-top: 0px;">
        <div class="header-top">
            <a class="logo" href="listsample"> <!--https://monatabluelight.com/-->
                <img src="images/Premium Vector _ Men's fashion store logo design template_vector illustration.jpg">
                <span>®</span>
            </a>

            <div class="container text-right">
                <a class="holine" href="#"> 
                    <!--tel:0935 608 348-->
                    <svg xmlns="http://www.w3.org/2000/svg" width="12.571" height="12.571" viewBox="0 0 12.571 12.571">
                    <path id="holine-icon" data-name="holine-icon" d="M12.571-2.643a.456.456,0,0,0-.027-.187c-.062-.187-.5-.384-.679-.473-.509-.286-1.027-.563-1.527-.857-.232-.143-.518-.411-.795-.411C9-4.571,8.205-2.955,7.723-2.955A1.919,1.919,0,0,1,6.955-3.3,8.884,8.884,0,0,1,3.3-6.955a1.919,1.919,0,0,1-.348-.768c0-.482,1.616-1.277,1.616-1.821,0-.277-.268-.562-.411-.795-.295-.5-.571-1.018-.857-1.527-.089-.179-.286-.616-.473-.679a.456.456,0,0,0-.187-.027,3.973,3.973,0,0,0-1.241.277,2.352,2.352,0,0,0-.946,1.089A3.412,3.412,0,0,0,0-9.545,6.877,6.877,0,0,0,.616-7.205a8.346,8.346,0,0,0,.741,1.563A15.073,15.073,0,0,0,5.643-1.357a8.346,8.346,0,0,0,1.563.741A6.877,6.877,0,0,0,9.545,0a3.412,3.412,0,0,0,1.661-.455A2.352,2.352,0,0,0,12.295-1.4,3.973,3.973,0,0,0,12.571-2.643Z" transform="translate(0 12.571)" fill="#fff"></path>
                    </svg>&nbsp;
                    <b class="d-sm-inline d-none font-weight-normal">CSKH:</b> <span>0848270604</span>&nbsp;&nbsp;&nbsp;&nbsp;
                </a>
                <a class="d-sm-inline d-none" href="#">
                    <!--                    /gioi-thieu-i1-->
                    <svg xmlns="http://www.w3.org/2000/svg" width="4" height="4" viewBox="0 0 4 4">
                    <circle cx="2" cy="2" r="2" fill="#fb8a06"></circle>
                    </svg>&nbsp;
                    Chính sách - Hỗ trợ&nbsp;&nbsp;&nbsp;&nbsp;
                </a>
                <a class="d-sm-inline d-none" href="#"><!--https://monatabluelight.com/lien-he.html-->
                    <svg xmlns="http://www.w3.org/2000/svg" width="4" height="4" viewBox="0 0 4 4">
                    <circle cx="2" cy="2" r="2" fill="#fb8a06"></circle>
                    </svg>&nbsp;
                    Liên hệ
                </a>
            </div>
        </div><!-- /.header-top-->

        <div class="header-nav">

            <div class="container">
                <div class="float-left nav-float-left">
                    <nav class="navbar navbar-expand-lg">
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                            <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAA5klEQVRYR+3WMU4CQRSH8d+WhpLCE1jQUGJhIRQcgMQzcAAK9ASoidb09N5BKDiHHaEhIRbamJgtIGazcZqZ7BYzB3jzzTfvP28KDa+i4f1lgNYa6OIicn8c8VmtWWdggjei98c3evj4C1EH8IDHyKc/lRvhPQOEDMzwmugKbrANAVyihOhEhthjgZ8QQOR9/y9Xl4JrrBIZGOMQMnCPp0QahliHAPI70PgV9LFM1IR31YHUynF8hZcEBnaY4iuUgjmeE8XwFpsQQI5h4wbK57L8kqWYhgOUU/G8WhnDRAGoL5sNZAO/L5gsId3AKxAAAAAASUVORK5CYII=">
                        </button>
                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="navbar-nav mr-auto">
                                <li class="menu-10   dropdown">
                                    <a target="_self" href="list" title="Sản phẩm">Sản phẩm</a>
                                    <!--https://monatabluelight.com/san-pham.html-->
                                </li>
                                <li class="menu-11   dropdown">
                                    <a target="_self" href="status?statusName=OUTLET%20SALE" title="Sale off">Sale off</a>
                                    <!--https://monatabluelight.com/san-pham.html?status=3-->
                                </li>
                                <li class="menu-13   dropdown">
                                    <a target="_self" href="#" title="Look book">Look book</a>
                                    <!--https://monatabluelight.com/lookbook-->
                                </li>
                                <li class="menu-5  has-child dropdown">
                                    <a target="_self" href="#" title="MemberShip">MemberShip</a>
                                    <!--https://monatabluelight.com/chinh-sach-membership-i11-->
                                    <ul class="dropdown-menu sub-menu submenu-5 ">
                                        <li class="menu-38   dropdown">
                                            <a target="_self" href="#" title="Chính sách membership">Chính sách membership</a>  
                                            <!--https://monatabluelight.com/chinh-sach-membership-i11-->
                                        </li>
                                    </ul>        
                                </li>
                            </ul>
                        </div>
                    </nav>                    
                </div>

                <c:set var="account" value="${sessionScope.account}"/>
                <div class="float-right">
                    <ul class="list-inline">
                        <li class="list-inline-item d-sm-inline d-none" >
                            <a href="">
                                Store
                            </a>
                        </li>
                        
                        <c:if test="${empty sessionScope.account}">  
                            <li class="list-inline-item" >
                                <a  href="login">
                                    <i style='padding-top: 0px;margin-left: 5px; margin-top: 1px'>
                                        <svg xmlns="http://www.w3.org/2000/svg" width="22" height="26" viewBox="0 0 22 26" > 
                                        <g transform="translate(0 0)">  
                                        <path id="Path_667" data-name="Path 667" d="M93.3,12.942a5.965,5.965,0,0,0,4.429-1.9,6.368,6.368,0,0,0,1.835-4.575A6.368,6.368,0,0,0,97.724,1.9a6.121,6.121,0,0,0-8.857,0,6.367,6.367,0,0,0-1.835,4.575,6.368,6.368,0,0,0,1.835,4.575A5.967,5.967,0,0,0,93.3,12.942ZM89.944,3.009a4.631,4.631,0,0,1,6.7,0,4.757,4.757,0,0,1,1.389,3.462,4.757,4.757,0,0,1-1.389,3.462,4.631,4.631,0,0,1-6.7,0,4.756,4.756,0,0,1-1.389-3.462,4.757,4.757,0,0,1,1.389-3.462Zm0,0" transform="translate(-82.465 0)" fill="#1d2738"></path>
                                        <path id="Path_668" data-name="Path 668" d="M21.947,255a16.27,16.27,0,0,0-.214-1.7,13.585,13.585,0,0,0-.41-1.707A8.513,8.513,0,0,0,20.634,250a5.988,5.988,0,0,0-1.038-1.379,4.568,4.568,0,0,0-1.492-.955,5.072,5.072,0,0,0-1.9-.351,1.913,1.913,0,0,0-1.032.446c-.309.206-.671.443-1.075.706a6.1,6.1,0,0,1-1.391.625,5.308,5.308,0,0,1-3.4,0,6.088,6.088,0,0,1-1.39-.624c-.4-.261-.762-.5-1.076-.707a1.911,1.911,0,0,0-1.032-.446,5.065,5.065,0,0,0-1.9.352,4.563,4.563,0,0,0-1.492.955A5.991,5.991,0,0,0,1.364,250a8.529,8.529,0,0,0-.689,1.592,13.617,13.617,0,0,0-.41,1.707A16.161,16.161,0,0,0,.053,255c-.035.513-.053,1.047-.053,1.587a4.506,4.506,0,0,0,1.3,3.375,4.631,4.631,0,0,0,3.351,1.245h12.7A4.631,4.631,0,0,0,20.7,259.96a4.5,4.5,0,0,0,1.3-3.375c0-.541-.018-1.075-.053-1.587Zm-2.313,3.822a3.117,3.117,0,0,1-2.286.811H4.651a3.117,3.117,0,0,1-2.286-.811,2.944,2.944,0,0,1-.821-2.235c0-.5.016-1,.049-1.478a14.574,14.574,0,0,1,.193-1.529,12.009,12.009,0,0,1,.36-1.5,6.943,6.943,0,0,1,.56-1.294,4.44,4.44,0,0,1,.763-1.019,3.03,3.03,0,0,1,.992-.629,3.5,3.5,0,0,1,1.217-.239c.054.029.15.085.307.189.318.211.684.452,1.089.715a7.59,7.59,0,0,0,1.746.8,6.825,6.825,0,0,0,4.354,0,7.6,7.6,0,0,0,1.747-.8c.414-.27.77-.5,1.088-.715.156-.1.252-.16.307-.189a3.5,3.5,0,0,1,1.217.239,3.034,3.034,0,0,1,.992.629,4.429,4.429,0,0,1,.763,1.019,6.919,6.919,0,0,1,.561,1.294,11.983,11.983,0,0,1,.361,1.5,14.7,14.7,0,0,1,.193,1.529h0c.033.475.049.972.049,1.477a2.943,2.943,0,0,1-.821,2.234Zm0,0" transform="translate(0 -235.205)" fill="#1d2738"></path>
                                        </g>
                                        </svg>
                                    </i>
                                </a>
                            </li>
                        </c:if> 
                        <c:if test="${not empty sessionScope.account}">
                            <li class="list-inline-item d-sm-inline d-none" >
                                <a href="${pageContext.request.contextPath}/login" style="
                                   padding-top: 2px;
                                   padding-left: 0px;
                                   font-size: 18px;
                                   font-weight: bold;
                                   vertical-align: middle;
                                   display: inline-block;
                                   position: relative;">
                                    Hello ${account.username} </a>
                                <!--/store-->
                            </li>
                        </c:if>


                        <li class="list-inline-item " >
                            <a href="ShowCart">
                                <!--https://monatabluelight.com/gio-hang-->
                                <i style='padding-top: 0px'>
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="26" viewBox="0 0 24 26">
                                    <g transform="translate(-14.696)">
                                    <g id="Group_123" data-name="Group 123" transform="translate(14.696)">
                                    <path id="Path_669" data-name="Path 669" d="M38.687,25.352l-1.974-18.1a.6.6,0,0,0-.592-.518H32.47v-1.1a5.725,5.725,0,0,0-11.449,0v1.1h-3.75a.6.6,0,0,0-.592.518L14.7,25.352a.574.574,0,0,0,.132.453.534.534,0,0,0,.428.194H38.128a.534.534,0,0,0,.428-.194A.574.574,0,0,0,38.687,25.352ZM31.877,10a.518.518,0,1,1-.526.518A.516.516,0,0,1,31.877,10ZM22.205,5.634a4.541,4.541,0,0,1,9.08,0v1.1h-9.08ZM21.613,10a.518.518,0,1,1-.526.518A.516.516,0,0,1,21.613,10ZM15.955,24.8,17.8,7.868h3.224V8.936A1.648,1.648,0,0,0,19.9,10.491a1.678,1.678,0,0,0,3.356,0A1.648,1.648,0,0,0,22.14,8.936V7.868h9.08V8.936A1.648,1.648,0,0,0,30.1,10.491a1.678,1.678,0,0,0,3.356,0,1.648,1.648,0,0,0-1.119-1.554V7.868h3.356L37.536,24.8Z" transform="translate(-14.696)" fill="#1d2738"></path>
                                    </g>
                                    </g>
                                    </svg>
                                </i>
                                <span class="cart-badge" style='padding-top: 0px'>
                                    ${sessionScope.sizeCart!=null?sessionScope.sizeCart:0}                      
                                </span>
                            </a>
                        </li>
                        <li class="list-inline-item" >
                            <a href="javascript:void(0);" onclick="$('#frm_product').toggleClass('selected')">
                                <i style='padding-top: 0px'>
                                    <svg xmlns="http://www.w3.org/2000/svg" width="26" height="26" viewBox="0 0 26 26">
                                    <g transform="translate(-0.006)">
                                    <g id="_x34__4_" transform="translate(0.006)">
                                    <g id="Group_124" data-name="Group 124" transform="translate(0)">
                                    <path id="Path_670" data-name="Path 670" d="M25.759,24.586,19.047,17.98a10.618,10.618,0,0,0,2.838-7.215A10.854,10.854,0,0,0,10.945,0,10.853,10.853,0,0,0,.006,10.765,10.853,10.853,0,0,0,10.945,21.53a11,11,0,0,0,6.885-2.4l6.739,6.632a.851.851,0,0,0,1.19,0A.82.82,0,0,0,25.759,24.586ZM10.945,19.874a9.183,9.183,0,0,1-9.256-9.109,9.183,9.183,0,0,1,9.256-9.109A9.183,9.183,0,0,1,20.2,10.765,9.183,9.183,0,0,1,10.945,19.874Z" transform="translate(-0.006)" fill="#1d2738"></path>
                                    </g>
                                    </g>
                                    </g>
                                    </svg>
                                </i>
                            </a>
                            
                            <form id="frm_product" action="search?index=1" method="post">
                                <!--https://monatabluelight.com/san-pham.html-->
                                <input type="text" name="search" value="" placeholder="Tìm kiếm...">
                                <button type="submit">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 26 26">
                                    <g transform="translate(-0.006)">
                                    <g id="_x34__4_" transform="translate(0.006)">
                                    <g id="Group_124" data-name="Group 124" transform="translate(0)">
                                    <path id="Path_670" data-name="Path 670" d="M25.759,24.586,19.047,17.98a10.618,10.618,0,0,0,2.838-7.215A10.854,10.854,0,0,0,10.945,0,10.853,10.853,0,0,0,.006,10.765,10.853,10.853,0,0,0,10.945,21.53a11,11,0,0,0,6.885-2.4l6.739,6.632a.851.851,0,0,0,1.19,0A.82.82,0,0,0,25.759,24.586ZM10.945,19.874a9.183,9.183,0,0,1-9.256-9.109,9.183,9.183,0,0,1,9.256-9.109A9.183,9.183,0,0,1,20.2,10.765,9.183,9.183,0,0,1,10.945,19.874Z" transform="translate(-0.006)" fill="#1d2738"></path>
                                    </g>
                                    </g>
                                    </g>
                                    </svg>
                                </button>
                            </form>
                        </li>
                    </ul>
                </div>
                <div class="clearfix"></div>
            </div>
        </div><!-- /.header-nav-->


        <div class="block-menu-slider">
            <div class="container">
                <div class="menu-slick slick-initialized slick-slider">
                    <div class="slick-list draggable" style="height: 64px;">
                        <div class="slick-track" style="opacity: 1; width: 196px; transform: translate3d(0px, 0px, 0px);">
                            <div class="text-center slick-slide slick-current slick-active" data-slick-index="0" aria-hidden="false" tabindex="0" style="width: 196px;">
                                <a target="_self" href="list" tabindex="0">FREE SHIP ĐƠN HÀNG TỪ 600.000 VND</a>
                                <!--https://monatabluelight.com//san-pham.html-->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div><!-- /.block-menu-slider-->

        <script type="text/javascript">
            $(document).ready(function () {
                $('.block-menu-slider .menu-slick').slick({
                    dots: false,
                    infinite: true,
                    autoplay: true,
                    autoplaySpeed: 3000,
                    speed: 300,
                    slidesToShow: 1,
                    adaptiveHeight: true
                });
            })
        </script>

        <script language="javascript" type="text/javascript" src="https://monatabluelight.com/modules/products/assets/js/cat.js?v=1716981831"></script>
        <script language="javascript" type="text/javascript" src="https://monatabluelight.com/templates/default/js/bootstrap.min.js?v=1716981831"></script>
        <script language="javascript" type="text/javascript" src="https://monatabluelight.com/templates/default/js/library.js?v=1716981831"></script>
        <script language="javascript" type="text/javascript" src="https://monatabluelight.com/templates/default/js/slick.min.js?v=1716981831"></script>
        <span id="PING_IFRAME_FORM_DETECTION" style="display: none;"></span>
    </body>
</html>
