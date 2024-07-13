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
import java.util.List;
import model.Category;
import model.Product;
import model.Status;

/**
 *
 * @author FPTSHOP
 */
@WebServlet(name="CategoryServlet", urlPatterns={"/category"})
public class CategoryServlet extends HttpServlet {
   
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
            out.println("<title>Servlet CategoryServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CategoryServlet at " + request.getContextPath () + "</h1>");
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
        String categoryID = request.getParameter("categoryID");
//        String statusName = request.getParameter("statusName");
        
        DAO dao = new DAO();

        int total = dao.getNumberProductByCategory(categoryID);
        int page = total/12;
        if(total % 12 != 0){
            page++;
        }
        String indexPage = request.getParameter("index");
        if(indexPage==null){
            indexPage="1";
        }
        int index = Integer.parseInt(indexPage);
//        List<Product> list = dao.pagingProducts(index);
        List<Product> list = dao.pagingProductByCategory(categoryID, index);
        //List<Product> list = dao.getAllProductByCategoryID(categoryID);
//        List<Product> list2 = dao.getAllProductByStatus(statusName);
//        List<Product> list = null;
//        if(list1.size()>list2.size() || list2.size()==0&&list1.size()!=0){
//            for(Product p1: list1){
//                for(Product p2: list2){
//                    if(p1.getProductCode().equals(p2.getProductCode()))
//                        list2.remove(p2);
//                }
//            }
//            list.addAll(list1);
//            list.addAll(list2);
//            request.setAttribute("listP", list);
//        }
//        if(list2.size()>=list1.size() || list1.size()==0&&list2.size()!=0){
//           for(Product p2: list2){
//                for(Product p1: list1){
//                    if(p2.getProductCode().equals(p1.getProductCode()))
//                        list1.remove(p1);
//                }
//            }
//           list.addAll(list2);
//           list.addAll(list1);
//           request.setAttribute("listP", list);
//        }
//        if(list2.size()==0&&list1.size()!=0)
        
        List<Category> listC = dao.getAllCategory();
        List<Status> listS = dao.getAllStatus();
        
        request.setAttribute("listS", listS);
        request.setAttribute("listC", listC);
        request.setAttribute("listP", list);
        request.setAttribute("endP", page);
        request.setAttribute("tag", categoryID);
        request.setAttribute("tagH", index);
        request.getRequestDispatcher("product.jsp").forward(request, response);
        
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
