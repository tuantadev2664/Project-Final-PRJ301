
package controller;

import dao.LoginDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import model.Account;


@WebServlet(name = "ManageAccountUpdate", urlPatterns = {"/manageaccountupdate"})
public class ManageAccountUpdate extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id_raw = request.getParameter("id");
        int id = 0;
        LoginDAO dao = new LoginDAO();
        try{
            id = Integer.parseInt(id_raw);
            Account acc = dao.getAccountById(id);
            request.setAttribute("acc", acc);
            request.getRequestDispatcher("adminAccountUpdate.jsp").forward(request, response);
        }catch(NumberFormatException e){
            System.out.println(e);
            
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idString = request.getParameter("id");
        int id = Integer.parseInt(idString);
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String fullname = request.getParameter("fullname");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        int role = Integer.parseInt(request.getParameter("role"));

        // Tạo đối tượng Account mới với dữ liệu được cập nhật
        Account updatedAccount = new Account(id, username, password, fullname, email, phone, role);

        LoginDAO dao = new LoginDAO();
        dao.updateAccount(updatedAccount);
        response.sendRedirect("manageaccount");
       
    }

}
