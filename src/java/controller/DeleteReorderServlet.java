
package controller;

import dao.ReorderRequestDAO;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "DeleteReorderServlet", urlPatterns = {"/DeleteReorderServlet"})
public class DeleteReorderServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idStr = request.getParameter("id");
        if (idStr != null) {
            int id = Integer.parseInt(idStr);
            ReorderRequestDAO dao = new ReorderRequestDAO();
            dao.deleteReorderRequestById(id);
        }
        response.sendRedirect("staff/new_stock_list.jsp");
    }
    
}