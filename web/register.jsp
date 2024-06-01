<%-- 
    Document   : register
    Created on : May 31, 2024, 6:43:10 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div id="header_tab">
            <jsp:include page="header.jsp"/>
        </div>

        <div style="margin-top: 10px" class="container">
            <div class="eag-content-acc">
                <h2 class="title-head">Đăng ký tài khoản</h2>
                <div class="row">
                    <div class="col-lg-12 ">
                        <div class="page-login">
                            <div id="login">
                                <form method="post" action="/account/register" id="customer_register" accept-charset="UTF-8"><input name="FormType" type="hidden" value="customer_register"><input name="utf8" type="hidden" value="true"><input type="hidden" id="Token-27ff996297ac4cc589d7fbfa355d3ab4" name="Token" value="03AFcWeA6R5B7fafBQAL-5RF7wD1TotAMME-Yf4F7rF83ykAjE8X71LmVkERyeuwsRTi7lMiJuKBZ8y5Q0zqivDzln7brw294h0GTDASOxZzvqPM0Hzd_FR_myLZmc9QPeHLMN1Z7U4K3GhkQZHY3KRCp-_zBZVDRNM8l6hKf5eHWPCe5UWVRu3fmsBVXA3wf1xv7x5CW2DuAgkUvhx5lXoDR-7bDkg4ZVX63POv_lld-UL40KWwaUsCURwxF90ee2MHVMkJUDoR60gFU8Xkx2ZXN_4SqDHWK1odn3ZLD8XKFVn6D552Do-WL2Vcz7KYYRWiWWOyHA_kYBzOVuXV_6zewpuOlvVFzfRuyR4Yl2Pcr6RFMXvDSXkenZwUmm8zmgXfuoZ5pvShMfYWtHHFSBhzp5SR5zPvhKmsO6RHp4AhxdAcKWvUK7-0hg78AN4sZGJbsu37KRqFXzfX_od9nh7CNBLK2Tmg98ECiJHRVmafcm4Miq7ebU9B-881w2_VFQz866a6-uzSnG8srCPFnR8yo6YIrUOfS9WWtUVX7XiQUGZJF0M3kOlAB-bj2D_ZsNUOR8l80h_CaEeCUIEO6bC4_f_vtFc_W42w_PEBbekFoxNoP8HC5wP-sEZXPshvNXixfBapBvrP6NHEkTDC9L8F8IHrmXr9kB8z4TkpTNX_n1tIeXX1mNmxrv-1EfYb0Z6yBwuJmcMqgMnRBfX3D4gbP6Nggl8AQQYQ"><script src="https://www.google.com/recaptcha/api.js?render=6Ldtu4IUAAAAAMQzG1gCw3wFlx_GytlZyLrXcsuK"></script><script>grecaptcha.ready(function () {
                                        grecaptcha.execute("6Ldtu4IUAAAAAMQzG1gCw3wFlx_GytlZyLrXcsuK", {action: "customer_register"}).then(function (token) {
                                            document.getElementById("Token-27ff996297ac4cc589d7fbfa355d3ab4").value = token
                                        });
                                    });</script>

                                    <div class="form-signup clearfix">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <fieldset class="form-group">
                                                    <label>Họ:<span class="ega-red-color">*</span> </label>
                                                    <input style="
                                                           height:3rem;
                                                           padding:.5rem 1rem;
                                                           font-size:1.25rem;
                                                           line-height:1.5;
                                                           border-radius:.3rem;
                                                           border: 2px solid black;
                                                           font-size: 15px" type="text" class="form-control form-control-lg ega-input-valid" value="" name="lastName" id="lastName" placeholder="">
                                                    <div class="eg-error-form" style="color:#a94442;display: none">
                                                        Họ trống!
                                                    </div>
                                                </fieldset>
                                            </div>
                                            <div class="col-md-12">
                                                <fieldset class="form-group">
                                                    <label>Tên:<span class="ega-red-color">*</span> </label>
                                                    <input style="
                                                           height:3rem;
                                                           padding:.5rem 1rem;
                                                           font-size:1.25rem;
                                                           line-height:1.5;
                                                           border-radius:.3rem;
                                                           border: 2px solid black;
                                                           font-size: 15px" type="text" class="form-control form-control-lg ega-input-valid" value="" name="firstName" id="firstName" placeholder="">
                                                    <div class="eg-error-form" style="color:#a94442;display: none">
                                                        Tên trống!
                                                    </div>
                                                </fieldset>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <fieldset class="form-group">
                                                    <label>Email:<span class="ega-red-color">*</span> </label>
                                                    <input style="
                                                           height:3rem;
                                                           padding:.5rem 1rem;
                                                           font-size:1.25rem;
                                                           line-height:1.5;
                                                           border-radius:.3rem;
                                                           border: 2px solid black;
                                                           font-size: 15px" type="email" class="form-control form-control-lg ega-input-valid" value="" name="email" id="email" placeholder="">
                                                    <div class="eg-error-form" style="color:#a94442;display: none">
                                                        Email không hợp lệ!
                                                    </div>
                                                </fieldset>
                                            </div>
                                            <div class="col-md-12">

                                                <fieldset class="form-group">
                                                    <label>Mật khẩu:<span class="ega-red-color">*</span> </label>
                                                    <input style="
                                                           height:3rem;
                                                           padding:.5rem 1rem;
                                                           font-size:1.25rem;
                                                           line-height:1.5;
                                                           border-radius:.3rem;
                                                           border: 2px solid black;
                                                           font-size: 15px" type="password" class="form-control form-control-lg ega-input-valid" value="" name="password" id="password" placeholder="">
                                                    <div class="eg-error-form" style="color:#a94442;display: none">
                                                        Mật khẩu trống!
                                                    </div>
                                                </fieldset>
                                            </div>
                                        </div>


                                        <div class="col-xs-12 text-xs-left" style="margin-top:0px; padding: 0">
                                            <button style="color: white; background-color: black; font-size: 20px" type="summit" value="Đăng ký" class="btn ega-btn">Đăng ký</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>

        <div id="footer_tab">
            <jsp:include page="footer.jsp"/>
        </div>
        <div class="clr"></div>
    </body>
</html>
