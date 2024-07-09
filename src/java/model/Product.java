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
    private String productColor;
    private String productColorID;
    private String productImg;
    private String colorLink;
    private List<String> productDescription;
    private List<ProductColor> productColorList;
    private List<String> productImagesOrigin;
    private List<String> productImagesLarge;
    private String productInfo;
    private List<ProductImgDetail> productImgDetails;

    public Product() {
    }
    
    public Product(String productCode, String productName, String productColor, String productColorID ,String productSize, String productPrice, String productImg, String colorLink) {
        this.productCode = productCode;
        this.productName = productName;
        this.productColorID = productColorID;
        this.productColor = productColor;
        this.productSize = productSize;
        this.productPrice = productPrice;
        this.productImg = productImg;
        this.colorLink = colorLink;

    }
    
    public Product(String productCode, String productName, String productColor, String productSize, String productPrice, String productImg, String colorLink) {
        this.productCode = productCode;
        this.productName = productName;
        this.productColor = productColor;
        this.productSize = productSize;
        this.productPrice = productPrice;
        this.productImg = productImg;
        this.colorLink = colorLink;

    }

    
    public Product(String productCode, String productName, String productStatus, String productPrice, String productOldPrice, List<String> productImagesLarge) {
        this.productCode = productCode;
        this.productName = productName;
        this.productStatus = productStatus;
        this.productPrice = productPrice;
        this.productOldPrice = productOldPrice;
        this.productImagesLarge = productImagesLarge;
    }


    public Product(String productCode, String productName, String productSale, String productStatus, String productPrice, String productOldPrice, String productSize, List<String> productDescription,List<ProductColor> productColorList , List<String> productImagesOrigin, String productInfo, List<ProductImgDetail> productImgDetails) {
        this.productCode = productCode;//1
        this.productName = productName;//2
        this.productSale = productSale;//3
        this.productStatus = productStatus;//4
        this.productPrice = productPrice;//5
        this.productOldPrice = productOldPrice;//6
        this.productSize = productSize;//7
        this.productDescription = productDescription;//8
        this.productColorList = productColorList;//9
        this.productImagesOrigin = productImagesOrigin;//10
        this.productInfo = productInfo;//11
        this.productImgDetails = productImgDetails;
        
    }

    public String getProductColorID() {
        return productColorID;
    }

    public void setProductColorID(String productColorID) {
        this.productColorID = productColorID;
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

    public List<ProductColor> getProductColorList() {
        return productColorList;
    }

    public void setProductColorList(List<ProductColor> productColor) {
        this.productColorList = productColor;
    }

    public List<String> getProductImagesOrigin() {
        return productImagesOrigin;
    }

    public void setProductImagesOrigin(List<String> productImagesOrigin) {
        this.productImagesOrigin = productImagesOrigin;
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

    public List<String> getProductImagesLarge() {
        return productImagesLarge;
    }

    public void setProductImagesLarge(List<String> productImages) {
        this.productImagesLarge = productImages;
    }

    public List<ProductImgDetail> getProductImgDetails() {
        return productImgDetails;
    }

    public void setProductImgDetails(List<ProductImgDetail> productImgDetails) {
        this.productImgDetails = productImgDetails;
    }

    public String getProductColor() {
        return productColor;
    }

    public void setProductColor(String productColor) {
        this.productColor = productColor;
    }

    public String getProductImg() {
        return productImg;
    }

    public void setProductImg(String productImg) {
        this.productImg = productImg;
    }

    public String getColorLink() {
        return colorLink;
    }

    public void setColorLink(String colorLink) {
        this.colorLink = colorLink;
    }
    
    

//    public String toString() {
//        return "Product{" + "productCode=" + productCode + ", productName=" + productName + ", productStatus=" + productStatus + ", productPrice=" + productPrice + ", productOldPrice=" + productOldPrice + ", productImages=" + productImages + '}';
//    }

    @Override
    public String toString() {
        return "Product{" + "productCode=" + productCode + ", productName=" + productName + ", productSale=" + productSale + ", productStatus=" + productStatus + ", productPrice=" + productPrice + ", productOldPrice=" + productOldPrice + ", productSize=" + productSize + ", productDescription=" + productDescription + ", productColor=" + productColorList + ", productImagesOrigin=" + productImagesOrigin + ", productImages=" + productImagesLarge + ", productInfo=" + productInfo + '}';
    }
    
    
}
