<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Order Success | Vehicle Parts WMS</title>
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
        
        .success-card {
            max-width: 600px;
            margin: 2rem auto;
        }
    </style>
</head>
<body>
    <!-- Left Sidebar -->
    <div class="sidebar p-3">
        <h4 class="mb-4">WMS Manager</h4>
        <nav class="nav flex-column">
            <a class="nav-link" href="${pageContext.request.contextPath}/StaffDashboardServlet">
                <i class="fas fa-tachometer-alt me-2"></i>Dashboard
            </a>
            <div class="sidebar-section">ACTIONS</div>
            <a class="nav-link" href="create_order.jsp">
                <i class="fas fa-cart-plus me-2"></i>New Order
            </a>
            <a class="nav-link" href="${pageContext.request.contextPath}/OrderListServlet">
                <i class="fas fa-list-ol me-2"></i>View Orders
            </a>
        </nav>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <!-- Header -->
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h3><i class="fas fa-check-circle me-2"></i>Order Success</h3>
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

        <!-- Success Content -->
        <div class="success-card">
            <div class="alert alert-success">
                <h4 class="alert-heading"><i class="fas fa-check-circle me-2"></i>Order Placed Successfully!</h4>
                <p class="mt-3">Your order has been processed and recorded in the system.</p>
                <hr>
                <div class="d-flex justify-content-center gap-3 mt-4">
                    <a href="create_order.jsp" class="btn btn-outline-success">
                        <i class="fas fa-cart-plus me-2"></i>New Order
                    </a>
                    <a href="dashboard_staff.jsp" class="btn btn-outline-primary">
                        <i class="fas fa-home me-2"></i>Dashboard
                    </a>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap 5 JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>