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
public class ProductImgDetail {
    private String colorID;
    private List<String> imgDetailColor;

    public ProductImgDetail() {
    }

    public ProductImgDetail(String colorID, List<String> imgDetailColor) {
        this.colorID = colorID;
        this.imgDetailColor = imgDetailColor;
    }

    public String getColorID() {
        return colorID;
    }

    public void setColorID(String colorID) {
        this.colorID = colorID;
    }

    public List<String> getImgDetailColor() {
        return imgDetailColor;
    }

    public void setImgDetailColor(List<String> imgDetailColor) {
        this.imgDetailColor = imgDetailColor;
    }

    @Override
    public String toString() {
        return "ProductImgDetail{" + "colorID=" + colorID + ", imgDetailColor=" + imgDetailColor + '}';
    }
    
    
    
}
