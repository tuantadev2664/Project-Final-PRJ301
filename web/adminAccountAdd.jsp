<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Thêm tài khoản</title>
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

        .container {
            max-width: 400px;
            width: 100%;
            padding: 30px;
            background-color: var(--secondary-color);
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        h1 {
            text-align: center;
            color: var(--primary-color);
            margin-bottom: 30px;
        }

        .form-row {
            margin-bottom: 20px;
        }

        .form-row label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
            color: var(--text-color);
        }

        .form-row input[type="text"],
        .form-row input[type="number"],
        .form-row input[type="date"] {
            width: 100%;
            padding: 10px;
            border: 1px solid var(--accent-color);
            border-radius: 4px;
            box-sizing: border-box;
            transition: border-color 0.3s ease;
        }

        .form-row input[type="text"]:focus,
        .form-row input[type="number"]:focus,
        .form-row input[type="date"]:focus {
            outline: none;
            border-color: var(--primary-color);
        }

        .form-row input[type="submit"],
        .form-row .back-button {
            font-size: 16px;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.3s ease;
            width: 100px;
            text-align: center;
            display: inline-block;
        }

        .form-row input[type="submit"] {
            background-color: var(--primary-color);
            color: var(--secondary-color);
        }

        .form-row .back-button {
            background-color: var(--accent-color);
            color: var(--secondary-color);
            text-decoration: none;
        }

        .form-row input[type="submit"]:hover,
        .form-row .back-button:hover {
            transform: translateY(-2px);
        }

        .button-container {
            display: flex;
            justify-content: space-between;
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
            <div class="form-row button-container">
                <input type="submit" value="Lưu">
                <a href="manageaccount" class="back-button">Quay lại</a>
            </div>
        </form>
    </div>
</body>
</html>