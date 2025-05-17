package controller;

import dao.OrderDAO;
import model.Order;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "OrderListServlet", urlPatterns = {"/OrderListServlet"})
public class OrderListServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        OrderDAO dao = new OrderDAO();
        List<Order> orderList = dao.getAllOrders();
        request.setAttribute("orderList", orderList);
        request.getRequestDispatcher("staff/order_list_staff.jsp").forward(request, response);
    }

    // Handle the POST request for updating order status
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String orderIdStr = request.getParameter("orderId");
        String newStatus = request.getParameter("newStatus");

        if (orderIdStr != null && newStatus != null) {
            try {
                int orderId = Integer.parseInt(orderIdStr);
                OrderDAO dao = new OrderDAO();
                boolean updated = dao.updateOrderStatus(orderId, newStatus);

                if (updated) {
                    response.sendRedirect("OrderListServlet");  // Refresh the order list after update
                    return;
                }
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
        }
        // If update fails or invalid data, forward to error page or reload
        request.getRequestDispatcher("staff/order_error.jsp").forward(request, response);
    }
}
