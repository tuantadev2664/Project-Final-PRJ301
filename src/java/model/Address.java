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
    private String idAddress;
    private String aid;
    private String country;
    private String province;
    private String district;
    private String street;
    private String houseNumber;

    public Address(String idAddress, String aid, String country, String province, String district, String street, String houseNumber) {
        this.idAddress = idAddress;
        this.aid = aid;
        this.country = country;
        this.province = province;
        this.district = district;
        this.street = street;
        this.houseNumber = houseNumber;
    }

    public Address() {
    }

    public String getIdAddress() {
        return idAddress;
    }

    public void setId(String id) {
        this.idAddress = id;
    }

    public String getAid() {
        return aid;
    }

    public void setAid(String aid) {
        this.aid = aid;
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

    @Override
    public String toString() {
        return "Address{" + "id=" + idAddress + ", aid=" + aid + ", country=" + country + ", province=" + province + ", district=" + district + ", street=" + street + ", houseNumber=" + houseNumber + '}';
    }

    

    
    
    
}
