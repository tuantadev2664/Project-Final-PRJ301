/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import com.sun.jdi.connect.spi.Connection;
import context.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
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
        String sql = "select productCode, productName, productStatus, productPrice, productOldPrice, productImagesLarge  from Product order by productCode DESC";
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

    public List<Product> pagingProducts(int index) {
        List<Product> proList = new ArrayList<>();
        String sql = "Select productCode, productName, productStatus, productPrice, productOldPrice, productImagesLarge from Product\n" +
"order by productCode DESC\n" +
"offset ? rows fetch next 12 rows only;";
        try {
            java.sql.Connection connection = new DBContext().getConnect();
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, (index - 1) * 12);
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
"order by productCode\n" +
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
        String sql = "select ProductColor.[ colorId], [ colorLink]\n"
                + "from ProductColor\n"
                + "join Color on ProductColor.[ colorId] = Color.[ colorId]\n"
                + "where productCode = ? order by ProductColor.[ colorId] ASC";
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
//    
//    public List<Product> getAllProductByListProductCode(List<String> listProductCode) {
//        List<Product> list = new ArrayList<>();
//        for (String string1 : listProductCode) {
//            String sql = "select productCode, productName, productStatus, productPrice, productOldPrice, productImages  from Product where productCode = ? order by productCode DESC";
//            try {
//                java.sql.Connection connection = new DBContext().getConnect();
//                PreparedStatement st = connection.prepareStatement(sql);
//                st.setString(1, string1);
//                ResultSet rs = st.executeQuery();
//                if (rs.next()) {
//                    String imagesString = rs.getString(6);
//                    String[] data = imagesString.split(",");
//                    List<String> listImages = new ArrayList<>();
//                    for (String string : data) {
//                        string = string.replaceAll("'", "");
//                        listImages.add(string);
//                    }
//                    if (listImages.size() == 1) {
//                        listImages.add(listImages.get(0));
//                    }
//                    list.add(new Product(rs.getString(1),
//                            rs.getString(2),
//                            rs.getString(3),
//                            rs.getString(4),
//                            rs.getString(5),
//                            listImages));
//                }
//                rs.close();
//                connection.close();
//            } catch (SQLException e) {
//                System.out.println("e");
//            }
//        }
//        return list;
//    }
//    
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

//    
//    public ProductDetail getProductDetailByProductCode(String productCode){
//        
//        String sql = "select * from productDetail where productCode = ? order by [ colorId] ASC";
//        try {
//            java.sql.Connection connection = new DBContext().getConnect();
//            PreparedStatement st = connection.prepareStatement(sql);
//            st.setString(1, productCode);
//            ResultSet rs = st.executeQuery();
//            String temp = "";
//            Map<String, Integer> mapSizeStock = new HashMap<String, Integer>();
//            Map<String, Map<String, Integer>> mapColorSizeStock = new HashMap<String, Map<String, Integer>>();
//            ProductDetail productDetail = null;
//            while(rs.next()){
//                if(!temp.equals(rs.getString(2)) && !"".equals(temp)){
//                    mapSizeStock = new HashMap<String, Integer>();
//                    temp = rs.getString(2);
//                }
//                if(temp.equals(rs.getString(2)) || "".equals(temp)){
//                    mapSizeStock.put(rs.getString(3), rs.getInt(4));
//                    mapColorSizeStock.put(rs.getString(2), mapSizeStock);
//                    temp = rs.getString(2);
//                   
//                }
//                productDetail = new ProductDetail(rs.getString(1), mapColorSizeStock);
//            }
//            
//            rs.close();
//            connection.close();
//            return  productDetail;
//        } catch (SQLException e) {
//            System.out.println("e");
//        }
//        return null;
//    }
//    
    public int getQuantity(String productCode, String colorID, String productSize){
        
        String sql = "select [productStock] from productDetail where productCode = ? and [colorId] = ? and [productSize] = ?";
        try {
            java.sql.Connection connection = new DBContext().getConnect();
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, productCode);
            st.setString(2, colorID);
            st.setString(3,productSize);
            ResultSet rs = st.executeQuery();
            if(rs.next()){
                return Integer.parseInt( rs.getString(1));
            }          
            rs.close();
            connection.close();
        } catch (SQLException e) {
            System.out.println("e");
        }
        return 0;
    }
    
    public String getColorName( String colorID){
        
        String sql = " select colorName from Color where [ colorId] = ?";
        try {
            java.sql.Connection connection = new DBContext().getConnect();
            PreparedStatement st = connection.prepareStatement(sql);
            
            st.setString(1, colorID);
            
            ResultSet rs = st.executeQuery();
            if(rs.next()){
                return rs.getString(1);
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
            String sql = "select  [ imgDetailColor]\n"
                    + "from ProductImgDetail\n"
                    + "where productCode = ? and [ colorId] = ?";
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

    public List<String> handleStringDescription(String imagesString) {
        String[] data = imagesString.split(";");
        List<String> listImages = new ArrayList<>();
        for (String string : data) {
            string = string.replaceAll("'", "");
            listImages.add(string);
        }
        return listImages;
    }

    public int count(String search) {
        String sql = "select count(*) from Product where productName like ?";
        try {
            java.sql.Connection connection = new DBContext().getConnect();
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + search + "%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public List<Product> search(String search, int index) {
        List<Product> productList = new ArrayList<>();
        String sql = "with x as(select ROW_NUMBER() over (order by productImagesLarge desc) as r\n"
                + ",* from Product where productDescription like ? or productName like ?)\n"
                + "select productCode, productName, productStatus, productPrice, productOldPrice, productImagesLarge from x where r between ?*12-11 and ?*12";
        try {
            java.sql.Connection connection = new DBContext().getConnect();
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + search + "%");
            st.setString(2, "%" + search + "%");
            st.setInt(3, index);
            st.setInt(4, index);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
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
                productList.add(new Product(rs.getString(1),
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
        return productList;
    }
    
    public List<Product> searchByName(String search){
        List<Product> productList = new ArrayList<>();
        String sql = "Select productCode, productName, productStatus, productPrice, productOldPrice, productImagesLarge from Product\n" +
"where productName like ?";
        try {
            java.sql.Connection connection = new DBContext().getConnect();
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + search + "%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
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
                productList.add(new Product(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        listImages));
            }
            rs.close();
            connection.close();
        } catch (Exception e) {
        }
        return productList;
    }


    public static void main(String[] args) {
       DAO dao = new DAO();
       int sum = 0;
//        System.out.println(dao.getAllProductByCategory());

//       for(Product product : dao.getASampleProductByProductCode("MBL267")){
//           sum++;
//           System.out.println(product.getProductImages().get(1));
//       }
//        System.out.println(dao.getCategoryIDByProductCode("MBL267"));
//        System.out.println(dao.getProductByProductCode("MBL267"));

       
//        System.out.println(dao.getCategoryIDByProductCode("MBL267"));
        
//        System.out.println(dao.getProductByProductCode("MBL267"));

//       for(Category category : dao.getAllCategory()){
//           sum++;
//           System.out.println(category);
//       }
//        for (Product pro : dao.getAllProduct()) {
//            System.out.println(pro.toString());
//        }
//        System.out.println("------------");
//        List<Product> proList = dao.pagingProducts(1);
//        for (Product product : proList) {
//            System.out.println(product.toString());
//            sum++;
//        }
//        System.out.println("sum = " + sum);
          //System.out.println(dao.getNumberProductByCategory("C01"));
          List<String> list = new ArrayList<>();
          list.add("MBL267");
          list.add("MBL266");
          for(Product product : dao.getAllProductByListProductCode(list)){
              System.out.println(product);
        }
        //System.out.println(dao.getNumberProductByCategory("C01"));
//        System.out.println(dao.getProductByProductCode("MBL267"));
//        System.out.println(dao.getProductByProductCode("MBL267").getProductColorList());
//        for (ProductColor productColor : dao.getProductByProductCode("MBL267").getProductColorList()){
//            System.out.println(productColor.getColorID() + ":  "+ productColor.getColorLinkString());
//        }
       //System.out.println(dao.getProductColor("MBL267"));
//       for(ProductImgDetail productImgDetail : dao.getProductImgDetails("MBL259")){
//           System.out.println(productImgDetail.getColorID());
//           for(String str : productImgDetail.getImgDetailColor()){
//               System.out.println(str);
//           }
//       }

//        List<Category> test = new ArrayList<>();
//        test = dao.getAllCategory();
//        for (Category product : test) {
//            System.out.println(product.toString());
//        }

//        for (Product product : dao.search("Áo", 1)) {
//            System.out.println(product.toString());
//        }
        //System.out.println(dao.getProductDetailByProductCode("MBL267").getColorSizeStock("634.0"));
        System.out.println(dao.getQuantity("MBL267", "635", "S"));
    }

}
