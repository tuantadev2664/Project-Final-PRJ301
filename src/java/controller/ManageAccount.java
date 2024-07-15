/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.DAO;
import dao.LoginDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import model.Account;
import model.Order;
import model.OrderDetail;
import model.Product;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "ManageAccount", urlPatterns = {"/manageaccount"})
public class ManageAccount extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        LoginDAO dao = new LoginDAO();
        DAO daoo = new DAO();
        List<Account> list = dao.getAllAccount();
        List<Product> proList = new ArrayList<>();
        List<Order> orders = dao.getAllOrders();
        proList = daoo.getAllProduct();
        System.out.println(orders);
        request.setAttribute("allP", proList);
        request.setAttribute("data", list);

//        Map<String, List<OrderDetail>> orderDetailsMap = orders.stream()
//                .collect(Collectors.toMap(
//                        Order::getOrderId,
//                        order -> dao.getOrderDetailsByOrderId(order.getOrderId())
//                ));
        // code cua hung DAO dao = new DAO();--------------------------
        List<String> listNum = new ArrayList<>();
        listNum = daoo.numOfOrderEachMonth();
        Date curenDate = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy");
        String now = dateFormat.format(curenDate);
        HttpSession session = request.getSession();
        System.out.println("mana:"+listNum);
        int[] t = new int[13]; // Initialize the array with size 13

        // Initialize array elements to 0
        for (int i = 1; i < 13; i++) {
            t[i] = 0;
        }
        for (String x : listNum) {
            String[] parts = x.split("-");
            if (parts.length == 3 && parts[2].equals(now)) {
                switch (parts[1]) {
                    case "01":
                        t[1]++;
                        break;
                    case "02":
                        t[2]++;
                        break;
                    case "03":
                        t[3]++;
                        break;
                    case "04":
                        t[4]++;
                        break;
                    case "05":
                        t[5]++;
                        break;
                    case "06":
                        t[6]++;
                        break;
                    case "07":
                        t[7]++;
                        break;
                    case "08":
                        t[8]++;
                        break;
                    case "09":
                        t[9]++;
                        break;
                    case "10":
                        t[10]++;
                        break;
                    case "11":
                        t[11]++;
                        break;
                    case "12":
                        t[12]++;
                        break;
                    default:
                        throw new AssertionError("Unexpected value: " + parts[1]);
                }
            }
        }
//            listNum.add(month + "." + year + "," + count);
//            String[] arr = x.split("\\,");
//            session.setAttribute("t" + arr[0].split("\\.")[0], arr[1]);
//            System.out.println(arr[0].split("\\.")[0]);
        
        for (int i = 1; i < t.length; i++) {
            System.out.println("Monthh " + i + ": " + t[i]);
        }
        session.setAttribute("now", now);
        session.setAttribute("t1", t[1]);
        session.setAttribute("t2", t[2]);
        session.setAttribute("t3", t[3]);
        session.setAttribute("t4", t[4]);
        session.setAttribute("t5", t[5]);
        session.setAttribute("t6", t[6]);
        session.setAttribute("t7", t[7]);
        session.setAttribute("t8", t[8]);
        session.setAttribute("t9", t[9]);
        session.setAttribute("t10", t[10]);
        session.setAttribute("t11", t[11]);
        session.setAttribute("t12", t[12]);
        //---------------------------------------------------------------

        request.setAttribute("orders", orders);
        //request.setAttribute("orderDetailsMap", orderDetailsMap);

        System.out.println(orders);

        request.getRequestDispatcher("adminHome.jsp").forward(request, response);
    
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    
}
