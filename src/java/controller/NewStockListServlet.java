
package controller;

import dao.ReorderRequestDAO;
import model.ReorderRequest;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;
import javax.servlet.annotation.WebServlet;


@WebServlet(name = "NewStockListServlet", urlPatterns = {"/NewStockListServlet"})
public class NewStockListServlet extends HttpServlet {
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ReorderRequestDAO dao = new ReorderRequestDAO();
        List<ReorderRequest> requests = dao.getAllReorderRequests();

        request.setAttribute("reorderRequests", requests);
        request.setAttribute("count", requests.size());
        RequestDispatcher dispatcher = request.getRequestDispatcher("staff/new_stock_list.jsp");
        dispatcher.forward(request, response);
    }
}
