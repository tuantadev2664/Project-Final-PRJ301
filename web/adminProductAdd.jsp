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
        <h1>Thêm sản phẩm</h1>
        <form action="addproduct" method="POST">
            <div class="form-row">
                <label for="codeInput">Product Code:</label>
                <input type="text" id="codeInput" name="productcode">
            </div>

            <div class="form-row">
                <label for="nameInput">Product Name:</label>
                <input type="text" id="nameInput" name="productname">
            </div>

            <div class="form-row">
                <label for="saleInput">Product Sale:</label>
                <input type="text" id="saleInput" name="productsale">
            </div>

            
            <div class="form-row">
                <label for="categoryInput">Product Category ID:</label>
                <input type="text" id="categoryInput" name="productcategory">
            </div>

            
            <div class="form-row">
                <label for="statusInput">Product Status:</label>
                <input type="text" id="statusInput" name="productstatus">
            </div>
            
            <div class="form-row">
                <label for="priceInput">Product Price:</label>
                <input type="text" id="priceInput" name="productprice">
            </div>

            <div class="form-row">
                <label for="oldpriceInput">Product Old Price:</label>
                <input type="text" id="oldpriceInput" name="productoldprice">
            </div>
            
            <div class="form-row">
                <label for="imageInput">Product Image Link:</label>
                <input type="text" id="imageInput" name="productimage">
            </div>

            <div class="form-row">
                <input type="submit" value="Lưu">
                <a href="manageaccount" class="back-button">Quay lại</a>
            </div>
        </form>
    </div>
</body>
</html>