/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import com.sun.jdi.connect.spi.Connection;
import context.DBContext;
import jakarta.servlet.http.Cookie;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Cart;
import model.Category;
import model.Product;
import model.ProductColor;
import model.ProductImgDetail;
import model.Status;

/**
 *
 * @author FPTSHOP
 */
public class DAO {

    public int getNumberProduct() {
        String sql = "select count(*) from Product;";
        int total;
        try {
            java.sql.Connection connection = new DBContext().getConnect();
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                total = rs.getInt(1);
                return total;
            }
            rs.close();
            connection.close();
        } catch (SQLException e) {
            System.out.println("e");
        }
        return 0;
    }
    
    public int getNumberProductByCategory(String categoryID) {
        String sql = "select count(*) from Product \n" +
                "where categoryID = ?;";
        int total;
        try {
            java.sql.Connection connection = new DBContext().getConnect();
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, categoryID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                total = rs.getInt(1);
                return total;
            }
            rs.close();
            connection.close();
        } catch (SQLException e) {
            System.out.println("e");
        }
        return 0;
    }

    public List<Product> getAllProductByCategory() {
        List<Product> list = new ArrayList<>();
        String sql = "select productCode, productName, productStatus, productPrice, productOldPrice, productImagesDetail  from Product order by productCode DESC";
        try {
            java.sql.Connection connection = new DBContext().getConnect();
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                String imagesString = rs.getString(6);
                String[] data = imagesString.split(",");
                List<String> listImages = new ArrayList<>();
                for (String string : data) {
                    string = string.replaceAll("'", "");
                    listImages.add(string);
                }
                if(listImages.size() == 1){
                    listImages.add(listImages.get(0));
                }
                list.add(new Product(rs.getString(1), 
                        rs.getString(2), 
                       rs.getString(3), 
                       rs.getString(4), 
                     rs.getString(5), 
                      listImages));
                if(listImages.size() == 1){
                    listImages.add(listImages.get(0));
                }
                list.add(new Product(rs.getString(1), 
                        rs.getString(2), 
                       rs.getString(3), 
                       rs.getString(4), 
                     rs.getString(5), 
                      listImages));
            }
            rs.close();
            connection.close();
        } catch (SQLException e) {
            System.out.println("e");
        }
        return list;
    }
    
    public  List<Product> pagingProducts(int index){
        List<Product> proList = new ArrayList<>();
        String sql = "Select productCode, productName, productStatus, productPrice, productOldPrice, productImagesLarge from Product\n" +
"order by productCode DESC\n" +
"offset ? rows fetch next 12 rows only;";
        try {
            java.sql.Connection connection = new DBContext().getConnect();
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, (index-1)*12);
            ResultSet rs = st.executeQuery();
           while (rs.next()) {
                String imagesString = rs.getString(6);
                String[] data = imagesString.split(",");
                List<String> listImages = new ArrayList<>();
                for (String string : data) {
                    string = string.replaceAll("'", "");
                    listImages.add(string);
                }
                //tuan fix chỗ này
                if(listImages.size() == 1){
                    listImages.add(listImages.get(0));
                }
                proList.add(new Product(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        listImages));
            }
            rs.close();
            connection.close();
        } catch (SQLException e) {
            System.out.println("e");
        }
        return proList;
    }
    public List<Product> getASampleProduct() {
        List<Product> list = new ArrayList<>();
        String sql = "select top 8  productCode, productName, productStatus, productPrice, productOldPrice, productImagesLarge  from Product order by productCode DESC";
        try {
            java.sql.Connection connection = new DBContext().getConnect();
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                String imagesString = rs.getString(6);
                String[] data = imagesString.split(",");
                List<String> listImages = new ArrayList<>();
                for (String string : data) {
                    string = string.replaceAll("'", "");
                    listImages.add(string);
                }
                if(listImages.size() == 1){
                    listImages.add(listImages.get(0));
                }
                list.add(new Product(rs.getString(1), 
                        rs.getString(2), 
                       rs.getString(3), 
                       rs.getString(4), 
                     rs.getString(5), 
                      listImages));
            }
            rs.close();
            connection.close();
        } catch (SQLException e) {
            System.out.println("e");
        }
        return list;
    }
    
    public List<Product> getASampleProductByProductCode(String productCode){
        List<Product> list = new ArrayList<>();
        String sql = "select top 8  productCode, productName, productStatus, productPrice, productOldPrice, productImagesLarge  from Product where categoryID = ? order by productCode DESC";
        try {
            java.sql.Connection connection = new DBContext().getConnect();
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, getCategoryIDByProductCode(productCode));
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                String imagesString = rs.getString(6);
                String[] data = imagesString.split(",");
                List<String> listImages = new ArrayList<>();
                for(String string : data){
                    string = string.replaceAll("'", "");
                    listImages.add(string);
                }
                if(listImages.size() == 1){
                    listImages.add(listImages.get(0));
                }
                list.add(new Product(rs.getString(1), 
                        rs.getString(2), 
                       rs.getString(3), 
                       rs.getString(4), 
                     rs.getString(5), 
                      listImages));
            }
            rs.close();
            connection.close();
        } catch (SQLException e) {
            System.out.println("e");
        }
        return list;
    }
    
    public String getCategoryIDByProductCode(String productCode){
        String sql = "select categoryID from Product where productCode = ? ";

        try {
            java.sql.Connection connection = new DBContext().getConnect();
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, productCode);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                return rs.getString(1);
            }
            rs.close();
            connection.close();
        } catch (SQLException e) {
            System.out.println("e");
        }
        return null;
    }
    
   

    public List<Category> getAllCategory() {
        List<Category> list = new ArrayList<>();
        String sql = "select * from Category";
        try {
            java.sql.Connection connection = new DBContext().getConnect();
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Category(rs.getString(1),
                        rs.getString(2)));
            }
            rs.close();
            connection.close();
        } catch (SQLException e) {
            System.out.println("e");
        }
        return list;
    }
    
    public  List<Product> pagingProductByCategory(String categoryID,int index){
        List<Product> proList = new ArrayList<>();
        String sql = "Select productCode, productName, productStatus, productPrice, productOldPrice, productImagesLarge from Product\n" +
"where categoryID = ? \n" +
"order by productCode DESC\n" +
"offset ? rows fetch next 12 rows only;";
        try {
            java.sql.Connection connection = new DBContext().getConnect();
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, categoryID);
            st.setInt(2, (index-1)*12);
            ResultSet rs = st.executeQuery();
           while (rs.next()) {
                String imagesString = rs.getString(6);
                String[] data = imagesString.split(",");
                List<String> listImages = new ArrayList<>();
                for (String string : data) {
                    string = string.replaceAll("'", "");
                    listImages.add(string);
                }
                if(listImages.size() == 1){
                    listImages.add(listImages.get(0));
                }
                proList.add(new Product(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        listImages));
            }
            rs.close();
            connection.close();
        } catch (SQLException e) {
            System.out.println("e");
        }
        return proList;
    }

    public List<Product> getAllProductByCategoryID(String categoryID) {
        List<Product> list = new ArrayList<>();
        String sql = "select productCode, productName, productStatus, productPrice, productOldPrice, productImagesLarge  from Product where categoryID = ? order by productCode DESC";
        try {
            java.sql.Connection connection = new DBContext().getConnect();
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, categoryID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                String imagesString = rs.getString(6);
                String[] data = imagesString.split(",");
                List<String> listImages = new ArrayList<>();
                for (String string : data) {
                    string = string.replaceAll("'", "");
                    listImages.add(string);
                }
                if(listImages.size() == 1){
                    listImages.add(listImages.get(0));
                }
                list.add(new Product(rs.getString(1), 
                        rs.getString(2), 
                       rs.getString(3), 
                       rs.getString(4), 
                     rs.getString(5), 
                      listImages));
            }
            rs.close();
            connection.close();
        } catch (SQLException e) {
            System.out.println("e");
        }
        return list;
    }
    
    public List<ProductColor> getProductColor(String productCode){
        List<ProductColor> list = new ArrayList<>();
        String sql = "select ProductColor.[colorId], [colorLink]\n"
                + "from ProductColor\n"
                + "join Color on ProductColor.[colorId] = Color.[colorId]\n"
                + "where productCode = ? order by ProductColor.[colorId] ASC";
        try {
            java.sql.Connection connection = new DBContext().getConnect();
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, productCode);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
               double db_colorid = Double.parseDouble(rs.getString(1));
               list.add(new ProductColor((""+(int)db_colorid) , rs.getString(2)));
            }
            rs.close();
            connection.close();
        } catch (SQLException e) {
            System.out.println("e");
        }
        return list;
        
    }
    
    public Product getProductByProductCode(String productCode){
        
        String sql = "select productCode, productName, productSale, productStatus, productPrice, productOldPrice, productSize, productDescription, productImagesOrigin, productInfo from product where productCode = ?";
        try {
            java.sql.Connection connection = new DBContext().getConnect();
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, productCode);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                List<String> listDescription = handleStringDescription(rs.getString(8));
                List<ProductColor> listColor = getProductColor(productCode);
                List<String> listImages = handleString(rs.getString(9));
                List<ProductImgDetail> listImgDetails = getProductImgDetails(productCode);
                return new Product(rs.getString(1), 
                        rs.getString(2), 
                       rs.getString(3), 
                       rs.getString(4), 
                     rs.getString(5),
                     rs.getString(6),
                     rs.getString(7),
                        listDescription,
                        listColor,
                      listImages,
                        rs.getString(10),
                        listImgDetails
                );
            }
            rs.close();
            connection.close();
        } catch (SQLException e) {
            System.out.println("e");
        }
        return null;
    }
    
    public List<Product> getAllProductByListProductCode(List<String> listProductCode) {
        List<Product> list = new ArrayList<>();
        for (String string1 : listProductCode) {
            String sql = "select productCode, productName, productStatus, productPrice, productOldPrice, productImagesLarge  from Product where productCode = ? order by productCode DESC";
            try {
                java.sql.Connection connection = new DBContext().getConnect();
                PreparedStatement st = connection.prepareStatement(sql);
                st.setString(1, string1);
                ResultSet rs = st.executeQuery();
                if (rs.next()) {
                    String imagesString = rs.getString(6);
                    String[] data = imagesString.split(",");
                    List<String> listImages = new ArrayList<>();
                    for (String string : data) {
                        string = string.replaceAll("'", "");
                        listImages.add(string);
                    }
                    if (listImages.size() == 1) {
                        listImages.add(listImages.get(0));
                    }
                    list.add(new Product(rs.getString(1),
                            rs.getString(2),
                            rs.getString(3),
                            rs.getString(4),
                            rs.getString(5),
                            listImages));
                }
                rs.close();
                connection.close();
            } catch (SQLException e) {
                System.out.println("e");
            }
        }
        return list;
    }
    
    public List<ProductImgDetail> getProductImgDetails(String productCode){
        List<ProductColor> listColor = getProductColor(productCode);
        List<ProductImgDetail> listImgDetails = new ArrayList<>();
        for(ProductColor productColor : listColor){
            List<String> listImg = new ArrayList<>();
            String sql = "select  [imgDetailColor]\n"
                    + "from ProductImgDetail\n"
                    + "where productCode = ? and [colorId] = ?";
            try {
                java.sql.Connection connection = new DBContext().getConnect();
                PreparedStatement st = connection.prepareStatement(sql);
                st.setString(1, productCode);
                st.setString(2, productColor.getColorID());
                ResultSet rs = st.executeQuery();
                while (rs.next()) {
                    listImg.add(rs.getString(1));
                }
                rs.close();
                connection.close();
            } catch (SQLException e) {
                System.out.println("e");
            }
            listImgDetails.add(new ProductImgDetail(productColor.getColorID(), listImg));
        }
        return listImgDetails;
    }
    
    public List<Status> getAllStatus(){
        List<Status> list = new ArrayList<>();
        String sql = "select * from Status";
        try {
            java.sql.Connection connection = new DBContext().getConnect();
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Status(rs.getString(1),
                        rs.getString(2)));
            }
            rs.close();
            connection.close();
        } catch (SQLException e) {
            System.out.println("e");
        }
        return list;
    }

    public List<Product> getAllProductByStatus(String statusName) {
        List<Product> list = new ArrayList<>();
        String sql = "select productCode, productName, productStatus, productPrice, productOldPrice, productImagesLarge  from Product where productStatus = ? order by productCode DESC";
        try {
            java.sql.Connection connection = new DBContext().getConnect();
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, statusName);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                String imagesString = rs.getString(6);
                String[] data = imagesString.split(",");
                List<String> listImages = new ArrayList<>();
                for (String string : data) {
                    string = string.replaceAll("'", "");
                    listImages.add(string);
                }
                if(listImages.size() == 1){
                    listImages.add(listImages.get(0));
                }
                list.add(new Product(rs.getString(1), 
                        rs.getString(2), 
                       rs.getString(3), 
                       rs.getString(4), 
                     rs.getString(5), 
                      listImages));
            }
            rs.close();
            connection.close();
        } catch (SQLException e) {
            System.out.println("e");
        }
        return list;
    }
    
    public List<String> handleString(String imagesString){
        String[] data = imagesString.split(",");
        List<String> listImages = new ArrayList<>();
        for (String string : data) {
            string = string.replaceAll("'", "");
            listImages.add(string);
        }
       return listImages;
    }
    public List<String> handleStringDescription(String imagesString){
        String[] data = imagesString.split(";");
        List<String> listImages = new ArrayList<>();
        for (String string : data) {
            string = string.replaceAll("'", "");
            listImages.add(string);
        }
       return listImages;
    }
//-------------------------------------------------------------------------------
    public Product searchProduct(String code) {
        ArrayList<Product> list = (ArrayList<Product>) getAllProductByCategory();
        for (Product s : list) {
            if (s.getProductCode().contains(code)) {
                return s;
            }
        }
        return null;
    }

    public Cart readCookieCart(Cookie[] arrCookie) {
        List<Product> listProduct = getAllProductByCategory();
        String txt = "";

        if (arrCookie != null) {
            for (Cookie c : arrCookie) {
                if (c.getName().equals("Cart")) {
                    txt += c.getValue();
                    c.setMaxAge(0);
                }
            }
        }
        Cart cart = new Cart(txt, listProduct);
        return cart;
    }

    public static void main(String[] args) {
       DAO dao = new DAO();
       int sum = 0;
        System.out.println(dao.getProductByProductCode("MBL266"));
//        System.out.println(dao.getProductImgDetails("MBL266"));
    }

}
