
package controller;

import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.User;


@WebServlet(name = "userCreateServlet", urlPatterns = {"/userCreateServlet"})
public class userCreateServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        User user = new User();
        user.setName(request.getParameter("name"));
        user.setUsername(request.getParameter("username"));
        user.setRole(request.getParameter("role"));
        user.setPassword(request.getParameter("password"));

        UserDAO userDAO = new UserDAO();
        userDAO.CreateUser(user);

        request.setAttribute("message", "User created successfully.");
        RequestDispatcher dispatcher = request.getRequestDispatcher("manager/create_staff.jsp");
        dispatcher.forward(request, response);

    }
}
