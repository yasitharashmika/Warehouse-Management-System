package controller;

import dao.OrderDAO;
import model.Order;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet(name = "CreateOrderServlet", urlPatterns = {"/CreateOrderServlet"})
public class CreateOrderServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String customerName = request.getParameter("customerName");
        int itemId = Integer.parseInt(request.getParameter("itemId"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String shippingAddress = request.getParameter("shippingAddress");
        double itemPrice = Double.parseDouble(request.getParameter("itemPrice"));

        Order order = new Order();
        order.setCustomerName(customerName);
        order.setItemId(itemId);
        order.setQuantity(quantity);
        order.setShippingAddress(shippingAddress);
        order.setItemPrice(itemPrice);
        order.setStatus("Waiting Payment");  // Default status when order placed

        OrderDAO dao = new OrderDAO();
        boolean placed = dao.placeOrder(order);

        if (placed) {
            response.sendRedirect("staff/order_success.jsp");
        } else {
            response.sendRedirect("staff/order_error.jsp");
        }
    }
}