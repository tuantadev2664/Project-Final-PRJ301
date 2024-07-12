/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package context;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author FPTSHOP
 */
public class DBContext {
    
        public static String DRIVERNAME="com.microsoft.sqlserver.jdbc.SQLServerDriver";
    public static String DBURL="jdbc:sqlserver://localhost:1433;databaseName=Project_Final_PRJ301_4;encrypt=false;trustServerCertificate=false;loginTimeout=30";
    public static String USERDB="sa";
    public static String PASSDB="123";
    
    public Connection getConnect(){
        try{ 
            Class.forName(DRIVERNAME);
	} catch(ClassNotFoundException e) {
            System.out.println("Error loading driver" + e);
	}
        try{
            
            Connection con = DriverManager.getConnection(DBURL,USERDB,PASSDB);
            return con;
        }
        catch(SQLException e) {
            System.out.println("Error: " + e);
        }
        return null;
    }
    
    public static void main(String[] args) {
        try {
            System.out.println(new DBContext().getConnect());
        } catch (Exception e) {
        }
    }
}
