<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, model.Order" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Customer Orders | Vehicle Parts WMS</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        :root {
            --primary-color: #2c3e50;
            --secondary-color: #3498db;
            --accent-color: #e74c3c;
        }
        
        body {
            background-color: #f8f9fa;
            min-height: 100vh;
        }
        
        .sidebar {
            background-color: var(--primary-color);
            min-height: 100vh;
            color: white;
            width: 250px;
            position: fixed;
        }
        
        .main-content {
            margin-left: 250px;
            padding: 20px;
        }
        
        .table-hover tbody tr:hover {
            background-color: rgba(52, 152, 219, 0.1);
        }
    </style>
</head>
<body>
    <!-- Left Sidebar -->
    <div class="sidebar p-3">
        <h4 class="mb-4">WMS Manager</h4>
        <nav class="nav flex-column">
            
               
          
            
        </nav>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <!-- Header -->
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h3><i class="fas fa-file-invoice me-2"></i>Customer Orders</h3>
            <div class="d-flex align-items-center">
                <span class="me-3 text-muted">
                    <i class="fas fa-user-circle me-2"></i>
                    <%= session.getAttribute("username") %>
                </span>
                <a href="${pageContext.request.contextPath}/LogoutServlet" class="btn btn-sm btn-outline-secondary">
                    <i class="fas fa-sign-out-alt"></i>
                </a>
            </div>
        </div>

        <!-- Orders Table -->
        <div class="card shadow-sm">
            <div class="card-body">
                <%
                    List<Order> orders = (List<Order>) request.getAttribute("orderList");
                    if (orders == null || orders.isEmpty()) {
                %>
                    <div class="alert alert-warning">No orders found.</div>
                <%
                    } else {
                %>
                <div class="table-responsive">
                    <table class="table table-hover align-middle">
                        <thead class="table-dark">
                            <tr>
                                <th><i class="fas fa-hashtag"></i> ID</th>
                                <th><i class="fas fa-cube"></i> Item</th>
                                <th><i class="fas fa-hashtag"></i> Quantity</th>
                                <th><i class="fas fa-calendar-day"></i> Date</th>
                                <th><i class="fas fa-user"></i> Customer</th>
                                <th><i class="fas fa-map-marker-alt"></i> Shipping Address</th>
                                <th><i class="fas fa-dollar-sign"></i> Item Price</th>
                                <th><i class="fas fa-truck"></i> Status</th>
                                <th><i class="fas fa-edit"></i> Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                for (Order order : orders) {
                            %>
                            <tr>
                                <td><%= order.getId() %></td>
                                <td><%= order.getItemName() %></td>
                                <td><%= order.getQuantity() %></td>
                                <td><%= order.getOrderDate() %></td>
                                <td><%= order.getCustomerName() != null ? order.getCustomerName() : "N/A" %></td>
                                <td><%= order.getShippingAddress() != null ? order.getShippingAddress() : "N/A" %></td>
                                <td><fmt:formatNumber value="<%= order.getItemPrice() %>" type="currency" currencySymbol="$"/></td>
                                <td><%= order.getStatus() != null ? order.getStatus() : "Waiting Payment" %></td>
                                <td>
                                    <form method="post" action="${pageContext.request.contextPath}/OrderListServlet">
                                        <input type="hidden" name="orderId" value="<%= order.getId() %>" />
                                        <input type="hidden" name="newStatus" value="Shipped" />
                                        <button type="submit" class="btn btn-sm btn-success"
                                            <%= "Shipped".equals(order.getStatus()) ? "disabled" : "" %>>
                                            Mark as Shipped
                                        </button>
                                    </form>
                                </td>
                            </tr>
                            <%
                                }
                            %>
                        </tbody>
                    </table>
                </div>
                <%
                    }
                %>
            </div>
        </div>
    </div>

    <!-- Bootstrap 5 JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
