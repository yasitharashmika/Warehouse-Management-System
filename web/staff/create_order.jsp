<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="dao.ItemDAO,model.Item" %>
<%@ page import="java.util.List" %>
<%
    ItemDAO itemDAO = new ItemDAO();
    List<Item> items = itemDAO.getAllItems();
    request.setAttribute("items", items);
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">

    <title>Staff Dashboard | Vehicle Parts WMS</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

    <title>Create Order | Vehicle Parts WMS</title>
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
        
        .form-card {
            background: white;
            border-radius: 10px;
            box-shadow: 0 2px 15px rgba(0,0,0,0.1);
            max-width: 600px;
            margin: 0 auto;
        }
    </style>

</head>
<body>
    <!-- Left Sidebar -->
    <div class="sidebar p-3">
        <h4 class="mb-4">WMS Staff</h4>
        <nav class="nav flex-column">

            <a class="nav-link" href="${pageContext.request.contextPath}/StaffDashboardServlet">


            <a class="nav-link" href="${pageContext.request.contextPath}/StaffDashboardServlet">


            <a class="nav-link active-nav" href="dashboard_staff.jsp">
                <i class="fas fa-tachometer-alt me-2"></i>Dashboard
            </a>
            <div class="sidebar-section">ORDERS</div>
            <a class="nav-link" href="create_order.jsp">

            <a class="nav-link" href="dashboard_staff.jsp">

                <i class="fas fa-tachometer-alt me-2"></i>Dashboard
            </a>
            <div class="sidebar-section">ORDERS</div>
            <a class="nav-link active-nav" href="create_order.jsp">

                <i class="fas fa-cart-plus me-2"></i>New Order
            </a>
            <a class="nav-link" href="${pageContext.request.contextPath}/OrderListServlet">
                <i class="fas fa-list-ol me-2"></i>View Orders
            </a>

            <div class="sidebar-section">INVENTORY</div>
            <a class="nav-link" href="${pageContext.request.contextPath}/StockListServlet">
                <i class="fas fa-boxes me-2"></i>Current Stock
            </a>
            <a class="nav-link" href="${pageContext.request.contextPath}/NewStockListServlet">
                <i class="fas fa-exclamation-triangle me-2"></i>New Stock List
            </a>
            <a class="nav-link" href="add_stock.jsp">
                <i class="fas fa-box-open me-2"></i>Add To Stock
            </a>
                <!-- Message Section -->
            <div class="sidebar-section">MESSAGES</div>
             <a class="nav-link " href="${pageContext.request.contextPath}/sendMessage.jsp">
                <i class="fas fa-paper-plane me-2"></i>Send Messages
            </a>
            <a class="nav-link" href="${pageContext.request.contextPath}/ViewStaffMessagesServlet">
                <i class="fas fa-inbox me-2"></i>Inbox
            </a>

        </nav>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <!-- Header -->
        <div class="d-flex justify-content-between align-items-center mb-4">

            <h3><i class="fas fa-clipboard-list me-2"></i>Staff Dashboard</h3>

            <h3><i class="fas fa-file-invoice me-2"></i>Place New Customer Order</h3>

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


        <!-- Dashboard Widgets -->
        <div class="row g-4 mb-4">
            <!-- Pending Orders -->
            <div class="col-md-4">
                <div class="stat-card">
                    <h5><i class="fas fa-clock me-2"></i>Pending Orders</h5>
                    <h2 class="mt-2">15</h2>
                    <small class="text-muted">Orders needing attention</small>
                </div>
            </div>
            
            <!-- Low Stock Alerts -->
            <div class="col-md-4">
                <div class="stat-card">
                    <h5><i class="fas fa-exclamation-triangle me-2"></i>Low Stock</h5>
                    <h2 class="mt-2">8</h2>
                    <small class="text-muted">Items below minimum level</small>
                </div>
            </div>
            
            <!-- Recent Activity -->
            <div class="col-md-4">
                <div class="stat-card">
                    <h5><i class="fas fa-bell me-2"></i>Notifications</h5>
                    <div class="mt-3">
                        <div class="d-flex align-items-center mb-2">
                            <span class="alert-badge me-2">New</span>
                            <span>Turbo Charger X1 low stock</span>
                        </div>
                        <div class="d-flex align-items-center">
                            <span class="alert-badge me-2">Urgent</span>
                            <span>Order #1234 payment pending</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Recent Orders Table -->
        <div class="card shadow-sm">
            <div class="card-header">
                <h5 class="mb-0"><i class="fas fa-file-invoice me-2"></i>Recent Orders</h5>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th>Order ID</th>
                                <th>Customer</th>
                                <th>Total</th>
                                <th>Status</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>#1234</td>
                                <td>John's Garage</td>
                                <td>$450.00</td>
                                <td><span class="badge bg-warning">Pending Payment</span></td>
                                <td>
                                    <a href="update_order_status.jsp?id=1234" class="btn btn-sm btn-primary">
                                        <i class="fas fa-edit me-2"></i>Update
                                    </a>
                                </td>
                            </tr>
                            <!-- Add more rows -->
                        </tbody>
                    </table>
                </div>
            </div>

        <!-- Order Form -->
        <div class="form-card p-4">
            <form action="${pageContext.request.contextPath}/CreateOrderServlet" method="post">
                <div class="mb-3">
                    <label class="form-label">
                        <i class="fas fa-user me-2"></i>Customer Name
                    </label>
                    <input type="text" name="customerName" class="form-control" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">
                        <i class="fas fa-map-marker-alt me-2"></i>Shipping Address
                    </label>
                    <textarea name="shippingAddress" class="form-control" rows="3" required></textarea>
                </div>

                <div class="mb-3">
                    <label class="form-label">
                        <i class="fas fa-box-open me-2"></i>Select Item
                    </label>
                    <select name="itemId" class="form-select" required>
                        <c:forEach var="item" items="${items}">
                            <option value="${item.id}">
                                ${item.name} (Stock: ${item.stockCount})
                            </option>
                        </c:forEach>
                    </select>
                </div>

                <div class="mb-3">
                    <label class="form-label">
                        <i class="fas fa-dollar-sign me-2"></i>Item Price
                    </label>
                    <input type="text" name="itemPrice" id="itemPrice" class="form-control" readonly>
                </div>

                <div class="mb-4">
                    <label class="form-label">
                        <i class="fas fa-hashtag me-2"></i>Quantity
                    </label>
                    <input type="number" name="quantity" class="form-control" min="1" required>
                </div>

                <div class="d-grid gap-2">
                    <button type="submit" class="btn btn-primary btn-lg">
                        <i class="fas fa-check-circle me-2"></i>Place Order
                    </button>
                </div>
          </form>
        </div>
    </div>

    <!-- Bootstrap 5 JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>


    <script>
        // Map itemId to price
        const itemPrices = {
            <c:forEach var="item" items="${items}">
                '${item.id}': ${item.price},
            </c:forEach>
        };

        const itemSelect = document.querySelector('select[name="itemId"]');
        const priceInput = document.getElementById('itemPrice');

        function updatePrice() {
            const selectedId = itemSelect.value;
            priceInput.value = itemPrices[selectedId] ? itemPrices[selectedId].toFixed(2) : '';
        }

        updatePrice();
        itemSelect.addEventListener('change', updatePrice);
    </script>
</body>
</html>

