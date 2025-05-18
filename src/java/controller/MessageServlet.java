
package controller;

import dao.MessageDAO;
import model.Message;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import javax.servlet.annotation.WebServlet;

@WebServlet(name = "MessageServlet", urlPatterns = {"/MessageServlet"})
public class MessageServlet extends HttpServlet {

   @Override
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("username") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String sender = (String) session.getAttribute("username");
        String recipient = request.getParameter("recipient");
        String subject = request.getParameter("subject");
        String message = request.getParameter("message");

        Message msg = new Message();
        msg.setSender(sender);
        msg.setRecipient(recipient);
        msg.setSubject(subject);
        msg.setMessage(message);

        MessageDAO.sendMessage(msg);

        response.sendRedirect("sendMessage.jsp");
    }
}