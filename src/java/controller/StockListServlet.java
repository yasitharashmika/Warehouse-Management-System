package controller;

import dao.ItemDAO;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Item;

@WebServlet(name = "StockListServlet", urlPatterns = {"/StockListServlet"})
public class StockListServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ItemDAO dao = new ItemDAO();
        List<Item> itemList = dao.getAllItems();

        // Store list in session
        HttpSession session = request.getSession();
        session.setAttribute("itemList", itemList);

        // Redirect to JSP page
        response.sendRedirect("staff/stock_list.jsp");
    }
}
