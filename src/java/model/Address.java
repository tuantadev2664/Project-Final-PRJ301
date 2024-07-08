/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author DELL
 */
public class Address {
    private int idAddress;
    private String country;
    private String province;
    private String district;
    private String ward;
    private String street;
    private String houseNumber;
    private int accountID;

    public Address(int idAddress, String country, String province, String district, String ward, String street, String houseNumber, int accountID) {
        this.idAddress = idAddress;
        this.country = country;
        this.province = province;
        this.district = district;
        this.ward = ward;
        this.street = street;
        this.houseNumber = houseNumber;
        this.accountID = accountID;
    }

    public Address() {
    }

    public int getIdAddress() {
        return idAddress;
    }

    public void setIdAddress(int idAddress) {
        this.idAddress = idAddress;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
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

    public String getStreet() {
        return street;
    }

    public void setStreet(String street) {
        this.street = street;
    }

    public String getHouseNumber() {
        return houseNumber;
    }

    public void setHouseNumber(String houseNumber) {
        this.houseNumber = houseNumber;
    }

    public int getAccountID() {
        return accountID;
    }

    public void setAccountID(int accountID) {
        this.accountID = accountID;
    }

    @Override
    public String toString() {
        return "Address{" + "idAddress=" + idAddress + ", country=" + country + ", province=" + province + ", district=" + district + ", ward=" + ward + ", street=" + street + ", houseNumber=" + houseNumber + ", accountID=" + accountID + '}';
    }

   

    
    

    
    
    
}
