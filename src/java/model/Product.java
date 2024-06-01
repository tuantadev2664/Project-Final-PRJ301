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
    private String productSale;
    private String productStatus;
    private String productPrice;
    private String productOldPrice;
    private String productSize;
    private List<String> productDescription;
    private List<String> productColor;
    private List<String> productImagesDetail;
    private List<String> productImages;
    private String productInfo;

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

    public Product(String productCode, String productName, String productSale, String productStatus, String productPrice, String productOldPrice, String productSize, List<String> productDescription, List<String> productColor, List<String> productImagesDetail, String productInfo) {
        this.productCode = productCode;//1
        this.productName = productName;//2
        this.productSale = productSale;//3
        this.productStatus = productStatus;//4
        this.productPrice = productPrice;//5
        this.productOldPrice = productOldPrice;//6
        this.productSize = productSize;//7
        this.productDescription = productDescription;//8
        this.productColor = productColor;//9
        this.productImagesDetail = productImagesDetail;//10
        this.productInfo = productInfo;//11
    }

    public String getProductSale() {
        return productSale;
    }

    public void setProductSale(String productSale) {
        this.productSale = productSale;
    }

    public String getProductSize() {
        return productSize;
    }

    public void setProductSize(String productSize) {
        this.productSize = productSize;
    }

    public List<String> getProductDescription() {
        return productDescription;
    }

    public void setProductDescription(List<String> productDescription) {
        this.productDescription = productDescription;
    }

    public List<String> getProductColor() {
        return productColor;
    }

    public void setProductColor(List<String> productColor) {
        this.productColor = productColor;
    }

    public List<String> getProductImagesDetail() {
        return productImagesDetail;
    }

    public void setProductImagesDetail(List<String> productImagesDetail) {
        this.productImagesDetail = productImagesDetail;
    }

    public String getProductInfo() {
        return productInfo;
    }

    public void setProductInfo(String productInfo) {
        this.productInfo = productInfo;
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

//    public String toString() {
//        return "Product{" + "productCode=" + productCode + ", productName=" + productName + ", productStatus=" + productStatus + ", productPrice=" + productPrice + ", productOldPrice=" + productOldPrice + ", productImages=" + productImages + '}';
//    }

    @Override
    public String toString() {
        return "Product{" + "productCode=" + productCode + ", productName=" + productName + ", productSale=" + productSale + ", productStatus=" + productStatus + ", productPrice=" + productPrice + ", productOldPrice=" + productOldPrice + ", productSize=" + productSize + ", productDescription=" + productDescription + ", productColor=" + productColor + ", productImagesDetail=" + productImagesDetail + ", productImages=" + productImages + ", productInfo=" + productInfo + '}';
    }
    
    
}
