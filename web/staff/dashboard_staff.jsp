<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Staff Dashboard | Vehicle Parts WMS</title>
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
        
        .stat-card {
            background: white;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 2px 15px rgba(0,0,0,0.1);
        }
        
        .alert-badge {
            background: var(--accent-color);
            color: white;
            padding: 5px 10px;
            border-radius: 20px;
            font-size: 0.9em;
        }
    </style>
</head>
<body>
    <!-- Left Sidebar -->
    <div class="sidebar p-3">
        <h4 class="mb-4">WMS Staff</h4>
        <nav class="nav flex-column">
            <a class="nav-link active-nav" href="dashboard_staff.jsp">
                <i class="fas fa-tachometer-alt me-2"></i>Dashboard
            </a>
            <div class="sidebar-section">ORDERS</div>
            <a class="nav-link" href="create_order.jsp">
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
        </div>
    </div>

    <!-- Bootstrap 5 JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>