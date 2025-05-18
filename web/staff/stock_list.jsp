<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Stock List | Vehicle Parts WMS</title>
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

        .card {
            border-radius: 10px;
            box-shadow: 0 2px 15px rgba(0,0,0,0.1);
        }

        .low-stock {
            color: var(--accent-color);
            font-weight: 500;
        }
    </style>
</head>
<body>
    <!-- Sidebar -->
    <div class="sidebar p-3">
        <h4 class="mb-4">WMS Manager</h4>
        <nav class="nav flex-column">
            <a class="nav-link" href="${pageContext.request.contextPath}/StaffDashboardServlet">
                <i class="fas fa-tachometer-alt me-2"></i>Dashboard
            </a>
            <div class="sidebar-section">INVENTORY</div>
            <a class="nav-link active-nav" href="<c:url value='/staff/stock_list.jsp'/>">
                <i class="fas fa-boxes me-2"></i>Stock List
            </a>
            
        </nav>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h3><i class="fas fa-boxes me-2"></i>Current Stock List</h3>
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

        <!-- Card View with Low Stock Indicators -->
        <div class="card shadow-sm mb-5">
            <div class="card-body">
                <c:if test="${empty sessionScope.itemList}">
                    <div class="alert alert-warning mb-0">No inventory items found.</div>
                </c:if>

                <c:if test="${not empty sessionScope.itemList}">
                    <div class="table-responsive">
                        <table class="table table-hover align-middle">
                            <thead class="table-dark">
                                <tr>
                                    <th><i class="fas fa-hashtag"></i> ID</th>
                                    <th><i class="fas fa-cube"></i> Item Name</th>
                                    <th><i class="fas fa-layer-group"></i> Stock Count</th>
                                    <th><i class="fas fa-tag"></i> Price</th>
                                    <th><i class="fas fa-exclamation-circle"></i> Status</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="item" items="${sessionScope.itemList}">
                                    <tr>
                                        <td>${item.id}</td>
                                        <td>${item.name}</td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${item.stockCount < 10}">
                                                    <span class="low-stock">${item.stockCount}</span>
                                                </c:when>
                                                <c:otherwise>
                                                    ${item.stockCount}
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td>
                                            <fmt:formatNumber value="${item.price}" type="currency" currencySymbol="$"/>
                                        </td>
                                        <td>
                                            <c:if test="${item.stockCount < 15}">
                                                <span class="badge bg-danger">Low Stock</span>
                                            </c:if>
                                            <c:if test="${item.stockCount >= 15}">
                                                <span class="badge bg-success">In Stock</span>
                                            </c:if>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </c:if>
            </div>
        </div>

    <!-- Bootstrap 5 JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
