<%@page contentType="text/html" pageEncoding="UTF-8" import="model.Account"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thay đổi thông tin</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f2f2f2;
                padding: 20px;
            }

            h1 {
                display: flex;
                justify-content: center;
                align-items: center;
                color: #333;


            }


            .form-container {
                max-width: 400px;
                margin: 0 auto;
                background-color: #fff;
                padding: 20px;
                border-radius: 5px;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            }

            .form-container label {
                display: block;
                font-weight: bold;
                margin-bottom: 5px;
            }

            .form-container input[type="text"] {
                width: 95%;
                padding: 8px;
                border: 1px solid #ccc;
                border-radius: 3px;
                font-size: 14px;
                margin-bottom: 10px;
            }

            .form-container input[type="submit"] {
                padding: 10px 20px;
                background-color: #4CAF50;
                color: #fff;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                font-size: 16px;
            }

            .form-container input[type="submit"]:hover {
                background-color: #45a049;
            }

            .form-container .form-group {
                display: flex;
                flex-direction: column;
                margin-bottom: 15px;
            }

            .form-container .form-group label {
                font-weight: bold;
            }

            .form-container .form-group input[type="text"] {
                padding: 8px;
                border: 1px solid #ccc;
                border-radius: 3px;
                font-size: 14px;
                margin-top: 5px;
            }

            .form-container .form-group input[type="submit"] {
                align-self: flex-start;
                margin-top: 10px;
            }

            .form-container input[type="submit"]:last-child {
                margin-right: 0;
            }

            .form-container .button-container {
                text-align: center;
                margin-top: 20px;
            }

            .form-container .button-container .back-button {
                background-color: #f44336;
            }
        </style>
    </head>
    <body>
        <div class="form-container">
            <h1>Thay đổi thông tin</h1>
            <%-- Lấy giá trị thuộc tính của đối tượng acc --%>
            <% Account acc = (Account)request.getAttribute("acc"); %>

            <%-- Form để cập nhật thông tin acc --%>
            <form action="manageaccountupdate" method="POST">
                <input type="hidden" name="id" value="<%= acc.getId() %>" />

                <div class="form-group">
                    <label for="username">Username:</label>
                    <input type="text" name="username" value="<%= acc.getUsername() %>" />
                </div>

                <div class="form-group">
                    <label for="password">Password:</label>
                    <input type="text" name="password" value="<%= acc.getPassword() %>" />
                </div>

                <div class="form-group">
                    <label for="fullname">Full Name:</label>
                    <input type="text" name="fullname" value="<%= acc.getFullname() %>" />
                </div>

                <div class="form-group">
                    <label for="email">Email:</label>
                    <input type="text" name="email" value="<%= acc.getEmail() %>" />
                </div>

                <div class="form-group">
                    <label for="phone">Phone:</label>
                    <input type="text" name="phone" value="<%= acc.getPhone() %>" />
                </div>

                <div class="form-group">
                    <label for="role">Role:</label>
                    <input type="text" name="role" value="<%= acc.getRole() %>" />
                </div>

                <div class="button-container">
                    <input type="submit" value="Cập nhật" />
                    <input type="submit" value="Quay lại" />
                </div>
            </form>
        </div>
    </body>
</html>