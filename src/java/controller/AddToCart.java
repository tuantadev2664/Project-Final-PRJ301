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
import java.util.List;
import model.Product;

/**
 *
 * @author mb
 */
public class AddToCart extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
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
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        DAO dao = new DAO();
        List<Product> listProduct = dao.getAllProductByCategory();
        Cookie[] arrCookie = request.getCookies();
        String txt = "";

        if (arrCookie != null) {
            for (Cookie c : arrCookie) {
                if (c.getName().equals("Cart")) {
                    txt += c.getValue();
                    c.setMaxAge(0);
                }
            }
        }

        String code = request.getParameter("code");
        String color = request.getParameter("color");
        String size = request.getParameter("size");
        String quan = request.getParameter("quantity");
        color = String.valueOf(Math.abs(Integer.parseInt(color)));
        System.out.println("ab," + color + "," + size + "," + quan);
        if (txt.isEmpty()) {
            txt = code + ":" + color+ ":" + size+ ":" + quan;
        } else {
            txt += "/" + code + ":" + color+ ":" + size+ ":" + quan;
        }
        Cookie c = new Cookie("Cart", txt);
        c.setMaxAge(30 * 24 * 60 * 60);
        response.addCookie(c);
        request.getRequestDispatcher("detail?productCode=" + code).forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
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
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}