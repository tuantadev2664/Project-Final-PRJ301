<%@page contentType="text/html" pageEncoding="UTF-8" import="model.Account"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Thay đổi thông tin</title>
    <style>
        :root {
            --primary-color: #000000;
            --secondary-color: #ffffff;
            --accent-color: #808080;
            --background-color: #f0f0f0;
            --text-color: #333333;
        }

        body {
            font-family: Arial, sans-serif;
            background-color: var(--background-color);
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .form-container {
            background-color: var(--secondary-color);
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            width: 400px;
        }

        h1 {
            color: var(--primary-color);
            text-align: center;
            margin-bottom: 30px;
            font-size: 24px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 5px;
            color: var(--text-color);
            font-weight: bold;
        }

        input[type="text"] {
            width: 100%;
            padding: 10px;
            border: 1px solid var(--accent-color);
            border-radius: 4px;
            font-size: 14px;
            transition: border-color 0.3s ease;
        }

        input[type="text"]:focus {
            outline: none;
            border-color: var(--primary-color);
        }

        .button-container {
            display: flex;
            justify-content: space-between;
            margin-top: 30px;
        }

        input[type="submit"] {
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }

        input[type="submit"]:first-child {
            background-color: var(--primary-color);
            color: var(--secondary-color);
        }

        input[type="submit"]:last-child {
            background-color: var(--accent-color);
            color: var(--secondary-color);
        }

        input[type="submit"]:hover {
            transform: translateY(-2px);
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h1>Thay đổi thông tin</h1>
        <% Account acc = (Account)request.getAttribute("acc"); %>
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