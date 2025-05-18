
package controller;

import dao.MessageDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Message;


@WebServlet(name = "ViewStaffMessagesServlet", urlPatterns = {"/ViewStaffMessagesServlet"})
public class ViewStaffMessagesServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        MessageDAO messageDAO = new MessageDAO();
        List<Message> messages = messageDAO.getMessagesToStaff();
        request.setAttribute("messages", messages);
        request.getRequestDispatcher("staff/staff_messages.jsp").forward(request, response);
    }
}
    


