<%-- 
    Document   : product-detail
    Created on : May 30, 2024, 4:31:18 PM
    Author     : FPTSHOP
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="vi"><head id="Head1" prefix="og: http://ogp.me/ns# fb:http://ogp.me/ns/fb# article:http://ogp.me/ns/article#">

        <title>Product | group 5</title>


        <link type="image/x-icon" href="images/Premium Vector _ Men's fashion store logo design template_vector illustration.jpg" rel="icon">


        <link rel="stylesheet" href="css/bootstrapheader.css"> 
        <link rel="stylesheet" href="css/styleheader.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-element-bundle.min.js"></script>


        <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&amp;display=swap" rel="stylesheet">


        <link rel="stylesheet" type="text/css" media="screen" href="https://monatabluelight.com/templates/default/css/jquery.fancybox.min.css?v=1717149127"> 
        <link rel="stylesheet" type="text/css" media="screen" href="https://monatabluelight.com/templates/default/css/bootstrap.css?v=1717149127"> 
        <link rel="stylesheet" type="text/css" media="screen" href="https://monatabluelight.com/templates/default/css/style.css?v=1717149127"> 
        <script language="javascript" type="text/javascript" src="https://monatabluelight.com/templates/default/js/jquery.min.js"></script>


    </head>
    <body>
        
        <div class="container products">
            <div class="row">
                <input type="hidden" name="product_id" data-quantity="0" id="product_id" value="267">
                <div class="col-lg-6 product-thumbs">
                    <a id="a-product-image" href="${listP.productImagesDetail.get(0)}" data-fancybox="gallery" class="gallery-item">
                        <img id="product-image" class="img-fluid" src="${listP.productImagesDetail.get(1)}">
                    </a>
                    
