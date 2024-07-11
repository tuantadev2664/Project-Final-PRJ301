<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
        }

        .container {
            max-width: 400px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            border-radius: 4px;
            border: 1px solid #ccc;
        }

        .container h1 {
            text-align: center;
        }

        .form-row {
            margin-bottom: 10px;
        }

        .form-row label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }

        .form-row input[type="text"],
        .form-row input[type="number"],
        .form-row input[type="date"] {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        .form-row input[type="submit"]{
            font-size: 16px;
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            border: 1px solid #4CAF50;
            margin-right: 10px;
            width: 100px; /* Set the width for both buttons */
        }

        .form-row .back-button {
            text-decoration: none;
            color: red;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Thêm tài khoản</h1>
        <form action="manageaccountadd" method="POST">
            <div class="form-row">
                <label for="usernameInput">Username:</label>
                <input type="text" id="usernameInput" name="username">
            </div>

            <div class="form-row">
                <label for="passwordInput">Password:</label>
                <input type="text" id="passwordInput" name="password">
            </div>

            <div class="form-row">
                <label for="fullnameInput">Fullname:</label>
                <input type="text" id="fullnameInput" name="fullname">
            </div>

            <div class="form-row">
                <label for="emailInput">Email:</label>
                <input type="text" id="emailInput" name="email">
            </div>

            <div class="form-row">
                <label for="phoneInput">Phone:</label>
                <input type="text" id="phoneInput" name="phone">
            </div>

            <div class="form-row">
                <label for="roleInput">Role:</label>
                <input type="text" id="roleInput" name="role">
            </div>

            <div class="form-row">
                <input type="submit" value="Lưu">
                <a href="manageaccount" class="back-button">Quay lại</a>
            </div>
        </form>
    </div>
</body>
</html>