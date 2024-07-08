/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author FPTSHOP
 */
public class ProductColor {
    private String colorID;
    private String colorLinkString;

    public ProductColor() {
    }

    public ProductColor(String colorID, String colorLinkString) {
        this.colorID = colorID;
        this.colorLinkString = colorLinkString;
    }

    public String getColorID() {
        return colorID;
    }

    public void setColorID(String colorID) {
        this.colorID = colorID;
    }

    public String getColorLinkString() {
        return colorLinkString;
    }

    public void setColorLinkString(String colorLinkString) {
        this.colorLinkString = colorLinkString;
    }

    @Override
    public String toString() {
        return "ProductColor{" + "colorID=" + colorID + ", colorLinkString=" + colorLinkString + '}';
    }
    
    
}