<!--                    
                    <ul class="images-thumb ">
                         <li data-color="0" class="color-image main-image">
                            <img class="img-responsive" src="${(listP.productImagesDetail.get(2)!=null)?listP.productImagesDetail.get(2):""}">
                        </li>
                        <c:forEach items="${listP.productImagesDetail}" var="o1" begin="3" end="7">

                            <li class="first-color color-image color-634">
                                <img class="img-responsive" src="${o1}">
                            </li>

                        </c:forEach>

                        <c:forEach items="${listP.productImagesDetail}" var="o1" begin="8" >

                            <li class="color-image color-635">
                                <img class="img-responsive" src="${o1}">
                            </li>

                        </c:forEach>
                            
                        <c:forEach items="${listP.productImagesDetail}" var="o1" begin="10">

                            <li class="color-image color-636">
                                <img class="img-responsive" src="${o1}">
                            </li>

                        </c:forEach>
                         
                        <c:forEach items="${listP.productImagesDetail}" var="o1" begin="12">

                            <li class="color-image color-637">
                                <img class="img-responsive" src="${o1}">
                            </li>

                        </c:forEach>
                    </ul>
                        -->
                </div><!-- /.col-lg-6-->
                
                
                
                <div class="col-lg-6">
                    
                    <h1 class="detail-name">
                        ${listP.productName}

                        <span>${listP.productSale}</span>

                       
                    </h1>
                    
                    <div class="row code-status">
                        <div class="col-md-6">Mã sản phẩm: 
                            <b id="product-code">${listP.productCode}</b>
                        </div>
                        <div class="col-md-6">Tình trạng: 
                            <b>${listP.productStatus}</b>
                        </div>
                    </div>
                    
                    <div class="detail-price">
                          ${listP.productPrice}                                  
                    </div>
                    
                    <div class="detail-summary">
                        <c:forEach items="${listP.productDescription}" var="o2">
                        <p>${o2}</p>
                        </c:forEach>      
                    </div>
                    
                    <div class="detail-colors">
                        <a href="javascript:void(0);" data-id="${listP.getProductColorList().get(0).getColorID()}" class="selected">
                            <img src="${listP.getProductColorList().get(0).getColorLinkString()}">
                        </a>
                        <c:forEach items="${listP.getProductColorList()}" var="o2" begin="1">
                            <a href="javascript:void(0);" data-id="${o2.getColorID()}" class="">
                            <img src="${((o2.getColorLinkString() != null)? o2.getColorLinkString() : "")}">
                        </a>
                        </c:forEach>
                        
                    </div>
                    
                    <script type="text/javascript">
                        $('.detail-colors a').click(function () {
                            $('.detail-colors a').removeClass('selected');
                            $(this).addClass('selected');
                            var $id = $(this).attr('data-id');
                            $('input#color').val($id);

                            $('.product-thumbs ul li').removeClass('main-image').removeClass('first-color').removeClass('selected');
                            $('.product-thumbs ul li.color-' + $id).addClass('first-color');

                            if ($('.product-thumbs ul li.first-image.color-' + $id).length) {
                                $('#product-image').attr('src', $('.product-thumbs ul li.first-image.color-' + $id).children('img').attr('src').replace('/small/', '/large/'));
                                $('.product-thumbs ul li.first-image.color-' + $id).addClass('selected');
                            }

                            get_size_stocking();
                        });

                        function get_size_stocking($id) {
                            $('.button-size').removeClass('selected');
                            $('.button-size').prop('abled', true);
                            var $product_id = $('#product_id').val();
                            var $color = $('#color').val();
                            $.ajax({
                                type: 'POST',
                                url: '/index.php?module=products&view=product&raw=1&task=get_size_stocking&product_id=' + $product_id + '&color=' + $color,
                                dataType: 'json',
                                data: {product_id: $product_id, color: $color},
                                success: function (data) {
                                    $('#size').val(0);
                                    data.sizes.forEach(function (size) {
                                        $('#button-size-' + size).prop('disabled', false);
                                    })
                                }
                            });
                        }

                        $(document).ready(function () {
                            get_size_stocking();
                        })

                    </script>
                    
                    
                    <input type="hidden" name="color" id="color" value="634">
                    <input type="hidden" name="size" id="size" value="0">
                    
                    <div class="row detail-size-quantity">
                        
                        <div class="col-md-6">
                            <div class="de-title">Size</div>
                            <%
                                int k = 0;
                            %>
                            <c:forEach items="${listP.productSize}" var="o3">
                                <%
                                    k++;
                                %>
                                <button id="button-size-1" class="button-size" value="<%= k%>">${o3}</button>
                            </c:forEach>
                        </div>
                        
                        <div class="col-md-6">
                            
                            <div class="de-title">Số lượng</div>
                            
                            <input class="form-control" type="number" value="1" name="quantity" id="quantity">
                            
                        </div>
                        
                    </div>
                    
                    <a class="btn-detail add2cart" href="javascript:void(0);" data-quick="0" data-id="267">Thêm vào giỏ hàng</a>
                    
                    <div class="bound-btn-detail">
                        <a class="btn-detail add2cart" href="javascript:void(0);" data-quick="1" data-id="267">Mua ngay</a>
                        <a class="btn-detail btn-detail-fav">
                            <svg xmlns="http://www.w3.org/2000/svg" width="30" height="25.714" viewBox="0 0 30 25.714">
                            <path d="M27.857-15.737c0,3.064-3.1,5.91-3.147,5.96L15-.419,5.273-9.794c-.033-.033-3.131-2.879-3.131-5.943,0-4.7,3.181-5.692,5.859-5.692,2.494,0,5.307,2.7,6.177,3.733a1.106,1.106,0,0,0,1.641,0c.871-1.038,3.683-3.733,6.177-3.733C24.676-21.429,27.857-20.441,27.857-15.737Zm2.143,0c0-4.905-3-7.835-8-7.835-2.93,0-5.675,2.31-7,3.616-1.323-1.306-4.068-3.616-7-3.616-5.006,0-8,2.93-8,7.835,0,4.018,3.683,7.383,3.817,7.5L14.263,1.842a1.051,1.051,0,0,0,1.473,0L26.166-8.2C26.317-8.354,30-11.719,30-15.737Z" transform="translate(0 23.571)" fill="#fb8a06"></path>
                            </svg>
                        </a>
                    </div>
                    
                    <div class="detail-content">
                        <div class="accordion" id="accordionDetail">
                            <div class="card">
                                <div class="card-header" id="headingOne">
                                    <a href="javascript:void(0);" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                        Thông tin sản phẩm
                                    </a>
                                </div>
                                <div id="collapseOne" class="collapse" aria-labelledby="headingOne" data-parent="#accordionDetail">
                                    <div class="card-body">
                                        <p>
                                            <c:if test="${listP.productInfo != 'https://monatabluelight.com//upload_images/images/2024/02/24/QR%20PAY.jpeg'}">
                                            <img data-upload-status="success" data-uploading="uploaded" src="${(listP.productInfo == 'https://monatabluelight.com//upload_images/images/2024/02/24/QR%20PAY.jpeg')?'':listP.productInfo}" style="width: 600px; height: 600px;">
                                            </c:if>
                                        </p>                        
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-header" id="headingTwo">
                                    <a href="javascript:void(0);" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                        Chính sách đổi hàng
                                    </a>
                                </div>
                                <div id="collapseTwo" class="collapse" aria-labelledby="collapseTwo" data-parent="#accordionDetail">
                                    <div class="card-body">
                                        <p>Mọi đơn đặt hàng Online đều sẽ không kiểm tra hàng ( đồng kiểm&nbsp;khi nhận) để đảm bảo hàng hóa còn nguyên vẹn,niêm phong,&nbsp;&nbsp;không hư hỏng khi đến tận tay khách hàng. ( Tránh trường hợp lúc kiểm tra cắt bao bì&nbsp;làm hư hỏng sản phẩm, và tráo hàng khi nhận).</p>
                                        <p>
                                            <strong>- Áp dụng trả hàng hoàn tiền trong trường hợp sản phẩm gửi cho khách hàng gặp vấn đề ( không đúng sản phẩm đặt, bị lỗi.._</strong>
                                        </p>
                                        <p>
                                            <strong>- Áp dụng đổi hàng với những quy định cụ thể dưới đây:&nbsp;</strong>
                                        </p>
                                        <p>Đối với những đơn hàng tại <strong>Group 5</strong> , sau khi hoàn thành đơn hàng (đơn hàng đã được xác nhận thành công, đơn vị vận chuyển đã tiếp nhận). Bạn không được hủy đơn hàng và <strong>Group 5</strong>&nbsp;sẽ không nhận trả hàng. Nếu bạn muốn hủy đơn- không thể nhận được đơn hàng, vui lòng thanh toán phí vận chuyển cho đơn vị giao hàng.<br>Sau khi nhận hàng, nếu gặp bất kì trường hợp nào dưới đây bạn có thể liên hệ với đội ngũ Monata Bluelight để được hỗ trợ đổi sản phẩm mới theo quy định hoặc làm theo hướng dẫn ở phiếu đổi hàng được đính kèm.</p>
                                        <p>♦ Nếu đơn hàng bị lỗi do nhà sản xuất, lỗi sản phẩm trong quá trình đóng gói và vận chuyển&nbsp;(nhầm mẫu, màu hoặc&nbsp;size,...), bạn hãy liên hệ với đội ngũ MBL để được giải quyết, đổi sản phẩm khác. Và mọi chi phí sẽ do MBL chịu.</p>
                                        <p>
                                            <strong>Lưu ý: Group 5&nbsp;chỉ chấp nhận đổi hàng sản phẩm lỗi , gửi nhầm khi và chỉ khi sản phẩm còn nguyên tag, nhãn sản phẩm, và chưa qua sử dụng, nếu sản phẩm bị lỗi, gửi nhầm&nbsp;nhưng đã tháo tag nhãn, không còn nguyên vẹn, thì Group 5 không hỗ trợ đổi hàng.</strong>
                                        </p>
                                        <p>- Chúng tớ sẽ hỗ trợ 1 chiều phí ship trong trường hợp bạn đổi size sản phẩm&nbsp;</p>
                                        <p>- Chúng tớ sẽ thanh toán 2 chiều phí ship trong trường hợp sản phẩm gửi cho bạn bị lỗi, và không đúng sản phẩm đặt.</p>
                                        <p>- Sản phẩm có thời gian đổi - trả trong vòng 14&nbsp;ngày kể từ ngày đặt hàng.&nbsp;</p>                        
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-header" id="headingThree">
                                    <a href="javascript:void(0);" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                        Chính sách vận chuyển, thanh toán
                                    </a>
                                </div>
                                <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordionDetail">
                                    <div class="card-body">
                                        <p><strong>Group 5</strong> sử dụng hai đơn vị&nbsp;vận chuyển chính: VIETTEL POST, và SPX cho&nbsp;một số đơn hàng. Thời gian vận chuyển trung bình cho mỗi đơn hàng là từ 2 đến 5 ngày tùy khu vực.&nbsp;<br>Hình thức thanh toán:</p>
                                        <p>♦ Thanh toán chuyển khoản: sau khi đặt hàng, chuyển khoản tổng giá trị đơn hàng qua tài khoản ngân hàng.</p>
                                        <p><strong>BIDV-Ngân Hàng Thương Mại Cổ Phần Đầu Tư Và Phát Triển Việt Nam&nbsp;</strong></p>
                                        <p><strong>Chủ tài khoản: Trương Anh Tuấn</strong></p>
                                        <p><strong>STK: 0848270604</strong></p>
                                        <p><strong>Thông tin chuyển khoản: Tên + SĐT đặt hàng</strong></p>
                                        <p><strong><img alt="" src="images/QR.jpg" style="width: 300px; height: 329px;"></strong></p>
                                        <p>*Lưu ý: để tiện cho quá trình xác nhận đơn, hãy ghi chú số điện thoại sử dụng để đặt hàng&nbsp;vào thông tin chuyển khoản.</p>
                                        <p>♦ Thanh toán khi nhận hàng (Ship COD).</p>                        </div>
                                </div>
                            </div>
                        </div>
                    </div><!-- /.detail-content-->
                    
                </div><!-- /.col-lg-6-->
                
            </div><!-- /.row-->
            
            
            <!--detailproductchidenday-->
            
            <div class="products-other">
                <div class="content-title">Sản phẩm liên quan</div>
                <div class="row">
                    <c:forEach items="${listP1}" var="o">
                        <div class="col-lg-3 col-6">        
                            <div class="product-item">
                                <a class="thumb" href="detail?productCode=${o.productCode}" title="${o.productName}">
                                    <!--https://monatabluelight.com/tee-tele-bear-pd267.html-->
                                    <img class="img-fluid" src="${o.productImagesLarge.get(0)}" data-src="${o.productImagesLarge.get(0)}" data-hover="${((o.productImagesLarge.get(1)!= null)?o.productImagesLarge.get(1): o.productImagesLarge.get(0))}" alt="${o.productName}">
                                </a>
                                <h4 class="heading">
                                    <a href="" title="${o.productName}">${o.productName}</a>
                                </h4>
                                <!--https://monatabluelight.com/tee-tele-bear-pd267.html-->
                                <div class="info">${o.productStatus}</div>
                                <div class="price" >
                                    &nbsp; ${o.productPrice} &nbsp;&nbsp;
                                    <span>${((o.productOldPrice != "N/A")? o.productOldPrice: "")} </span>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>

            
            <div class="products-other">
                <div class="content-title">Sản phẩm đã xem</div>
<!--            <div class="row">
                    <div class="col-lg-3 col-6">        
                        <div class="product-item">
                            <a class="thumb" href="https://monatabluelight.com/tote-monat-blue-pd231.html" title="Tote Monat Blue">
                                <img class="img-fluid" src="https://monatabluelight.com/images/products/2023/10/09/large/0_1696843929.jpg" data-src="https://monatabluelight.com/images/products/2023/10/09/large/0_1696843929.jpg" data-hover="" alt="Tote Monat Blue">
                            </a>
                            <h4 class="heading"><a href="https://monatabluelight.com/tote-monat-blue-pd231.html" title="Tote Monat Blue">Tote Monat Blue</a></h4>
                            <div class="info">Available</div>
                            <div class="price">
                                250,000đ                                                
                            </div>
                        </div>
                    </div>

                </div>-->
            </div>
            
        </div>
       

        
        <!-- Your Chat Plugin code -->
        <script language="javascript" type="text/javascript" src="https://monatabluelight.com/modules/products/assets/js/product.js?v=1717149127"></script>
        <script language="javascript" type="text/javascript" src="https://monatabluelight.com/templates/default/js/jquery.fancybox.min.js?v=1717149127"></script>
        <script language="javascript" type="text/javascript" src="https://monatabluelight.com/templates/default/js/bootstrap.min.js?v=1717149127"></script>
        <script language="javascript" type="text/javascript" src="https://monatabluelight.com/templates/default/js/library.js?v=1717149127"></script>
        <script language="javascript" type="text/javascript" src="https://monatabluelight.com/templates/default/js/slick.min.js?v=1717149127"></script>
    </body></html>