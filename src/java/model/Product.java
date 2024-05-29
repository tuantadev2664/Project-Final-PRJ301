/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.List;

/**
 *
 * @author FPTSHOP
 */
public class Product {
    private String productCode;
    private String productName;
    private String productStatus;
    private String productPrice;
    private String productOldPrice;
    private List<String> productImages;

    public Product() {
    }

    public Product(String productCode, String productName, String productStatus, String productPrice, String productOldPrice, List<String> productImages) {
        this.productCode = productCode;
        this.productName = productName;
        this.productStatus = productStatus;
        this.productPrice = productPrice;
        this.productOldPrice = productOldPrice;
        this.productImages = productImages;
    }

    public String getProductCode() {
        return productCode;
    }

    public void setProductCode(String productCode) {
        this.productCode = productCode;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getProductStatus() {
        return productStatus;
    }

    public void setProductStatus(String productStatus) {
        this.productStatus = productStatus;
    }

    public String getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(String productPrice) {
        this.productPrice = productPrice;
    }

    public String getProductOldPrice() {
        return productOldPrice;
    }

    public void setProductOldPrice(String productOldPrice) {
        this.productOldPrice = productOldPrice;
    }

    public List<String> getProductImages() {
        return productImages;
    }

    public void setProductImages(List<String> productImages) {
        this.productImages = productImages;
    }

    @Override
    public String toString() {
        return "Product{" + "productCode=" + productCode + ", productName=" + productName + ", productStatus=" + productStatus + ", productPrice=" + productPrice + ", productOldPrice=" + productOldPrice + ", productImages=" + productImages + '}';
    }
    
    
}
