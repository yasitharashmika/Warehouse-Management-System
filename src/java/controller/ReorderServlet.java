package controller;

import dao.ReorderDAO;
import model.Reorder;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.time.LocalDate;

@WebServlet(name = "ReorderServlet", urlPatterns = {"/ReorderServlet"})
public class ReorderServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Reorder reorder = new Reorder();
        reorder.setPartName(request.getParameter("partName"));
        reorder.setQuantity(Integer.parseInt(request.getParameter("quantity")));
        reorder.setSupplierInfo(request.getParameter("supplierInfo"));
        reorder.setDeliveryDate(LocalDate.parse(request.getParameter("deliveryDate")));
        reorder.setUrgency(request.getParameter("urgency"));

        ReorderDAO dao = new ReorderDAO();
        dao.insertReorder(reorder);

        request.setAttribute("message", "Reorder request submitted successfully.");
        // Redirect to the list page after insertion:
        response.sendRedirect("manager/reorder_form.jsp");
    }
}
