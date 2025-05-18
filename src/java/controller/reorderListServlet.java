


package controller;

import dao.ReorderDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Reorder;


@WebServlet(name = "reorderListServlet", urlPatterns = {"/reorderListServlet"})
public class reorderListServlet extends HttpServlet {

    
    

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ReorderDAO reorderDAO = new ReorderDAO();
    List<Reorder> reorderList = reorderDAO.getAllReorders();
    request.setAttribute("reorderList", reorderList);
    request.getRequestDispatcher("manager/reorder_list.jsp").forward(request, response);
    }
}

    