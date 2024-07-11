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
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import model.Account;
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
        proList = daoo.getAllProduct();
        System.out.println(list);
        request.setAttribute("allP", proList);
        request.setAttribute("data", list);
        request.getRequestDispatcher("adminHome.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

}
