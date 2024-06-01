/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author DELL
 */
public class Card {

    private String idCard;
    private String aid;
    private String cardNumber;
    private String cardBankName;

    public Card() {
    }

    public Card(String idCard, String aid, String cardNumber, String cardBankName) {
        this.idCard = idCard;
        this.aid = aid;
        this.cardNumber = cardNumber;
        this.cardBankName = cardBankName;
    }

    public String getIdCard() {
        return idCard;
    }

    public void setIdCard(String idCard) {
        this.idCard = idCard;
    }

    public String getAid() {
        return aid;
    }

    public void setAid(String aid) {
        this.aid = aid;
    }

    public String getCardNumber() {
        return cardNumber;
    }

    public void setCardNumber(String cardNumber) {
        this.cardNumber = cardNumber;
    }

    public String getCardBankName() {
        return cardBankName;
    }

    public void setCardBankName(String cardBankName) {
        this.cardBankName = cardBankName;
    }

    @Override
    public String toString() {
        return "Card{" + "idCard=" + idCard + ", aid=" + aid + ", cardNumber=" + cardNumber + ", cardBankName=" + cardBankName + '}';
    }

   

}
