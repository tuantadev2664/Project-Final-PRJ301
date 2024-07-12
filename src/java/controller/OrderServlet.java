/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dao.DAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import model.Account;
import model.Cart;
import model.Item;

/**
 *
 * @author HadiNe
 */
public class OrderServlet extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Order</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Order at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        DAO dao = new DAO();
        HttpSession session = request.getSession();
        String orderId = dao.createOrderId();
        Account acc = (Account) session.getAttribute("account");
        String accId = String.valueOf(acc.getId());
        String senderName = request.getParameter("sender_name");
        String senderEmail = request.getParameter("sender_email");
        String senderTelephone = request.getParameter("sender_telephone");
        String cityId = request.getParameter("city");
        String districtId = request.getParameter("district_id");
        String wardId = request.getParameter("ward_id");
        String senderAddress = request.getParameter("sender_address");
        String senderComments = request.getParameter("sender_comments");
        String paymentType = request.getParameter("ord_payment_type");
        
        Cart cart = (Cart)session.getAttribute("Cart");
        String num = (String)session.getAttribute("num");
        String sum = (String)session.getAttribute("sum");
        Date curenDate= new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
       String now = dateFormat.format(curenDate);
        // You can now use these values to process the order
        System.out.println("Sender Name: " + senderName);
        System.out.println("Sender Email: " + senderEmail);
        System.out.println("Sender Telephone: " + senderTelephone);
        System.out.println("City ID: " + cityId);
        System.out.println("District ID: " + districtId);
        System.out.println("Ward ID: " + wardId);
        System.out.println("Sender Address: " + senderAddress);
        System.out.println("Sender Comments: " + senderComments);
        System.out.println("Payment Type: " + paymentType);
        System.out.println(cart);
        System.out.println(num);
        System.out.println(sum);
        System.out.println(now);
        System.out.println(session.getAttribute("account"));
        dao.insertOrder(orderId, accId, now, senderName, senderTelephone, senderEmail, cityId, districtId, wardId, senderAddress, num, sum);
    
        //insert to order detail
        List<Item> listItem = new ArrayList<>();
        listItem= cart.getListItem();
        for(Item i : listItem ){
            dao.insertOrderDetail(orderId, i.getProduct().getProductCode(), i.getProduct().getProductColor(), i.getProduct().getProductSize(), String.valueOf(i.getQuantity()));
        }
        Cookie[] arrCookie = request.getCookies();
        if (arrCookie != null) {
            for (Cookie c : arrCookie) {
                if (c.getName().equals("Cart")) {
                    c.setMaxAge(0);                    response.addCookie(c);

                }
            }
        }
        response.sendRedirect("listsample");
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    }
