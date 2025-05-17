<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Manager Dashboard | Vehicle Parts WMS</title>
    
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Font Awesome -->
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
            transition: transform 0.3s ease;
        }
        
        .nav-link {
            color: rgba(255,255,255,0.8);
            transition: all 0.3s ease;
            padding: 12px 15px !important;
            border-radius: 8px;
            margin: 2px 0;
        }
        
        .nav-link:hover {
            color: white;
            background: rgba(255,255,255,0.1);
        }
        
        .sidebar-section {
            color: rgba(255,255,255,0.6);
            font-size: 0.75rem;
            text-transform: uppercase;
            letter-spacing: 1px;
            padding: 1rem 1rem 0.5rem;
            margin-top: 1rem;
        }
        
        .active-nav {
            background: rgba(255,255,255,0.15);
            color: white !important;
        }
    </style>
</head>
<body>
    <!-- Left Sidebar -->
    <div class="sidebar p-3">
        <h4 class="mb-4">WMS Manager</h4>
        <nav class="nav flex-column">
            
            <!-- Dashboard -->
            <a class="nav-link active-nav" href="">
                <i class="fas fa-tachometer-alt me-2"></i>Dashboard
            </a>

            <!-- Staff Section -->
            <div class="sidebar-section">STAFF MANAGEMENT</div>
            <a class="nav-link" href="create_staff.jsp">
                <i class="fas fa-user-plus me-2"></i>Create Staff
            </a>
            
            <!-- Message Section -->
            <div class="sidebar-section">MESSAGES</div>
            <a class="nav-link " href="${pageContext.request.contextPath}/sendMessage.jsp">
                <i class="fas fa-paper-plane me-2"></i>Send Messages
            </a>
            <a class="nav-link" href="${pageContext.request.contextPath}/ViewManagerMessagesServlet">
                <i class="fas fa-inbox me-2"></i>Inbox
            </a>

            <!-- Orders Section -->
            <div class="sidebar-section">ORDER MANAGEMENT</div>
            <a class="nav-link" href="${pageContext.request.contextPath}/OrderListServlet">
                <i class="fas fa-list-ol me-2"></i>All Orders
            </a>

            <!-- Inventory Section -->
            <div class="sidebar-section">INVENTORY CONTROL</div>
            <a class="nav-link" href="${pageContext.request.contextPath}/StockListManagerServlet">
                <i class="fas fa-boxes me-2"></i>Current Stock
            </a>
            <a class="nav-link" href="reorder_form.jsp">
                <i class="fas fa-cart-plus me-2"></i>Reorder Form
            </a>
        </nav>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <!-- Header -->
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h3>Dashboard Overview</h3>
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

        <!-- Quick Stats -->
        <div class="row g-4 mb-4">
            <div class="col-md-3">
                <div class="stat-card">
                    <h6 class="text-muted mb-3"><i class="fas fa-coins me-2"></i>Total Revenue</h6>
                    <h3>$<%= request.getAttribute("totalRevenue") != null ? request.getAttribute("totalRevenue") : "0.00" %></h3>
                </div>
            </div>
            <div class="col-md-3">
                <div class="stat-card">
                    <h6 class="text-muted mb-3"><i class="fas fa-boxes me-2"></i>Total Orders</h6>
                    <h3><%= request.getAttribute("totalOrders") != null ? request.getAttribute("totalOrders") : "0" %></h3>
                </div>
            </div>
            <div class="col-md-3">
                <div class="stat-card">
                    <h6 class="text-muted mb-3"><i class="fas fa-calendar-day me-2"></i>Today's Income</h6>
                    <h3>$<%= request.getAttribute("todaysIncome") != null ? request.getAttribute("todaysIncome") : "0.00" %></h3>
                </div>
            </div>
            <div class="col-md-3">
                <div class="stat-card">
                    <h6 class="text-muted mb-3"><i class="fas fa-exclamation-circle me-2"></i>Stock Alerts</h6>
                    <h3><%= request.getAttribute("lowStockCount") != null ? request.getAttribute("lowStockCount") : "0" %> Items</h3>
                </div>
            </div>
        </div>

        <!-- Content Sections -->
        <div class="row g-4">
            <!-- Left Column -->
            <div class="col-lg-8">
                <!-- Stock Alerts Table -->
                <div class="card">
                    <div class="card-header d-flex justify-content-between align-items-center">
                        <h5 class="mb-0"><i class="fas fa-exclamation-triangle me-2"></i>Critical Stock Items</h5>
                        <a href="alerts_manager.jsp" class="btn btn-sm btn-primary">
                            <i class="fas fa-eye me-2"></i>View All
                        </a>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>Part Name</th>
                                        <th>Current Stock</th>
                                        <th>Minimum Level</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>Turbo Charger X1</td>
                                        <td class="text-danger">5</td>
                                        <td>20</td>
                                        <td>
                                            <a href="reorder_form.jsp" class="btn btn-sm btn-warning">
                                                <i class="fas fa-cart-plus me-2"></i>Reorder
                                            </a>
                                        </td>
                                    </tr>
                                    <!-- Add more rows dynamically -->
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Right Column -->
            <div class="col-lg-4">
                <!-- Quick Actions -->
                <div class="card">
                    <div class="card-header">
                        <h5 class="mb-0"><i class="fas fa-bolt me-2"></i>Quick Actions</h5>
                    </div>
                    <div class="card-body">
                        <div class="d-grid gap-2">
                            <a href="create_staff.jsp" class="btn btn-primary">
                                <i class="fas fa-user-plus me-2"></i>New Staff
                            </a>
                            <a href="order_list_manager.jsp" class="btn btn-success">
                                <i class="fas fa-shipping-fast me-2"></i>Process Orders
                            </a>
                            <a href="stock_list_manager.jsp" class="btn btn-info">
                                <i class="fas fa-boxes me-2"></i>Check Inventory
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap 5 JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
