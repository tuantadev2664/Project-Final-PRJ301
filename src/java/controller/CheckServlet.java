/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dao.DAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author FPTSHOP
 */
@WebServlet(name="CheckServlet", urlPatterns={"/check"})
public class CheckServlet extends HttpServlet {
   
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
            out.println("<title>Servlet CheckServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CheckServlet at " + request.getContextPath () + "</h1>");
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
       String productCode = request.getParameter("code");
       String productColor = request.getParameter("color");
       String productSize = request.getParameter("size").trim();
       String productQuantity = request.getParameter("quantity");
       
       HttpSession session = request.getSession();
       DAO dao = new DAO();
       if("0".equals(productSize)){
           session.setAttribute("error", "Bạn vui lòng chọn size");
           
        } else {
           if (dao.getQuantity(productCode, productColor, productSize) == 0) {
               session.setAttribute("error", "Màu: " + dao.getColorName(productColor) +" Size: " + productSize + " Đã Soldout. Quý khách vui lòng chọn sản phẩm khác!");
//               response.sendRedirect("detail?productCode=" + productCode);
           }else{
               if (Integer.parseInt(productQuantity) > dao.getQuantity(productCode, productColor, productSize)) {
               session.setAttribute("error", "Bạn vui lòng nhập số lương muốn mua nhỏ hơn hoặc bằng: " + dao.getQuantity(productCode, productColor, productSize));
//               response.sendRedirect("detail?productCode=" + productCode);
               }
           }
        }
       response.sendRedirect("detail?productCode="+ productCode);
//       
//       response.setContentType("text/html;charset=UTF-8");
//        try (PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet CheckServlet</title>");  
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet CheckServlet at " + Integer.parseInt(productQuantity) + "    " + productCode + " " + productColor + productSize  + "</h1>");
//            out.println("<h1>Servlet CheckServlet at " + Integer.parseInt(productQuantity) + "    " + dao.getQuantity(productCode, productColor, productSize) + "</h1>");
//            out.println("<h1>Servlet CheckServlet at " + (Integer.parseInt(productQuantity) > dao.getQuantity(productCode, productColor, productSize)) + "</h1>");
//            out.println("</body>");
//            out.println("</html>");
//        }   
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
