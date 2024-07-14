/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author hadi 
 */
public class OrderDetail {
    private String orderId;
    private String productId;
    private String color;
    private String size;
    private String quantity;
    private String img;

    public OrderDetail() {
    }

    public OrderDetail(String orderId, String productId, String color, String size, String quantity) {
        this.orderId = orderId;
        this.productId = productId;
        this.color = color;
        this.size = size;
        this.quantity = quantity;
    }

    public OrderDetail(String orderId, String productId, String color, String size, String quantity, String img) {
        this.orderId = orderId;
        this.productId = productId;
        this.color = color;
        this.size = size;
        this.quantity = quantity;
        this.img = img;
    }
    
    

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }
    
    

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    public String getProductId() {
        return productId;
    }

    public void setProductId(String productId) {
        this.productId = productId;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public String getQuantity() {
        return quantity;
    }

    public void setQuantity(String quantity) {
        this.quantity = quantity;
    }
    
    
    
    
    
}
