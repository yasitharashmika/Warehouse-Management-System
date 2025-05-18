
package controller;

import dao.ItemDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "AddStockServlet", urlPatterns = {"/AddStockServlet"})
public class AddStockServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int itemId = Integer.parseInt(request.getParameter("itemId"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        ItemDAO itemDAO = new ItemDAO();
        boolean success = itemDAO.updateStock(itemId, quantity);

        if (success) {
            request.setAttribute("message", "Stock updated successfully.");
        } else {
            request.setAttribute("message", "Failed to update stock.");
        }

        request.getRequestDispatcher("staff/add_stock.jsp").forward(request, response);
    }
}

