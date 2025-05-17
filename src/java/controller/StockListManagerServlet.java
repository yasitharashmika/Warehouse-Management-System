package controller;

import dao.ItemDAO;
import model.Item;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "StockListManagerServlet", urlPatterns = {"/StockListManagerServlet"})
public class StockListManagerServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ItemDAO dao = new ItemDAO();
        List<Item> itemList = dao.getAllItems();
        request.setAttribute("itemList", itemList);
        request.getRequestDispatcher("manager/stock_list_manager.jsp").forward(request, response);
    }
}
