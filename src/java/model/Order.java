package model;

import java.util.Date;

/**
 *
 * @author hadi
 */
public class Order {
    private String orderId;
    private String accountId;
    private Date orderDate;
    private String name;
    private String phone;
    private String email;
    private String city;
    private String district;
    private String ward;
    private String address;
    private String quantity;
    private String total;

    public Order() {
    }

    public Order(String orderId, String accountId, Date orderDate, String name, String phone, String email, String city, String district, String ward, String address, String quantity, String total) {
        this.orderId = orderId;
        this.accountId = accountId;
        this.orderDate = orderDate;
        this.name = name;
        this.phone = phone;
        this.email = email;
        this.city = city;
        this.district = district;
        this.ward = ward;
        this.address = address;
        this.quantity = quantity;
        this.total = total;
    }

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    public String getAccountId() {
        return accountId;
    }

    public void setAccountId(String accountId) {
        this.accountId = accountId;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getDistrict() {
        return district;
    }

    public void setDistrict(String district) {
        this.district = district;
    }

    public String getWard() {
        return ward;
    }

    public void setWard(String ward) {
        this.ward = ward;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getQuantity() {
        return quantity;
    }

    public void setQuantity(String quantity) {
        this.quantity = quantity;
    }

    public String getTotal() {
        return total;
    }

    public void setTotal(String total) {
        this.total = total;
    }
    
    
 
    
    
    
    
}

