/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Account;
import model.Address;
import model.Card;

/**
 *
 * @author DELL
 */
public class LoginDAO {

    public List<Account> getAllAccount() {
        List<Account> list = new ArrayList<>();
        String sql = "select * from Accounts";
        try {
            java.sql.Connection connection = new DBContext().getConnect();
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Account(
                        rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getDate(8)));
            }
            rs.close();
            connection.close();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Address> getUserAddress(String idAccount) {
        List<Address> list = new ArrayList<>();
        String sql = "select id, account_id, country, province, district, street, home_number from Addresses where account_id = ?";
        try {
            java.sql.Connection connection = new DBContext().getConnect();
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, idAccount);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Address(rs.getString(1),
                        idAccount,
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7)));
            }
            rs.close();
            connection.close();
        } catch (SQLException e) {
            System.out.println("e");
        }
        return list;
    }
    
    
    public List<Card> getUserCards(String idCard) {
        List<Card> list = new ArrayList<>();
        String sql = "select id, account_id, card_number, bank_name from Cards where account_id = ?";
        try {
            java.sql.Connection connection = new DBContext().getConnect();
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, idCard);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Card(
                        rs.getString(1), 
                        idCard, 
                        rs.getString(3), 
                        rs.getString(4)));
            }
            rs.close();
            connection.close();
        } catch (SQLException e) {
            System.out.println("e");
        }
        return list;
    }

    public static void main(String[] args) {
        LoginDAO loginDAO = new LoginDAO();
        for (Account account : loginDAO.getAllAccount()) {
            System.out.println(account.toString());
        }
        for (Address userAddres : loginDAO.getUserAddress("2")) {
            System.out.println(userAddres.toString());
        }
        for (Card userCard : loginDAO.getUserCards("3")) {
            System.out.println(userCard.toString());
        }
    }
}
