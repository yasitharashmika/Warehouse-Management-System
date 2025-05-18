<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Item" %>
<jsp:useBean id="itemDAO" class="dao.ItemDAO" scope="page" />
<%
    List<Item> items = itemDAO.getAllItems();
    request.setAttribute("items", items);
%>

<!DOCTYPE html>
<html>
<head>
    <title>Add New Stock</title>
    <meta charset="UTF-8">
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
            padding: 20px;
        }
        
        .main-content {
            margin-left: 250px;
            padding: 30px;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }
        
        .form-container {
            background: white;
            border-radius: 10px;
            padding: 25px;
            box-shadow: 0 2px 15px rgba(0,0,0,0.1);
            max-width: 600px;
            margin: auto;
            width: 100%;
        }
        
        .content-wrapper {
            flex: 1;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        
        .nav-link {
            color: rgba(255,255,255,0.8);
            padding: 8px 12px;
            border-radius: 4px;
            transition: background 0.2s;
        }
        
        .nav-link:hover {
            background: rgba(255,255,255,0.1);
        }
    </style>
</head>
<body>
    <!-- Left Sidebar -->
    <div class="sidebar">
        <h4 class="text-white mb-4">WMS Staff</h4>
        <nav class="nav flex-column">
            <a class="nav-link" href="${pageContext.request.contextPath}/StaffDashboardServlet">
                <i class="fas fa-tachometer-alt me-2"></i>Dashboard
            </a>
        </nav>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <!-- Header -->
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h3><i class="fas fa-boxes me-2"></i>Add New Stock</h3>
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

        <!-- Message Display -->
        <c:if test="${not empty message}">
            <div class="alert alert-success mb-4">
                <i class="fas fa-check-circle me-2"></i>${message}
            </div>
        </c:if>

        <!-- Centered Form -->
        <div class="content-wrapper">
            <div class="form-container">
                <form action="${pageContext.request.contextPath}/AddStockServlet" method="post">
                    <div class="mb-4">
                        <label class="form-label"><i class="fas fa-cube me-2"></i>Select Item:</label>
                        <select class="form-select" name="itemId" required>
                            <c:forEach var="item" items="${items}">
                                <option value="${item.id}">${item.name}</option>
                            </c:forEach>
                        </select>
                    </div>

                    <div class="mb-4">
                        <label class="form-label"><i class="fas fa-hashtag me-2"></i>Quantity Received:</label>
                        <input type="number" class="form-control" name="quantity" min="1" required>
                    </div>

                    <div class="d-grid">
                        <button type="submit" class="btn btn-primary btn-lg">
                            <i class="fas fa-save me-2"></i>Update Stock
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Bootstrap 5 JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>