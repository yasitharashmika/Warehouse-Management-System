package controller;

import dao.OrderDAO;
import dao.ItemDAO; // ✅ Add this import
import model.Item; // ✅ Add this import to use Item list
import Utill.dbConnect;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List; // ✅ For List
import java.util.Map; // ✅ For Daily Income Chart
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ManagerDashboardServlet", urlPatterns = {"/ManagerDashboardServlet"})
public class ManagerDashboardServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        OrderDAO orderDAO = new OrderDAO();
        ItemDAO itemDAO = new ItemDAO(); //

        double totalRevenue = 0;
        int totalOrders = 0;
        double todaysIncome = 0;
        int lowStockCount = 0; // ✅ For stock alert
        List<Item> lowStockItems = null; // ✅ List of critical items
        Map<String, Double> dailyIncomeMap = null; // ✅ For bar chart

        try {
            totalRevenue = orderDAO.getTotalRevenueOfShippedOrders();
            totalOrders = orderDAO.getTotalOrders();
            todaysIncome = orderDAO.getTodaysIncome();
            lowStockCount = itemDAO.getLowStockItemCount(); //
            lowStockItems = itemDAO.getLowStockItems(); // ✅ Get list of low stock items
            dailyIncomeMap = orderDAO.getDailyIncomeLast7Days(); // ✅ Chart data
        } catch (SQLException e) {
            e.printStackTrace();
        }

        request.setAttribute("totalRevenue", totalRevenue);
        request.setAttribute("totalOrders", totalOrders);
        request.setAttribute("todaysIncome", todaysIncome);
        request.setAttribute("lowStockCount", lowStockCount); // t
        request.setAttribute("lowStockItems", lowStockItems); // ✅ Send list to JSP
        request.setAttribute("dailyIncomeMap", dailyIncomeMap); // ✅ Send chart data

        RequestDispatcher dispatcher = request.getRequestDispatcher("manager/dashboard_manager.jsp");
        dispatcher.forward(request, response);
    }
}
