<%-- 
    Document   : orderSuccessful
    Created on : Jul 13, 2024, 1:05:19 AM
    Author     : FPTSHOP
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <link rel="stylesheet" type="text/css" media="screen" href="https://monatabluelight.com/modules/products/assets/css/cart.css?v=1720807400">
        <link rel="stylesheet" type="text/css" media="screen" href="https://monatabluelight.com/templates/default/css/bootstrap.css?v=1720807400">
        <link rel="stylesheet" type="text/css" media="screen" href="https://monatabluelight.com/templates/default/css/style.css?v=1720807400">
        
    </head>
    <body>

        <div id="header_tab">
            <jsp:include page="header.jsp"/>
        </div>
        <div class="clr"></div>

        <div class="container products">
            <div id="cart-content">
                <div class="row">
                    <div class="col-lg-6">
                        <div id="payment-content">
                            <div class="payment-info">
                                <div class="title-form">
                                    <h3 class="regular df"><b>Địa chỉ giao hàng</b></h3>
                                </div><!--end: .title-form-->
                                <div class="payment-content">
                                    <p><b>${name}</b></p>
                                    <p><b>Điện thoại:</b>${phone}</p>
                                    <p><b>Email:</b>${email}</p>
                                    <p><b>Địa chỉ:</b>${address}</p>
                                </div><!--end: .payment-content-->
                            </div><!--end: .payment-info-->
                        </div><!--end: #payment-content-->
                    </div>
                    <div class="col-lg-6">
                        <div class="title-form">
                            <h3 class="regular df"><b>Thông tin đơn hàng</b></h3>
                        </div><!--end: .title-form-->
                        <h3 class="text-center">${orderId}</h3>
                        
                        <c:set var="o" value="${requestScope.listI}" />
                        <form id="frmUpdateCart" name="frmUpdateCart">
                            <table id="simple-example-table" class="tbl-cart">
                                <tbody>
                                    <c:forEach items="${o}" var="i">
                                    <tr class="cart-item">
                                        <td class="thumb" style="width: 60px; vertical-align: top;" >
                                            <a class="df" href="detail?productCode=${i.product.productCode}" title="${i.product.productName}">
                                                <img style="width: 200px" class="thumb img-responsive" alt="${i.product.productName}" src="${i.product.productImg}" onerror="this.src='https://monatabluelight.com/images/noimages.jpg'"/>
                                            </a>
                                        </td>
                                        <td class="name">
                                            <a class="df heading" href="detail?productCode=${i.product.productCode}" title="${i.product.productName}">
                                                ${i.product.productName}                                    
                                            </a><br>
                                            
                                            <b style="color: #fb8a06">${i.product.productPrice}</b><input type="hidden" class="order-product-price" value="390000"><br>
                                            
                                            <div>Color: 
                                                <b>
                                                    ${i.product.productColor} <img style="width: 30px" src="${i.product.colorLink}"></b>
                                                </b>
                                                
                                            </div><b>
                                                <div>Size: <b>${i.product.productSize}</b></div>                                    
                                                <div>Số lượng: <b>${i.quantity}</b></div>
                                            </b></td>
                                    </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                            <div class="cart-footer">
                                <div>Tổng số lượng:<span class="order-value">${num}</span></div>
                                <div>Tổng tiền hàng:<span id="orderTotal" class="order-value"></span></div>
                                <div>Phí giao hàng:<span class="order-value span_product_fee_ship">15,000đ</span></div>
                                <p>Tổng giá trị đơn hàng:<span id="orderTotalFormatted" class="order-value span_product_total_amount"></span></p>
                            </div>
                                
                                
                            <script>
                            // Function to format number with commas
                            function formatNumberWithCommas(number) {
                                return number.toLocaleString('en-US');
                            }

                            // Get the sum value from the server or wherever it's defined
                            var sum = ${sum}; // Ensure sum is properly assigned from your context

                            // Update the HTML element with formatted value
                            document.getElementById('orderTotal').textContent = formatNumberWithCommas(sum)+"đ";
                            document.getElementById('orderTotalFormatted').textContent = formatNumberWithCommas(sum+15000)+"đ";
                        </script>
                        </form>
                    </div>
                </div>
                <div style="border-top: 1px solid #666; padding-top: 10px">
                    <p>Đơn đặt hàng khởi tạo thành công! MBL sẽ liên hệ xác nhận trong thời gian tới.<br>Cảm ơn bạn đã đặt hàng tại <a href="/">monatabluelight.com</a>.</p>
                </div>
            </div>

            <script type="text/javascript">
                (function(i, s, o, g, r, a, m){i['GoogleAnalyticsObject'] = r; i[r] = i[r] || function(){
                (i[r].q = i[r].q || []).push(arguments)}, i[r].l = 1 * new Date(); a = s.createElement(o),
                        m = s.getElementsByTagName(o)[0]; a.async = 1; a.src = g; m.parentNode.insertBefore(a, m)
                })(window, document, 'script', '//www.google-analytics.com/analytics.js', 'ga');
                ga('create', 'UA-191435085-1', 'auto');
                ga('require', 'ecommerce', 'ecommerce.js');
                ga('ecommerce:addTransaction', {
                'id': '7499',
                        'affiliation': '',
                        'revenue': '',
                        'shipping': '',
                        'tax': ''
                });
                ga('ecommerce:addItem', {
                'id': '7499',
                        'name': 'Tee Lemon',
                        'sku': '',
                        'category': '<br />
                        <b>Notice</b>:  Undefined property: stdClass::$category_name in < b > /home/monatabl / public_html / modules / products / views / cart / payment_success.php < /b> on line <b>152</b > <br />
                        ',
                        'price': '390000',
                        'quantity': '1'
                });
                ga('ecommerce:send');
                ga('send', 'pageview');
            </script>
        </div>


        <div id="footer_tab">
            <jsp:include page="footer.jsp"/>
        </div>
        <div class="clr"></div>
    </body>
</html>
