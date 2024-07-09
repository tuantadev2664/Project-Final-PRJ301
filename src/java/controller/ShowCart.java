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
import java.util.List;
import model.Cart;
import model.Item;
import model.Item;
import model.Product;

/**
 *
 * @author mb
 */
public class ShowCart extends HttpServlet {
   
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
        HttpSession session = request.getSession();
        DAO dao = new DAO();
        List<Product> listProduct = dao.getAllProductDetails();
        Cookie[] arrCookie = request.getCookies();
        String txt = "";
        String txt1="";
        if (arrCookie != null) {
            for (Cookie c : arrCookie) {
                if (c.getName().equals("Cart")) {
                    txt += c.getValue();
                    c.setMaxAge(0);
                    response.addCookie(c);
                }
            }
        }
       
            String pid="";
            String pcolor="";
            String psize="";
            String quantity="";
        if (request.getParameter("param") != null) {
            String param = request.getParameter("param");
            pid = param.split(";")[0];
            pcolor = param.split(";")[1];
            psize = param.split(";")[2];
            quantity = param.split(";")[3];
        }
        
        if (txt != null && !txt.isEmpty()) {
            String[] arr = txt.split("/");
            for (String item : arr) {
                String[] productArr = item.split(":");
                if (productArr.length == 4) {
                    String id = productArr[0];
                    String color = productArr[1];
                    String size = productArr[2];
                    String quan = productArr[3];
                    
                    String temp = quan;
                    if(id.equals(pid) && color.equals(pcolor) && size.equals(psize)){
                        quan = quantity;
                    }
                    if (Integer.parseInt(quan) > 0 && Integer.parseInt(quan) <= dao.getQuantity(id, color, size)) {
                        if (txt.isEmpty()) {
                            txt1 = id + ":" + color + ":" + size + ":" + quan;
                        } else {
                            txt1 += "/" + id + ":" + color + ":" + size + ":" + quan;
                        }
                    }else if(Integer.parseInt(quan) > dao.getQuantity(id, color, size)){
                        request.setAttribute("error", "Số lượng sản phần đã tối đa");
                        if (txt.isEmpty()) {
                            txt1 = id + ":" + color + ":" + size + ":" + temp;
                        } else {
                            txt1 += "/" + id + ":" + color + ":" + size + ":" + temp;
                        }
                    }
                    
                }
            }
        }
        
        Cookie c = new Cookie("Cart", txt1);
        c.setMaxAge(30 * 24 * 60 * 60);
        response.addCookie(c);
        
        Cart cart = new Cart(txt1, listProduct);
        
        int num = 0;
        int sum = 0;
        for(Item item : cart.getListItem()){
            num = num + item.getQuantity();
            String price =  item.getProduct().getProductPrice().split(",")[0];
            sum = sum + Integer.parseInt(price)*item.getQuantity();
        }
        
        int size = cart.getListItem().size();
        
        session.setAttribute("num", num);
        session.setAttribute("sum", sum);
        session.setAttribute("sizeCart", size);
        System.out.println(size);
        request.setAttribute("Cart", cart);
        request.getRequestDispatcher("viewCart.jsp").forward(request, response);
        
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
