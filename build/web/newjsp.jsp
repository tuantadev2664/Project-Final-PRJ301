<%-- 
    Document   : newjsp
    Created on : Jun 10, 2024, 4:30:00 PM
    Author     : FPTSHOP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <style>
            .notification {
                background-color: #f8f8f8;
                border: 1px solid #ddd;
                border-radius: 4px;
                padding: 10px;
                position: fixed;
                bottom: 20px;
                right: 20px;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
                display: none;
            }

            .notification .message {
                margin-right: 10px;
            }

            .notification .close-btn {
                background-color: #ddd;
                border: none;
                padding: 5px 10px;
                border-radius: 4px;
                cursor: pointer;
            }
        </style>
    </head>
    <body>

        <div id="notification" class="notification">
            <span class="message">Thông báo của bạn ở đây.</span>
            <button class="close-btn" onclick="closeNotification()">Đóng</button>
        </div>
        
        <script>
            showNotification();
            
            function showNotification() {
                var notification = document.getElementById('notification');
                notification.style.display = 'block';
            }

            function closeNotification() {
                var notification = document.getElementById('notification');
                notification.style.display = 'none';
            }
        </script>

    </body>
</html>