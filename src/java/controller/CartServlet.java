/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import static controller.ShoppingServlet.listItem;
import dao.DAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Cart;
import model.Item;
import model.Product;

/**
 *
 * @author mb
 */
public class CartServlet extends HttpServlet {

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
        String action = request.getParameter("action");
            DAO dao = new DAO();
            List<Product> listProduct= dao.getAllProduct();
            String id = null;
            Product product = null;
            Item item = new Item();
            
            Cookie[]  arrCookie = request.getCookies();
            String txt = "";
            if(arrCookie != null){
                for(Cookie c : arrCookie){
                    if(c.getName().equals("Cart"))
                        txt+=c.getValue();
                }
            }
            Cart cart = new Cart(txt, listProduct); // doc cart cuar client
            int n; // so luong sp co trong cart
            List<Item> listItem = cart.getListItem();
            if(listItem!= null){
                n=listItem.size();
            }
            else n=0;
            request.setAttribute("size", n);
            request.setAttribute("data", listItem);
            
            
            if (action == null || action.equals("")) {
                request.getRequestDispatcher("product-detail.jsp").forward(request, response);
                System.out.println("null action");
                return;
            }

            switch (action) {
                case "AddItem":
                    id = request.getParameter("code");
                    product = dao.search(id);
                    System.out.println(product);
                    if (product != null) {
                        item.setProduct(product);
                        item.setQuantity(1);
                        //add vao gio hang tung account
                        listItem.add(item);
                    } else {
                        System.out.println("Not Found");
                    }
                    System.out.println("size:" + listItem.size());
                    request.getRequestDispatcher("detail?productCode=" + id).forward(request, response);
                    break;

                case "Remove": // chưa lam
                    id = request.getParameter("index");
                    listItem.remove(Integer.parseInt(id));
                    System.out.println("size:" + listItem.size());
                    request.getRequestDispatcher("viewCart.jsp").forward(request, response);

                    break;
                default:
                    throw new AssertionError();

            }
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
