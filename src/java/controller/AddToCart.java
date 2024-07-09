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
//        List<Product> listProduct = dao.getAllProductDetails();
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

        String productCode = request.getParameter("code");
        String productColor = request.getParameter("color");
        String productSize = request.getParameter("size").trim();
        String productQuantity = request.getParameter("quantity");

        HttpSession session = request.getSession();
        if ("0".equals(productSize)) {
            session.setAttribute("error", "Bạn vui lòng chọn size");
            response.sendRedirect("detail?productCode=" + productCode);
        } else {
            if (dao.getQuantity(productCode, productColor, productSize) == 0) {
                session.setAttribute("error", "Màu: " + dao.getColorName(productColor) + " Size: " + productSize + " Đã Soldout. Quý khách vui lòng chọn sản phẩm khác!");
                response.sendRedirect("detail?productCode=" + productCode);
            } else {
                if (Integer.parseInt(productQuantity) > dao.getQuantity(productCode, productColor, productSize)) {
                    session.setAttribute("error", "Bạn vui lòng nhập số lương muốn mua nhỏ hơn hoặc bằng: " + dao.getQuantity(productCode, productColor, productSize));
                    response.sendRedirect("detail?productCode=" + productCode);
                } else {
                    session.setAttribute("error", "bạn đã thêm vào giỏ hàng thành công");
//                    System.out.println(productQuantity);
                    if (productSize.equals("0")) {
                        productSize = "2";
                    }
                    productColor = String.valueOf(Math.abs(Integer.parseInt(productColor)));
                    System.out.println("ab," + productColor + "," + productSize + "," + productQuantity);
                    if (txt.isEmpty()) {
                        txt = productCode + ":" + productColor + ":" + productSize + ":" + productQuantity;
                    } else {
                        txt += "/" + productCode + ":" + productColor + ":" + productSize + ":" + productQuantity;
                    }
                    Cookie c = new Cookie("Cart", txt);
                    c.setMaxAge(30 * 24 * 60 * 60);
                    response.addCookie(c);
                    request.getRequestDispatcher("detail?productCode=" + productCode).forward(request, response);
                }
            }
        }

//        
//        String code = request.getParameter("code");
//        String color = request.getParameter("color");
//        String size = request.getParameter("selectedSize").trim();
//        String quan = request.getParameter("hiddenQuantity");
//        
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
