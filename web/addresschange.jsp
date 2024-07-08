<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Chỉnh sửa địa chỉ</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <style>
    .form-group label {
      font-weight: bold;
      font-size: 16px;
      color: #333;
    }
    .form-group input.form-control {
      border: 1px solid #ccc;
      border-radius: 4px;
      padding: 8px 12px;
    }
  </style>
</head>
<body>
  <div class="container my-5">
    <h1>Chỉnh sửa địa chỉ</h1>
    <form action="address" method="POST">
      <input type="hidden" name="id" value="${a.idAddress}">
      <div class="form-group">
        <label for="houseNumber">Số nhà</label>
        <input type="text" class="form-control" id="houseNumber" name="houseNumber" value="${a.houseNumber}" required>
      </div>
      <div class="form-group">
        <label for="street">Đường</label>
        <input type="text" class="form-control" id="street" name="street" value="${a.street}" required>
      </div>
      <div class="form-group">
        <label for="ward">Phường/Xã</label>
        <input type="text" class="form-control" id="ward" name="ward" value="${a.ward}" required>
      </div>
      <div class="form-group">
        <label for="district">Quận/Huyện</label>
        <input type="text" class="form-control" id="district" name="district" value="${a.district}" required>
      </div>
      <div class="form-group">
        <label for="province">Tỉnh/Thành phố</label>
        <input type="text" class="form-control" id="province" name="province" value="${a.province}" required>
      </div>
      <div class="form-group">
        <label for="country">Quốc gia</label>
        <input type="text" class="form-control" id="country" name="country" value="${a.country}" required>
      </div>
      <button type="submit" class="btn btn-primary">Lưu thay đổi</button>
      <a href="#" onclick="cancelAddress(); return false;" class="btn btn-secondary">Hủy</a>
    </form>
  </div>
</body>
<script>
  function cancelAddress() {
    window.location.href = "login";
  }
</script>
</html>