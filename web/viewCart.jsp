<%@ page contentType="text/html; charset=UTF-8" import="controller.*, model.*, java.util.*, dao.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
        <style>
            body {
                font-family: Arial, sans-serif;
            }
            .title-form {
                margin-bottom: 20px;
            }
            .tbl-payment, .tbl-cart {
                width: 100%;
                margin-bottom: 20px;
            }
            .tbl-payment td, .tbl-cart td {
                padding: 10px;
                vertical-align: middle;
            }
            .tbl-payment .label {
                width: 30%;
            }
            .tbl-payment .value, .tbl-cart .name {
                width: 70%;
            }
            .cart-footer {
                margin-top: 20px;
            }
            .order-value {
                font-weight: bold;
            }
            .btn-cart {
                background-color: #5cb85c;
                color: white;
                padding: 10px 20px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                margin-top: 20px;
            }
            .btn-cart:hover {
                background-color: #4cae4c;
            }
            .delete {
                color: red;
                text-decoration: none;
                margin-left: 10px;
            }
            .delete-icon {
                color: red;
                font-size: 20px;
                cursor: pointer;
            }
        </style>


        <script type="text/javascript">
            function validateUpdateCart(id, colorid, size) {
                var inputElement = document.querySelector('input[name="quantity' + id + colorid + size + '"]');
                var quantity = inputElement.value;
                if (true) {
                    id = id + ';' + colorid + ';' + size + ';' + quantity;
                    window.location = "ShowCart?param=" + id;
                }
            }
        </script>

    </head>
    <body>
        <jsp:include page="header.jsp" />

        <div id="cart-content" class="container">
            <div class="row">
                <!-- Payment Content -->
                <div class="col-lg-6">
                    <div id="payment-content">
                        <form id="frmPayment" name="frmPayment" action="Order" method="get">
                            <div class="payment-info">
                                <div class="title-form">
                                    <h3 class="regular df"><b>Địa chỉ giao hàng</b></h3>
                                </div>
                                <div class="payment-content">
                                    <table class="tbl-payment">
                                        <tbody>
                                            <tr>

                                                <td >Họ tên <span class="red">*</span></td>
                                                <td class="value"><input class="form-control" id="sender_name" name="sender_name" type="text" size="38" value="${sessionScope.account.fullname}" required></td>
                                            </tr>
                                            <tr>
                                                <td >Email <span class="red">*</span></td>
                                                <td class="value"><input class="form-control" id="sender_email" name="sender_email" type="text" size="38" value="${sessionScope.account.email}" required></td>
                                            </tr>
                                            <tr>
                                                <td>Số điện thoại <span class="red">*</span></td>
                                                <td class="value"><input class="form-control" id="sender_telephone" name="sender_telephone" type="text" size="38" value="${sessionScope.account.phone}" required></td>
                                            </tr>
                                            <tr>
                                                <td>Tỉnh thành <span class="red">*</span></td>
                                                <td class="value">
                                                    <select id="city" name="city" class="form-control" onchange="calculator_ship(true);" data-id="0" required>
                                                        <option value="0">Tỉnh Thành</option>
                                                    </select>
                                                </td>                                        </tr>
                                            <tr>
                                                <td>Quận huyện <span class="red">*</span></td>
                                                <td class="value">
                                                    <select id="district" name="district_id" class="form-control" onchange="calculator_ship(true);" data-id="0" required>
                                                        <option value="0">Chọn Quận/Huyện</option>
                                                    </select>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td >Xã phường <span class="red">*</span></td>
                                                <td class="value">
                                                    <select onchange="$('#ward_name').val($('#ward_id option:selected').text());" id="ward" name="ward_id" class="form-control" data-id="0" required>
                                                        <option value="0">Chọn Xã/Phường</option>
                                                    </select>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Địa chỉ cụ thể<span class="red">*</span></td>
                                                <td class="value"><input class="form-control" id="sender_address" name="sender_address" type="text" size="38" value="" required></td>
                                            </tr>
                                            <tr>
                                                <td style="vertical-align: top;">Ghi chú</td>
                                                <td class="value"><textarea class="form-control" id="sender_comments" name="sender_comments" rows="3"></textarea></td>
                                            </tr>
                                        <script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.21.1/axios.min.js"></script>
                                        <script>
                                                        var citis = document.getElementById("city");
                                                        var districts = document.getElementById("district");
                                                        var wards = document.getElementById("ward");
                                                        var Parameter = {
                                                            url: "https://raw.githubusercontent.com/kenzouno1/DiaGioiHanhChinhVN/master/data.json",
                                                            method: "GET",
                                                            responseType: "application/json",
                                                        };
                                                        var promise = axios(Parameter);
                                                        promise.then(function (result) {
                                                            renderCity(result.data);
                                                        });

                                                        function renderCity(data) {
                                                            for (const x of data) {
                                                                citis.options[citis.options.length] = new Option(x.Name, x.Name);
                                                            }
                                                            citis.onchange = function () {
                                                                district.length = 1;
                                                                ward.length = 1;
                                                                if (this.value != "") {
                                                                    const result = data.filter(n => n.Name === this.value);

                                                                    for (const k of result[0].Districts) {
                                                                        district.options[district.options.length] = new Option(k.Name, k.Name);
                                                                    }
                                                                }
                                                            };
                                                            district.onchange = function () {
                                                                ward.length = 1;
                                                                const dataCity = data.filter((n) => n.Name === citis.value);
                                                                if (this.value != "") {
                                                                    const dataWards = dataCity[0].Districts.filter(n => n.Name === this.value)[0].Wards;

                                                                    for (const w of dataWards) {
                                                                        wards.options[wards.options.length] = new Option(w.Name, w.Name);
                                                                    }
                                                                }
                                                            };
                                                        }




                                        </script>
                                        </tbody>
                                    </table>
                                </div>
                            </div>

                            <div class="payment-method">
                                <div class="title-form">
                                    <h3 class="regular"><b>Chọn hình thức thanh toán</b></h3>
                                </div>
                                <div class="payment-content">
                                    <input class="payment-type" name="ord_payment_type" type="radio" id="ord_payment_type2" value="2">&nbsp;<label for="ord_payment_type2">Nhận hàng – Thanh toán (COD)</label><br>
                                    <input class="payment-type" name="ord_payment_type" type="radio" id="ord_payment_type1" value="1">&nbsp;<label for="ord_payment_type1">Thanh toán bằng chuyển khoản (Phí vận chuyển: 15.000VNĐ) </label><br>
                                    <input class="payment-type" name="ord_payment_type" type="radio" id="ord_payment_type4" value="4">&nbsp;<label for="ord_payment_type4">Thanh toán MOMO</label><br>
                                    <input class="payment-type" name="ord_payment_type" type="radio" id="ord_payment_type3" value="3">&nbsp;<label for="ord_payment_type3">Thanh toán trực tuyến qua Ngân Lượng</label><br />
                                    <script type="text/javascript">
                                        $("input[name='ord_payment_type']").click(function () {
                                            if ($("input[name='ord_payment_type']:checked").val() == 1) {
                                                $('.ord_payment_type_1').removeClass('hidden');
                                            } else {
                                                $('.ord_payment_type_1').addClass('hidden');
                                            }
                                            calculator_ship(false);
                                        });
                                    </script>
                                    <hr>
                                    <p><strong>Lưu ý trước khi&nbsp;xác nhận hoàn thành&nbsp;đặt hàng tại website Monatabluelight.com ( Đối với đơn đặt hàng thành công, sau khi đặt hàng, sẽ nhận được Email xác nhận đơn từ mbl@monatabluelight.com, nếu không nhận được email xác nhận đơn hàng, vui lòng liên hệ trực tiếp qua <a href="">Fanpage MonataBluelight&nbsp;</a>để được hỗ trợ trực tiếp).</strong></p>
                                    <hr>
                                    <div>
                                        <label><input name="agree_mbl" type="checkbox"> Tôi đồng ý <a href="http://monatabluelight.com/chinh-sach-mua-hang-i4" target="_blank">Điều kiện - Điều khoản</a> &amp; <a href="http://monatabluelight.com/-i5" target="_blank">Chính sách bảo mật</a> của Monata Bluelight.</label>
                                    </div>
                                    <button type="submit" class="btn-cart" href="" onclick=";" title="Hoàn thành đặt mua">Hoàn thành đặt mua</button>
                                </div>
                            </div>
                            <input type="hidden" id="city_name" name="city_name" value="">
                            <input type="hidden" id="district_name" name="district_name" value="district">
                            <input type="hidden" id="ward_name" name="ward_name" value="ward">
                            <input type="hidden" id="fee_ship" name="fee_ship" value="0">
                            <input type="hidden" id="fee_ship_cod" value="25000">
                            <input type="hidden" id="fee_ship_cod_ur" value="15000">
                            <input type="hidden" id="fee_ship_ck" value="15000">
                            <input type="hidden" id="fee_ship_ck_ur" value="0">
                        </form>
                    </div>
                </div>

                <!-- Cart Content -->
                <div class="col-lg-6">
                    <div class="title-form">
                        <h3 class="regular df"><b>Thông tin giỏ hàng</b></h3>
                    </div>
                    <c:set var="o" value="${requestScope.Cart}" />

                    <form id="frmUpdateCart" name="frmUpdateCart">
                        <table id="simple-example-table" class="tbl-cart">
                            <tbody>
                                <c:forEach items="${o.listItem}" var="i">
                                    <tr class="cart-item">
                                        <td class="thumb" style="width: 60px; vertical-align: top;">
                                            <a class="df" href="detail?productCode=${i.product.productCode}" title="${i.product.productName}">
                                                <img style="width: 100%" class="thumb img-responsive" alt="${i.product.productName}" src="${i.product.productImg}" onerror="#'"/>
                                            </a>
                                        </td>

                                        <td class="name">
                                            <a class="df heading" href="detail?productCode=${i.product.productCode}" title="${i.product.productName}">
                                                ${i.product.productName}
                                            </a>                                            
                                            <a class="delete-icon" href="ShowCart?param=${i.product.productCode};${i.product.productColorID.trim()};${i.product.productSize};0">&nbsp;&#10006;</a><br>
                                            <b style="color: #fb8a06">${i.product.productPrice}</b><input type="hidden" class="order-product-price" value="0"><br>
                                            <div>Color: <b>${i.product.productColor} <img style="width: 30px" src="${i.product.colorLink}"></b></div>
                                            <div>Size: <b>${i.product.productSize}</b></div>
                                            <div>Số lượng: 
                                                <input style="width: 50px" onchange="validateUpdateCart('${i.product.productCode}', '${i.product.productColorID.trim()}', '${i.product.productSize}');" name="quantity${i.product.productCode}${i.product.productColorID.trim()}${i.product.productSize}" class="quantity-value" type="number" value="${i.quantity}" size="3">
                                                <c:if test="${requestScope.error != null && requestScope.idError.equals(i.product.productName) && requestScope.colorError.equals(i.product.productColorID.trim()) && requestScope.sizeError.equals(i.product.productSize)}">
                                                    <div class="alert alert-danger" role="alert" style="margin-top: 10px">
                                                        ${requestScope.error}
                                                    </div>
                                                </c:if>
                                            </div>

                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>

                        <div class="input-group mb-2 mt-3">
                            <input name="discount_code" id="discount_code" type="text" class="form-control" placeholder="Mã voucher" aria-label="Mã voucher" aria-describedby="basic-addon2">
                            <div class="input-group-append">
                                <button onclick="validApplyDiscount()" class="btn btn-outline-secondary" type="button">Áp dụng</button>
                                <input type="hidden" name="cart_total" id="cart_total" value="0">
                            </div>
                        </div>

                        <div class="cart-footer">
                            <div>Tổng số lượng:<span class="order-value">${num}</span></div>
                            <div>Tổng tiền hàng:<span id="orderTotal" class="order-value"></span></div>
                            <div>Phí giao hàng:<span class="order-value span_product_fee_ship">15,000đ</span></div>
                            <p>Tổng giá trị đơn hàng:<span id="orderTotalFormatted" class="order-value span_product_total_amount"></span></p> 
                            <div>
                                <a class="continue-shopping" href="list">Tiếp tục mua sắm</a>
                                <a class="update-cart" href="ShowCart" onclick="validateUpdateCart();">Cập nhật giỏ hàng</a>
                            </div>
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

                        <input type="hidden" id="total_amount" name="total_amount" value="0">
                        <input type="hidden" id="total_free_ship" name="total_free_ship" value="0">
                    </form>
                </div>
            </div>
        </div>

        <jsp:include page="footer.jsp" />
    </body>
</html>
