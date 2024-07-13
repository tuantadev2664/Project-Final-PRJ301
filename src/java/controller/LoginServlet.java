/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.DAO;
import dao.LoginDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.jsp.PageContext;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import model.Account;
import model.Address;
import model.Product;

/**
 *
 * @author DELL
 */
@WebServlet(name = "Login", urlPatterns = {"/login"})
public class LoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Cookie[] cookies = request.getCookies();
        LoginDAO loginDAO = new LoginDAO();
        HttpSession session = request.getSession();
//
//        if (cookies != null) {
//            for (Cookie cookie : cookies) {
//                
//            }
//        }

        try {
            Account a = (Account) session.getAttribute("account");
            if (a != null) {
                request.setAttribute("listAddress", loginDAO.getUserAddress(a.getId()));
                request.getRequestDispatcher("account.jsp").forward(request, response);
            } else {
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        } catch (Exception e) {
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
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        DAO dao = new DAO();
        List<Product> list = dao.getASampleProduct();
        request.setAttribute("listP", list);

        try {
            String user = request.getParameter("username");
            String pass = request.getParameter("password");
            String rememberMe = request.getParameter("rememberMe");

            LoginDAO loginDAO = new LoginDAO();
            Account a = loginDAO.check(user, pass);
            if (a != null) {
                HttpSession session = request.getSession(true);
                session.setAttribute("account", a);
                request.setAttribute("listAddress", loginDAO.getUserAddress(a.getId()));

                if ("yes".equals(rememberMe)) {
                    Cookie cookie = new Cookie("username", user);
                    cookie.setMaxAge(60 * 60 * 24 * 7); // 7 days
                    response.addCookie(cookie);
                }

                request.getRequestDispatcher("home.jsp").forward(request, response);
            } else {
                request.setAttribute("notification", "Tai khoan khong ton tai hoac sai mat khau");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }

        } catch (Exception e) {
            out.println(e);
        }
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
