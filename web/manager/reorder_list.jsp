<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Reorder Requests | Vehicle Parts WMS</title>
    
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
        
        .table-hover tbody tr:hover {
            background-color: rgba(52, 152, 219, 0.1);
        }
        
        .card {
            border-radius: 10px;
            box-shadow: 0 2px 15px rgba(0,0,0,0.1);
        }
    </style>
</head>
<body>
    <!-- Left Sidebar -->
    <div class="sidebar p-3">
        <h4 class="mb-4">WMS Manager</h4>
        <nav class="nav flex-column">
            <a class="nav-link" href="<c:url value='/manager/dashboard_manager.jsp'/>">
                <i class="fas fa-tachometer-alt me-2"></i>Dashboard
            </a>
            <div class="sidebar-section">INVENTORY CONTROL</div>
            <a class="nav-link" href="${pageContext.request.contextPath}/StockListManagerServlet">
                <i class="fas fa-boxes me-2"></i>Current Stock
            </a>
            
        </nav>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <!-- Header -->
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h3><i class="fas fa-clipboard-list me-2"></i>Reorder Requests</h3>
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

        <!-- Content -->
        <div class="card shadow-sm">
            <div class="card-body">
                <c:if test="${empty reorderList}">
                    <div class="alert alert-warning mb-0">No reorder requests found.</div>
                </c:if>

                <c:if test="${not empty reorderList}">
                    <div class="table-responsive">
                        <table class="table table-hover align-middle">
                            <thead class="table-dark">
                                <tr>
                                    <th><i class="fas fa-hashtag"></i> ID</th>
                                    <th><i class="fas fa-box-open"></i> Part Name</th>
                                    <th><i class="fas fa-cubes"></i> Quantity</th>
                                    <th><i class="fas fa-truck"></i> Supplier</th>
                                    <th><i class="fas fa-calendar-day"></i> Delivery Date</th>
                                    <th><i class="fas fa-exclamation-triangle"></i> Urgency</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="reorder" items="${reorderList}">
                                    <tr>
                                        <td>${reorder.id}</td>
                                        <td>${reorder.partName}</td>
                                        <td>${reorder.quantity}</td>
                                        <td>${reorder.supplierInfo}</td>
                                        <td>${reorder.deliveryDate}</td>
                                        <td>${reorder.urgency}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </c:if>

                <div class="mt-4">
                    <a href="manager/reorder_form.jsp" class="btn btn-primary">
                        <i class="fas fa-cart-plus me-2"></i>Create New Reorder
                    </a>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap 5 JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>