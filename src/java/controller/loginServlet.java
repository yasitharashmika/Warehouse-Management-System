package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.User;
import dao.UserDAO;

@WebServlet(name = "loginServlet", urlPatterns = {"/loginServlet"})
public class loginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        UserDAO userDAO = new UserDAO();
        String role = userDAO.getUserRole(username, password);

        if (role != null) {
            // ✅ Set session attribute
            HttpSession session = request.getSession();
            session.setAttribute("username", username);
            session.setAttribute("role", role);

            if ("manager".equalsIgnoreCase(role)) {
                response.sendRedirect("ManagerDashboardServlet");
            } else if ("staff".equalsIgnoreCase(role)) {
                response.sendRedirect("StaffDashboardServlet");
            } else {
                response.sendRedirect("login.jsp?error=invalid_role");
            }
        } else {
            response.sendRedirect("login.jsp?error=1");
        }
    }
}
