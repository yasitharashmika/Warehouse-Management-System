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
</head>

<body>
<!-- Sidebar -->
<div class="sidebar p-3">
    <h4 class="mb-4">WMS Manager</h4>
    <nav class="nav flex-column">
        <a class="nav-link text-white" href="manager/dashboard_manager.jsp">
            <i class="fas fa-tachometer-alt me-2"></i> Dashboard
        </a>
       
        <a class="nav-link text-white" href="manager/reorder_form.jsp">
            <i class="fas fa-cart-plus me-2"></i> Reorder Stock
        </a>
        <a class="nav-link text-white" href="LogoutServlet">
            <i class="fas fa-sign-out-alt me-2"></i> Logout
        </a>
    </nav>
</div>

<!-- Main Content -->
<div class="main-content">
    <h3><i class="fas fa-boxes me-2"></i>Current Stock</h3>
    <div class="card mt-4">
        <div class="card-body">
            <c:if test="${empty itemList}">
                <div class="alert alert-warning">No stock data available.</div>
            </c:if>
            <c:if test="${not empty itemList}">
                <div class="table-responsive">
                    <table class="table table-bordered table-hover align-middle">
                        <thead class="table-dark">
                            <tr>
                                <th>ID</th>
                                <th>Item Name</th>
                                <th>Stock Count</th>
                                <th>Price</th>
                                <th>Status</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="item" items="${itemList}">
                                <tr>
                                    <td>${item.id}</td>
                                    <td>${item.name}</td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${item.stockCount < 15}">
                                                <span class="low-stock">${item.stockCount}</span>
                                            </c:when>
                                            <c:otherwise>
                                                ${item.stockCount}
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td><fmt:formatNumber value="${item.price}" type="currency" currencySymbol="$" /></td>
                                    <td>
                                        <c:if test="${item.stockCount < 15}">
                                            <span class="badge bg-danger">Low Stock</span>
                                        </c:if>
                                        <c:if test="${item.stockCount >= 15}">
                                            <span class="badge bg-success">In Stock</span>
                                        </c:if>
                                    </td>
                                    <td>
                                        <a href="manager/reorder_form.jsp?itemId=${item.id}" class="btn btn-sm btn-outline-primary">
                                            <i class="fas fa-cart-plus"></i> Reorder
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </c:if>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
