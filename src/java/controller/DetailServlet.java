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
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
import model.Product;

/**
 *
 * @author FPTSHOP
 */
@WebServlet(name="DetailServlet", urlPatterns={"/detail"})
public class DetailServlet extends HttpServlet {
   
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
            out.println("<title>Servlet DetailServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DetailServlet at " + request.getContextPath () + "</h1>");
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
        String productCode = request.getParameter("productCode");
        List<String> listA;
        HttpSession session = request.getSession();
        if(session.getAttribute("productCodes") == null){
            listA = new ArrayList<>();
        } else {
            listA = (List<String>)session.getAttribute("productCodes");
            
            for (int i = 0; i < (listA.size() - 1) / 2; i++) {
                String temp = listA.get(i);
                listA.set(i, listA.get(listA.size() - 1 - i));
                listA.set(listA.size() - 1 - i, temp);
            }
            for (int i = 0; i < listA.size(); i++) {
                if (listA.get(i).equals(productCode)) {
                    for (int j = i; j < listA.size() - 1; j++) {
                        listA.set(j, listA.get(j + 1));
                    }
                    listA.remove(listA.size() - 1);  // Xóa phần tử cuối cùng
                    i--;  // Giảm giá trị của biến i để kiểm tra lại phần tử mới tại vị trí i
                }
            }
        }
        
        listA.add(productCode);
        //listA = listA.stream().distinct().collect(Collectors.toList());
        session.setAttribute("productCodes", listA);
        for(int i = 0; i < (listA.size() - 1)/2; i++){
            String temp = listA.get(i);
            listA.set(i, listA.get(listA.size() - 1 - i));
            listA.set(listA.size() - 1 - i, temp);
        }
        List<Product> listP2 = dao.getAllProductByListProductCode(listA);

        
        Product product = dao.getProductByProductCode(productCode);
        List<Product> listP1 = dao.getASampleProductByProductCode(productCode);
        
        request.setAttribute("listP", product);
        request.setAttribute("listP1", listP1);
        request.setAttribute("listP2", listP2);
        request.getRequestDispatcher("detail.jsp").forward(request, response);
        //request.getRequestDispatcher("newjsp.jsp").forward(request, response);
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
