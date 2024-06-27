/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import java.sql.Connection;
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

    //list cac account cho admin
    public List<Account> getAllAccount() {
        List<Account> list = new ArrayList<>();
        String sql = "select * from Account";

        try (Connection con = new DBContext().getConnect()) {
            PreparedStatement st = con.prepareStatement(sql);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                list.add(new Account(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getDate(8),
                        rs.getInt(9)));
            }

            rs.close();
            con.close();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    //list cac address cua mot id account
    public List<Address> getUserAddress(int idAccount) {
        List<Address> list = new ArrayList<>();
        String sql = "select * from Address where accountId = ?";

        try (Connection con = new DBContext().getConnect()) {
            PreparedStatement st = con.prepareStatement(sql);

            st.setInt(1, idAccount);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Address(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getInt(8)));
            }
            rs.close();
            con.close();
        } catch (SQLException e) {
            System.out.println("e");
        }
        return list;
    }

    //them Account vao database
    public void insertAccount(Account a) {
        String sql = "INSERT INTO [dbo].[Account]\n"
                + "           ([username]\n"
                + "           ,[password]\n"
                + "           ,[fullName]\n"
                + "           ,[email]\n"
                + "           ,[phone]\n"
                + "           ,[gender]\n"
                + "           ,[birthday]\n"
                + "           ,[role])\n"
                + "     VALUES(?,?,?,?,null,null,null,3)";

        try (Connection con = new DBContext().getConnect()) {
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, a.getUsername());
            st.setString(2, a.getPassword());
            st.setString(3, a.getFullname());
            st.setString(4, a.getEmail());
            st.execute();
        } catch (Exception e) {
            System.out.println(e);
        }

    }

    //check account trung bang username
    public Account getAccountByUsername(String username) {

        try (Connection con = new DBContext().getConnect()) {
            PreparedStatement st = con.prepareStatement("select * from Account where username=? ");
            st.setString(1, username);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Account a = new Account(rs.getString(2), rs.getString(5));
                return a;
            }

        } catch (Exception ex) {
        }
        return null;
    }

    //check Account trung bang email
    public Account getAccountByEmail(String email) {

        try (Connection con = new DBContext().getConnect()) {
            PreparedStatement st = con.prepareStatement("select * from Account where email=? ");
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Account a = new Account(rs.getString(2), rs.getString(5));
                return a;
            }

        } catch (Exception ex) {
        }
        return null;
    }

    //check username, password tra ve mot account
    public Account check(String user, String pass) {
        String sql = "select * from Account where username =? and password =?";
        try (java.sql.Connection con = new DBContext().getConnect()) {

            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, user);
            st.setString(2, pass);

            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return new Account(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getDate(8),
                        rs.getInt(9));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public void insertAddress(){
        
    }
    public static void main(String[] args) {
        LoginDAO loginDAO = new LoginDAO();
        Account a = new Account(0, "vanA", "123", "nguyen van a", "vana@gmail.com", null, null, null, 3);
        Account account = new Account("vanA", "123", "nguyen van a", "vana@gmail.com");
        loginDAO.insertAccount(account);
        
        for (Account account1 : loginDAO.getAllAccount()) {
            System.out.println(account1);
        }
        

    }
}
