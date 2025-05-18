package controller;

import dao.DashboardDAO;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import model.Order;  // Make sure this is your Order model package

@WebServlet(name = "StaffDashboardServlet", urlPatterns = {"/StaffDashboardServlet"})
public class StaffDashboardServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        DashboardDAO dashboardDAO = new DashboardDAO();

        int pendingCount = dashboardDAO.getPendingOrdersCount();
        int lowStockCount = dashboardDAO.getLowStockItemCount();
        List<Order> waitingPaymentOrders = dashboardDAO.getWaitingPaymentOrders();  // NEW: fetch waiting payment orders

        request.setAttribute("pendingCount", pendingCount);
        request.setAttribute("lowStockCount", lowStockCount);
        request.setAttribute("waitingPaymentOrders", waitingPaymentOrders);  // NEW: pass list to JSP

        request.getRequestDispatcher("staff/dashboard_staff.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
