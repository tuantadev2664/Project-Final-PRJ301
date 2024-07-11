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
import model.Product;

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
                        rs.getInt(7)));
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
                + "           ,[role])\n"
                + "     VALUES(?,?,?,?,?,1)";

        try (Connection con = new DBContext().getConnect()) {
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, a.getUsername());
            st.setString(2, a.getPassword());
            st.setString(3, a.getFullname());
            st.setString(4, a.getEmail());
            st.setString(5, a.getPhone());
            st.execute();
        } catch (Exception e) {
            System.out.println(e);
        }

    }

    //them Account vao database
    public void addAccount(Account a) {
        String sql = "INSERT INTO [dbo].[Account]\n"
                + "           ([username]\n"
                + "           ,[password]\n"
                + "           ,[fullName]\n"
                + "           ,[email]\n"
                + "           ,[phone]\n"
                + "           ,[role])\n"
                + "     VALUES(?,?,?,?,?,?)";

        try (Connection con = new DBContext().getConnect()) {
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, a.getUsername());
            st.setString(2, a.getPassword());
            st.setString(3, a.getFullname());
            st.setString(4, a.getEmail());
            st.setString(5, a.getPhone());
            st.setInt(6, a.getRole());

            st.execute();
        } catch (Exception e) {
            System.out.println(e);
        }

    }
    
     public void addProduct(String productCode,String productName,String productSale,String productStatus,String productPrice,String productOldPrice,String productImage, String categoryID) {
        String sql = "INSERT INTO Product (productCode,productName,productSale,categoryID,productStatus,productPrice,productOldPrice,productImagesLarge) VALUES (?, ?, ?, ?, ?,?,?,?)";

        try (Connection con = new DBContext().getConnect()) {
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, productCode);
            st.setString(2, productName);
            st.setString(3, productSale);
            st.setString(4, categoryID);
            st.setString(5, productStatus);
            st.setString(6, productPrice);
            st.setString(7, productOldPrice);
            st.setString(8, productImage);
            st.execute();
        } catch (Exception e) {
            System.out.println(e);
        }

    }

    public void updateAccount(Account account) {

        PreparedStatement stmt = null;
        Connection conn = new DBContext().getConnect();
        try {

            String query = "UPDATE [dbo].[Account]\n"
                    + "   SET [username] = ?\n"
                    + "      ,[password] = ?\n"
                    + "      ,[fullName] = ?\n"
                    + "      ,[email] = ?\n"
                    + "      ,[phone] = ?\n"
                    + "      ,[role] = ?\n"
                    + " WHERE id=?\n";

            stmt = conn.prepareStatement(query);
            stmt.setString(1, account.getUsername());
            stmt.setString(2, account.getPassword());
            stmt.setString(3, account.getFullname());
            stmt.setString(4, account.getEmail());
            stmt.setString(5, account.getPhone());
            stmt.setInt(6, account.getRole());
            stmt.setInt(7, account.getId());

            stmt.execute();

        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    //tim Account bang id
    public Account getAccountById(int id) {

        try (Connection con = new DBContext().getConnect()) {
            PreparedStatement st = con.prepareStatement("select * from Account where id=? ");
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Account a = new Account(rs.getInt(1),rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getInt(7));
                return a;
            }

        } catch (Exception ex) {
        }
        return null;
    }

    //check account trung bang username
    public Account getAccountByUsername(String username) {

        try (Connection con = new DBContext().getConnect()) {
            PreparedStatement st = con.prepareStatement("select * from Account where username=? ");
            st.setString(1, username);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Account a = new Account(rs.getString(2), rs.getString(3));
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
                Account a = new Account(rs.getString(2), rs.getString(3));
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
                        rs.getInt(7));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    //cap nhat mat khau 
    public void updatePassword(String username, String newPassword) {
        try (Connection connection = new DBContext().getConnect()) {
            String query = "UPDATE [dbo].[Account]\n"
                    + "   SET password = ?"
                    + " WHERE username = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, newPassword);
            preparedStatement.setString(2, username);
            preparedStatement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void insertAddress() {

    }

    public void deleteAccount(int id) {
        String sql = "DELETE FROM Account\n" +
"WHERE id=? CASCADE;;";
        try (Connection con = new DBContext().getConnect()) {
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
     public void deleteProduct(String code) {
        String sql = " DELETE FROM Product WHERE productCode = ?;";
        try (Connection con = new DBContext().getConnect()) {
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, code);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }


    public static void main(String[] args) {
        LoginDAO loginDAO = new LoginDAO();

        //test update
//        Account a1 = new Account(1, "user1", "123", "Nguyen Van H", "user1@example.com", "111111111", 1);
//        loginDAO.updateAccount(a1);

        for (Account account1 : loginDAO.getAllAccount()) {
            System.out.println(account1);
        }
//        loginDAO.addProduct("MBL900", "Áo Hadi", "100%", "Available", "500,000đ", "1,000,000đ", "https://monatabluelight.com/images/products/2024/06/06/large/ma%CC%A3%CC%86t-tru%CC%9Bo%CC%9B%CC%81c1717662717_1717662717.jpg", "C05");
    loginDAO.deleteProduct("MBL500");
    }
}
